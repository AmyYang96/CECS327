/**
    C++ client example using sockets.
    This programs can be compiled in linux and with minor modification in 
	   mac (mainly on the name of the headers)
    Windows requires extra lines of code and different headers
#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>

// Need to link with Ws2_32.lib, Mswsock.lib, and Advapi32.lib
#pragma comment(lib, "Ws2_32.lib")
...
WSADATA wsaData;
iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
...
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

#define BUFFER_LENGTH 2048
#define WAITING_TIME 1000000

int create_connection(std::string host, int port)
{
    int s;
    struct sockaddr_in saddr;
    
    memset(&saddr,0, sizeof(saddr));
    s = socket(AF_INET,SOCK_STREAM,0);
    saddr.sin_family=AF_INET;
    saddr.sin_port= htons(port);
    
    int a1,a2,a3,a4;
    if (sscanf(host.c_str(), "%d.%d.%d.%d", &a1, &a2, &a3, &a4 ) == 4)
    {
        std::cout << "by ip";
        saddr.sin_addr.s_addr =  inet_addr(host.c_str());
    }
    else {
        std::cout << "by name";
        hostent *record = gethostbyname(host.c_str());
        in_addr *addressptr = (in_addr *)record->h_addr;
        saddr.sin_addr = *addressptr;
    }
    if(connect(s,(struct sockaddr *)&saddr,sizeof(struct sockaddr))==-1)
    {
        perror("connection fail");
        exit(1);
        return -1;
    }
    return s;
}

int request(int sock, std::string message)
{
    return send(sock, message.c_str(), message.size(), 0);
}

std::string reply(int s)
{
    std::string strReply;
    int count;
    char buffer[BUFFER_LENGTH+1];
    
    usleep(WAITING_TIME);
    do {
        count = recv(s, buffer, BUFFER_LENGTH, 0);
        buffer[count] = '\0';
        strReply += buffer;
    }while (count ==  BUFFER_LENGTH);
    return strReply;
}

std::string request_reply(int s, std::string message)
{
	if (request(s, message) > 0)
    {
    	return reply(s);
	}
	return "";
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
    
    //get status code
    status = std::stoi((strReply.substr(0,3)));
    //print status code
    std::cout << "STATUS CODE--->" << status << std::endl;
    //print message
    std::cout << "MESSAGE--->" << strReply << std::endl;
    
    strReply = request_reply(sockpi, "PASS asa@asas.com\r\n");
   
    //get status code
    status = std::stoi((strReply.substr(0,3)));
    //print status code
    std::cout << "STATUS CODE--->" << status << std::endl;
    //print message
    std::cout << "MESSAGE--->" << strReply << std::endl;

    //implement PASV
    strReply = request_reply(sockpi, "PASV\r\n");
    //get status code
    status = std::stoi((strReply.substr(0,3)));
    //print status code
    std::cout << "STATUS CODE--->" << status << std::endl;
    //print message
    std::cout << "MESSAGE--->" << strReply << std::endl;
    //get last two numbers

    std::cout << "test" << std::endl;

    int b1,b2,b3,b4,b5,b6;

    int start = strReply.find("(");
    int end = strReply.find(")");
    std::cout << start << ", " << end << std::endl;    

    std::string numbers = strReply.substr (start+1, end-start-1);
    //std::regex_search(strReply,"\(([^\)]+)\)")

    if (sscanf(numbers.c_str(), "%d,%d,%d,%d,%d,%d", &b1, &b2, &b3, &b4, &b5, &b6 ) == 6)
    {
        std::cout << "first # " << b5 << ", second # " << b6 << std::endl;

    }
    else {
        std::cout << "by name";
    }

    int port = ((b5 << 8)|b6);
    
    std::cout << port << std::endl;

    sockdtp = create_connection("130.179.16.134", port);
    std::cout << "works " << sockdtp << std::endl;
 
    //implement LIST

    //request reply from the server for list
    strReply = request_reply(sockpi, "LIST\r\n");

    //print out message
    std::cout << strReply << std::endl;

    //request reply from the data server for the list
    strReply = reply(sockdtp);

    //request reply from server for retreive
    strReply = request_reply(sockpi, "RETR welcome.msp\r\n");

    //print out message
    std::cout << strReply << std::endl;

    //request reply from the data server for retreive
    strReply = reply(sockdtp);

    //print out message
    std::cout << strReply << std::endl;
    
    //TODO implement PASV, LIST, RETR. 
    // Hint: implement a function that set the SP in passive mode and accept commands.

    //print out the list
    std::cout << strReply << std::endl;
    //quit out
    //strReply = request_reply(sockpi, "QUIT\r\n");
    return 0;
}