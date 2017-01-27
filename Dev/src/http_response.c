#include "http_response.h"

#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctype.h>
#include <strings.h>
#include <string.h>
#include <sys/stat.h>
#include <pthread.h>
#include <sys/wait.h>
#include <stdlib.h>

#include "service_config.h"
#define ISspace(x) isspace((int)(x))

static pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;


void default_http_response(const int client_sockfd, const char * msg)
{
	static char outbuf[out_to_browser_buf_size] = { 0 };
	static char method[accept_method_buf_size] = { 0 };
	static char url[accept_url_buf_size] = { 0 };
	static char protocol[accept_protocol_buf_size] = { 0 };
	
	pthread_mutex_lock(&mutex1);

	memset(outbuf, 0, out_to_browser_buf_size);
	memset(method, 0, accept_method_buf_size);
	memset(url, 0, accept_url_buf_size);
	memset(protocol, 0, accept_protocol_buf_size);
	
	//outbuf[0] = '\0';
	//method[0] = '\0';
	//url[0] = '\0';
	//protocol[0] = '\0';
	

	size_t i = 0;
	size_t j = 0;

	while (!ISspace(msg[i]) && (i < accept_method_buf_size))
	{
		method[i] = msg[i];
		i++;
	}

	if (strcasecmp(method, "GET") && strcasecmp(method, "POST"))
	{
		memset(method, 0, accept_method_buf_size);
		strcpy(method, "Unknown");
	}
	else
	{
		j = i;
		while (ISspace(msg[j]) && j < accept_line_buf_size)
		{
			j++;
		}

		i = 0;
		while (!ISspace(msg[j]) && (j < accept_line_buf_size) && (i < accept_url_buf_size))
		{
			url[i] = msg[j];
			i++;
			j++;
		}

		while (ISspace(msg[j]) && j < accept_line_buf_size)
		{
			j++;
		}

		i = 0;
		while (!ISspace(msg[j]) && (j < accept_line_buf_size) && (i < accept_protocol_buf_size))
		{
			protocol[i] = msg[j];
			i++;
			j++;
		}
	}
	
	strcat(outbuf, "HTTP/1.0 200 OK\r\n");
	strcat(outbuf, SERVER_STRING);
	strcat(outbuf, "Content-Type: text/html\r\n");
	strcat(outbuf, "\r\n");
	strcat(outbuf, "<HTML><HEAD><TITLE>HTTP Response</TITLE></HEAD>\r\n");
	strcat(outbuf, "<BODY><h1>Your request:</h1><hr /><p> Method: ");
	strcat(outbuf, method);
	strcat(outbuf, " <br /> URL: ");
	strcat(outbuf, url);
	strcat(outbuf, " <br /> protocol: ");
	strcat(outbuf, protocol);
	strcat(outbuf, " </p><pre>");
	strcat(outbuf, msg);
	strcat(outbuf, "</pre><hr />\r\n");
	strcat(outbuf, "</BODY></HTML>\r\n");
	
	send(client_sockfd, outbuf, strlen(outbuf), 0);
	

	//sprintf(outbuf, "HTTP/1.0 200 OK\r\n");
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, SERVER_STRING);
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, "Content-Type: text/html\r\n");
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, "\r\n");
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, "<HTML><HEAD><TITLE>HTTP Response | client_sockfd = 0x%08X </TITLE></HEAD>\r\n", client_sockfd);
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, "<BODY><h1>Your request:</h1><hr /><p> Method: %s <br /> URL: %s <br /> protocol: %s </p><pre>%s</pre><hr />\r\n", method, url, protocol, msg);
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	//sprintf(outbuf, "</BODY></HTML>\r\n");
	//send(client_sockfd, outbuf, strlen(outbuf), 0);
	
	pthread_mutex_unlock(&mutex1);
}
