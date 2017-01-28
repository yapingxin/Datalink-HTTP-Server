#include <stdio.h>
#include <unistd.h>

#include "datatypes.h"
#include "recvlogic.h"
#include "service_config.h"


int main(int argc, char **argv)
{
    threadpool thpool;
    int server_sockfd = -1;
    
    thpool = thpool_init(get_threadpool_threads_count());
    server_sockfd = startup(main_service_port);
    mainloop_recv(server_sockfd, &thpool);
    
    printf("D1\n");
    
    terminate_threadpool(&thpool);
    close(server_sockfd);
    
    return 0;
}
