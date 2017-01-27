#ifndef _UTILITY_HTTP_RESPONSE_H_
#define _UTILITY_HTTP_RESPONSE_H_

#include <stdio.h>

#define SERVER_STRING "Server: Tiny HTTP Application Server/0.2.1\r\n"

void default_http_response(const int client_sockfd, const char * msg);

#endif // _UTILITY_HTTP_RESPONSE_H_
