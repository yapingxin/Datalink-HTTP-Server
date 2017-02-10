#include <stdio.h>
#include <unistd.h>

#include "service_config.h"
#include "recvlogic.h"

int main(int argc, char* argv[])
{
	int server_sockfd = -1;

	// TODO:
	// (1) Get the command line arguments
	// (2) Read the configuration file if provided.

	server_sockfd = startup(main_service_port);
	if (server_sockfd <= 0)
	{
		error_echo("listen() failed.");
		goto EXIT;
	}

	mainloop_recv(server_sockfd);

	close(server_sockfd);

EXIT:
	printf("hello from HTTP_Server!\n");
	return 0;
}
