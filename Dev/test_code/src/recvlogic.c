#include "recvlogic.h"
#include "service_config.h"

#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <linux/tcp.h> /* #define TCP_NODELAY 1 */

/****************************************************************************
Socket related struct and functions definition
-----------------------------------------------------------------------------
<stdio.h>
 -- perror()

<netinet/in.h>
 -- struct sockaddr_in

<sys/socket.h>
#include <sys/types.h>
 -- socket()

****************************************************************************/

//static void error_die(const char *msg);
static int disable_tcp_nagle(int sockfd);
static void accept_request(const int client_sockfd);

int startup(uint16_t port)
{
	int retcode = 0;
	int server_sockfd = 0;
	struct sockaddr_in sock_addr = { 0 };

	server_sockfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (server_sockfd <= 0)
	{
		error_echo("socket() failed.");
		retcode = server_sockfd;
		goto EXIT;
	}

	disable_tcp_nagle(server_sockfd);

	memset(&sock_addr, 0, sizeof(struct sockaddr_in));
	sock_addr.sin_family = AF_INET;
	sock_addr.sin_port = htons(port);
	sock_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	retcode = bind(server_sockfd, (struct sockaddr *)(&sock_addr), sizeof(struct sockaddr_in));
	if (retcode < 0)
	{
		error_echo("bind() failed.");
		goto EXIT;
	}

	retcode = listen(server_sockfd, 5);
	if (retcode < 0)
	{
		error_echo("listen() failed.");
		goto EXIT;
	}

	retcode = server_sockfd;

EXIT:
	return(retcode);
}


void mainloop_recv(const int server_sockfd)
{
	int client_sockfd = -1;
	size_t client_addr_len = sizeof(struct sockaddr_in);
	struct sockaddr_in client_addr = { 0 };

	while (1)
	{
		client_sockfd = accept(server_sockfd, (struct sockaddr *)&client_addr, (socklen_t *)(&client_addr_len));
		if (client_sockfd <= 0)
		{
			error_echo("accept() failed.");
			break;
		}

		accept_request(client_sockfd);
	}
}


void error_echo(const char *msg)
{
	//ZF_LOGF("%s", msg);

	perror(msg);
}



/*
static void error_die(const char *msg)
{
	//ZF_LOGF("%s", msg);

	perror(msg);
	exit(1);
}
*/


static int disable_tcp_nagle(int sockfd)
{
	int flag = 1;
	return setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, (char *)&flag, sizeof(int));
}


static void accept_request(const int client_sockfd)
{
	static char buf[accept_line_buf_size] = { 0 };
	//static char additional_msg[accept_method_buf_size] = { 0 };

	ssize_t num_bytes_rcvd = 0;
	
	memset(buf, 0, accept_line_buf_size);
	num_bytes_rcvd = recv(client_sockfd, buf, accept_line_buf_size, 0);
	while (num_bytes_rcvd > 0)
	{

		// TODO

		printf("Recv: %s\n", buf);

		// Receive message until completed.
		memset(buf, 0, accept_line_buf_size);
		num_bytes_rcvd = recv(client_sockfd, buf, accept_line_buf_size, 0);
	}

	close(client_sockfd);
}

