#ifndef _UTILITY_RECVLOGIC_H_
#define _UTILITY_RECVLOGIC_H_

#include "datatypes.h"
//#include "thpool.h"

int startup(uint16_t port);
void error_echo(const char *msg);
void mainloop_recv(const int server_sockfd);
//void mainloop_recv(const int server_sockfd, threadpool* p_thpool);
//void terminate_threadpool(threadpool* p_thpool);



#endif // _UTILITY_RECVLOGIC_H_
