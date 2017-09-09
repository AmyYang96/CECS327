/**
Names:Amy Yang
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

#define BUFFER_LENGTH 2048 //!<Buffer length constant
#define WAITING_TIME 1000000 //!<Waiting time constant

///
///Creates connection to a port
///
int create_connection(std::string host /**< [in]host ip*/, int port /**< [in]port number*/)
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
    return s /**< [out]return integer if socket connection is created*/;
}

///
///Sends a message to the server
///
int request(int sock /**< [in] Socket number*/, std::string message/**< [in]message to be sent to the server*/)
{
    return send(sock, message.c_str(), message.size(), 0); //returns size of message
}

///
///Takes the message from the server and returns thge message to the client
///
std::string reply(int s/**< [in]socket*/)
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

    return strReply/**< [out]Reply from the server*/;
}

///
///Requests reponse from the server
///
std::string request_reply(int s /**< [in] Socket number*/, std::string message/**< [in]message to be sent to the server*/)
{
	if (request(s, message) > 0) //get reply message if there is a reply
  {
    	return reply(s);
	}
	return "";
}

///
///Prints the reply message with status code
///
void printMessage (std::string strReply/**< [in]message to be displayed*/)
{
  //get status code
  int status = std::stoi((strReply.substr(0,3)));
  strReply= strReply.substr(4,strReply.length());//remove status code from message

  //print status code
  std::cout << "STATUS CODE--->" << status << std::endl;
  //print message
  std::cout << "MESSAGE--->" << strReply << std::endl;
}

///
///Enters passive mode
///
int enterPassive(int sockpi /**< [in]socket to server*/)
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

    return sockdtp /**< [out]data server socket number*/;
}

///
///Executes command to server
///
void command(int sockpi /**< [in] socket to server*/, std::string commandName /**< [in] name of command*/)
{
    int sockdtp = enterPassive(sockpi);//gets the socket for data server after entering passive mode
    std::string strReply;

    //request reply from the server for list
    strReply = request_reply(sockpi, commandName + "\r\n");

    //print message
    printMessage(strReply);

    //request reply from the data server for the list
    strReply = reply(sockdtp);

    //print out the list
    std::cout << strReply << std::endl;

    //close socket
    strReply = request_reply(sockdtp, "QUIT\r\n");
  //  strReply = request_reply(sockpi, "QUIT\r\n");

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
    std::cout << strReply  << std::endl;


    strReply = request_reply(sockpi, "USER anonymous\r\n");
    //TODO parse srtReply to obtain the status.

    int status;

    // Let the system act according to the status and display
    // friendly message to the user
    printMessage(strReply);

    strReply = request_reply(sockpi, "PASS asa@asas.com\r\n");


    //print message
    printMessage(strReply);

    command(sockpi, "LIST"); //Execute LIST command

    command(sockpi, "RETR UMINFO.AFA"); //Execute retreive

    command(sockpi, "RETR welcome.msg"); //Execute retreive
    //quit out
    strReply = request_reply(sockpi, "QUIT\r\n");

    //print message
    printMessage(strReply);
    return 0;
}
