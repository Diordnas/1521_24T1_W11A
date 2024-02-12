#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/wait.h>

// Get the system environment
extern char **environ;

int main(int argc, char *argv[]) {
    // set up for posix spawn
    pid_t id;
    char *p_argv[] = {"/usr/bin/whoami", NULL};

    // posix spawn
    int spawn_status = posix_spawn(
        &id,
        "/usr/bin/whoami",
        NULL,
        NULL,
        p_argv,
        environ
    );

    // handle errors
    if (spawn_status != 0) {
        errno = spawn_status;   // Set the global error number
        perror("posix_spawn");
        return 1;
    }

    // waitpid - wait for the process to finish
    int spawn_exit_status;
    if (waitpid(id, &spawn_exit_status, 0) == -1) {
        perror("waitpid");
        return 1;
    }

    // Print something else - this should be after the username
    printf("something else\n");

    return 0;
}