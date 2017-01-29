
/* Socket Server Header Begin */
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <ctype.h>
#include <strings.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <pthread.h>
#include <time.h>

#include <inttypes.h>
#include <linux/tcp.h> /* #define TCP_NODELAY 1 */

#include "service_config.h"
#include "recvlogic.h"
#include "http_response.h"
//#include "logfunc.h"

static unsigned char g_service_poweron = 1;
static threadpool* g_accept_thpool = NULL;

static void error_die(const char *msg);
static int disable_tcp_nagle(int sockfd);
static int setsockopt_timeout(int sockfd, int timeout_ms);
static void accept_request(const int client_sockfd);
static void log_client_info(struct sockaddr_in *p_client_addr);

void terminate_threadpool(threadpool* p_thpool)
{
    thpool_wait(*p_thpool);
    thpool_destroy(*p_thpool);
}

int startup(uint16_t port)
{
	int server_sockfd = 0;
	struct sockaddr_in sock_addr;

	server_sockfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (server_sockfd == -1)
	{
		error_die("socket() failed.");
	}

	disable_tcp_nagle(server_sockfd);

	memset(&sock_addr, 0, sizeof(struct sockaddr_in));
	sock_addr.sin_family = AF_INET;
	sock_addr.sin_port = htons(port);
	sock_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	if (bind(server_sockfd, (struct sockaddr *)(&sock_addr), sizeof(struct sockaddr_in)) < 0)
	{
		error_die("bind() failed.");
	}
	
	if (listen(server_sockfd, 5) < 0)
	{
		error_die("listen() failed.");
	}

	return(server_sockfd);
}

void mainloop_recv(const int server_sockfd, threadpool* p_thpool)
{
    int client_sockfd = -1;
    size_t client_addr_len = sizeof(struct sockaddr_in);
    struct sockaddr_in client_addr = { 0 };
    
    g_accept_thpool = p_thpool;
    if(g_accept_thpool == NULL)
    {
        error_die("mainloop_recv() parameter p_thpool is NULL.");
    }
    
    while (g_service_poweron)
    {
        client_sockfd = accept(server_sockfd, (struct sockaddr *)&client_addr, (socklen_t *)(&client_addr_len));
        if (client_sockfd == -1)
        {
            error_die("accept");
        }
        
        setsockopt_timeout(client_sockfd, 3000);
        
        log_client_info(&client_addr);
        thpool_add_work(*p_thpool, accept_request, (void*)client_sockfd);
    }
}

static void error_die(const char *msg)
{
	//ZF_LOGF("%s", msg);

	perror(msg);
	exit(1);
}

static int disable_tcp_nagle(int sockfd)
{
	int flag = 1;
    return setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, (char *)&flag, sizeof(int));
}

static int setsockopt_timeout(int sockfd, int timeout_ms)
{
    //struct timeval timeout;
    //timeout.tv_sec = timeout_seconds;
    //timeout.tv_usec = 0;
    
    return setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout_ms, sizeof(int));
}

static void accept_request(const int client_sockfd)
{
	static char buf[accept_line_buf_size] = { 0 };
	static char additional_msg[accept_method_buf_size] = { 0 };

	ssize_t num_bytes_rcvd = 0;
    
    /*
    if(g_accept_thpool)
    {
        error_die("mainloop_recv() parameter p_thpool is NULL.");
    }
     * **/

	memset(buf, 0, accept_line_buf_size);
	memset(additional_msg, 0, accept_method_buf_size);

	num_bytes_rcvd = recv(client_sockfd, buf, accept_line_buf_size, 0);
	

	//ZF_LOGI("Recv: %s", buf);
	//printf("Recv: %s\n", buf);

	if (strcmp(buf, "Cmd: QUIT") == 0)
	{
		//ZF_LOGI("Cmd: QUIT ==> Program Exit.");
		printf("Cmd: QUIT ==> Program Exit.\n");

		close(client_sockfd);
		g_service_poweron = 0;

		terminate_threadpool(g_accept_thpool);
		return;
	}

	
	sprintf(additional_msg, "<hr/>num_bytes_rcvd = %ld\r\n", num_bytes_rcvd);
	strcat(buf, additional_msg);

	default_http_response(client_sockfd, buf);

	close(client_sockfd);
}

static void log_client_info(struct sockaddr_in *p_client_addr)
{
    static char client_addr_txt[INET_ADDRSTRLEN] = { 0 };
    
    const char *ret_constxt = inet_ntop(AF_INET, &p_client_addr->sin_addr.s_addr, client_addr_txt, INET_ADDRSTRLEN);
    if (ret_constxt != NULL)
    {
        //ZF_LOGI("Handling client %s/%i", client_addr_txt, ntohs(p_client_addr->sin_port));
        printf("Handling client %s/%d\n", client_addr_txt, ntohs(p_client_addr->sin_port));
    }
}

