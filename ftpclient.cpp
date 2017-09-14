/**
@brief This project functions as an FTP client
@author Amy Yang
*/
#include <iostream>    //cout
#include <string>
#include <stdio.h> //printf
#include <stdlib.h>
#include <string.h>    //strlen
#include <sys/socket.h>    //socket
#include <arpa/inet.h> //inet_addr
#include <netinet/in.h>
#include <sys/types.h>
#include <unistd.h>
#include <netdb.h>

#define BUFFER_LENGTH 2048 //Buffer length constant
#define WAITING_TIME 1000000 //Waiting time constant

/**
  Creates connection to a port
  @param host host ip
  @param port port number
  @return socket number
*/
int create_connection(std::string host, int port )
{
    int s;//integer returned from socket creation
    struct sockaddr_in saddr;//socket address

    memset(&saddr,0, sizeof(saddr));//fill bytes in saddr
    s = socket(AF_INET,SOCK_STREAM,0); //create socket
    saddr.sin_family=AF_INET;
    saddr.sin_port= htons(port);

    int a1,a2,a3,a4;//ip address ports

    if (sscanf(host.c_str(), "%d.%d.%d.%d", &a1, &a2, &a3, &a4 ) == 4)//delimits the ip address
    {
        std::cout << "by ip";
        saddr.sin_addr.s_addr =  inet_addr(host.c_str());
    }
    else //else get the address by name
    {
        std::cout << "by name";
        hostent *record = gethostbyname(host.c_str());
        in_addr *addressptr = (in_addr *)record->h_addr;
        saddr.sin_addr = *addressptr;
    }

    //connect to server, exits if there is an error
    if(connect(s,(struct sockaddr *)&saddr,sizeof(struct sockaddr))==-1)
    {
        perror("connection fail");
        exit(1);
        return -1;
    }
    return s ;
}

/**
  Sends a message to the server
  @param sock Socket number
  @param message message to be sent to the server
  @return Size of message
*/
int request(int sock , std::string message)
{
    return send(sock, message.c_str(), message.size(), 0); //returns size of message
}

/**
  Takes the message from the server and returns thge message to the client
  @param s socket NUMBER
  @return Reply from the server
*/
std::string reply(int s)
{
    std::string strReply;
    int count;
    char buffer[BUFFER_LENGTH+1];

    usleep(WAITING_TIME);//sleep

    //get message from buffer
    do {
        count = recv(s, buffer, BUFFER_LENGTH, 0);
        buffer[count] = '\0';
        strReply += buffer;
    }while (count ==  BUFFER_LENGTH);

    return strReply;
}

/**
  Requests reponse from the server
  @param s Socket number
  @param message Message to be sent to the server
  @return String messsage or empty string
*/
std::string request_reply(int s, std::string message)
{
	if (request(s, message) > 0) //get reply message if there is a reply
  {
    	return reply(s);
	}
	return "";
}

/**
  Prints the reply message with status code
  @param strReply message to be displayed
*/
int printMessage (std::string strReply)
{
  //get status code
  int status = std::stoi((strReply.substr(0,3)));
  strReply= strReply.substr(4,strReply.length());//remove status code from message

  //print status code
  std::cout << "STATUS CODE--->" << status << std::endl;
  //print message
  std::cout << "MESSAGE--->" << strReply << std::endl;
  return status;
}

/**
  Enters passive mode
  @param sockpi socket to server
  @return data server socket number
*/
int enterPassive(int sockpi)
{
    int sockdtp;//socket to data server
    std::string strReply;

    //implement PASV
    strReply = request_reply(sockpi, "PASV\r\n");

    //print message
    printMessage(strReply);

    //get last two numbers
    int b1,b2,b3,b4,b5,b6;

    //only want numbers in parentheses
    int start = strReply.find("(");//find open parentheses
    int end = strReply.find(")");//find close parentheses
    std::string numbers = strReply.substr (start+1, end-start-1);//list of numbers

    if (sscanf(numbers.c_str(), "%d,%d,%d,%d,%d,%d", &b1, &b2, &b3, &b4, &b5, &b6 ) == 6)
    {
        std::cout << "first #: " << b5 << ", second #: " << b6 << std::endl;//print numbers to verify
    }
    else
    {
        std::cout << "by name";
    }

    int port = ((b5 << 8)|b6);//get port number

    std::cout << "Port: " << port << std::endl; //print port number

    sockdtp = create_connection("130.179.16.134", port); //create connection to data server
    std::cout << " Connection established. " << sockdtp << std::endl;

    return sockdtp ;
}

/**
  Executes command to server
  @param sockpi Socket to server
  @param commandName Name of command
*/
void command(int sockpi , std::string commandName )
{
    int sockdtp = enterPassive(sockpi);//gets the socket for data server after entering passive mode
    std::string strReply;

    //request reply from the server for list
    strReply = request_reply(sockpi, commandName + "\r\n");

    //print message
    int status = printMessage(strReply);

    if (status == 150) {
      //request reply from the data server for the list
      strReply = reply(sockdtp);

      //print out the list
      std::cout << strReply << std::endl;
    } else {
      close(sockdtp);
      //strReply = reply(sockpi);
      //std::cout << strReply << std::endl;
      return;
    }

    //close socket
    //strReply = request_reply(sockdtp, "QUIT\r\n");
    close(sockdtp);
    //strReply = request_reply(sockpi, "QUIT\r\n");
    strReply = reply(sockpi);

    std::cout << "QUIT MESSAGE" << std::endl;
    printMessage(strReply);
    std::cout << "QUIT MESSAGE" << std::endl;

}

int main(int argc , char *argv[])
{
    int sockpi;
    int sockdtp;
    std::string strReply;

    //TODO  arg[1] can be a dns or an IP address.
    if (argc > 2)
        sockpi = create_connection(argv[1], atoi(argv[2]));
    if (argc == 2)
        sockpi = create_connection(argv[1], 21);
    else
        sockpi = create_connection("130.179.16.134", 21);
    strReply = reply(sockpi);
    //std::cout << strReply  << std::endl;
    printMessage(strReply);

    strReply = request_reply(sockpi, "USER anonymous\r\n");
    //TODO parse srtReply to obtain the status.

    int status;

    // Let the system act according to the status and display
    // friendly message to the user
    printMessage(strReply);

    strReply = request_reply(sockpi, "PASS asa@asas.com\r\n");


    //print message
    printMessage(strReply);
    bool isRunning = true;
    while (isRunning)
    {
        std::cout << "Enter choice to choose a command" << std::endl;
        std::cout << "1. LIST" << std::endl;
        std::cout << "2. RETR" << std::endl;
        std::cout << "3. CD" << std::endl;
        std::cout << "4. QUIT" << std::endl;

        int input;
        std::cin >> input;
        
        if(std::cin.fail()) {
	    std::cin.clear();
            std::cin.ignore();
            input = 0;
        }
        switch(input) {
            case 1 : command(sockpi, "LIST"); //Execute LIST command
                     break;
            case 2 : {
                     std::cout << "Enter the file name to retrieve: " << std::endl;
                     std::string filename;
                     std::cin >> filename;
                     command(sockpi, "RETR " + filename); }
                     break;
            case 3 : {
                     std::cout << "Enter folder name: " << std::endl;
                     std::string foldername;
                     std::cin >> foldername;
                     command(sockpi, "CWD " + foldername); }
                     break;
            case 4 : {
                     isRunning = false; }
                     break;
            default: std::cout << "OOPS" << std::endl; break; 
        }
    }
    //command(sockpi, "LIST"); //Execute LIST command

    //command(sockpi, "RETR UMINFO.AFA"); //Execute retreive

    //command(sockpi, "RETR welcome.msg"); //Execute retreive
    //quit out
    strReply = request_reply(sockpi, "QUIT\r\n");

    //print message
    printMessage(strReply);
    return 0;
}
