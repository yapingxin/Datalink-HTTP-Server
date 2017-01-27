#include <stdio.h>
#include <pthread.h>
#include "thpool.h"

#include "datatypes.h"

#include "recvlogic.h"
#include "service_config.h"


int main(int argc, char **argv)
{
    threadpool thpool;
    int server_sockfd = -1;
    
    thpool = thpool_init(get_threadpool_threads_count());
    server_sockfd = startup(main_service_port);
    
    thpool_wait(thpool);
    thpool_destroy(thpool);
    return 0;
}
