#include <stdio.h>
#include <spawn.h>
#include <sys/wait.h>
#include <errno.h>

// Get the system environment
extern char **environ;

int main () {
    pid_t pid;
    char *p_argv[] = {"/usr/bin/whoami", NULL};

    int spawn_status = posix_spawn(
        &pid,
        "/usr/bin/whoami",
        NULL,
        NULL,
        p_argv,
        environ
    );

    // Handle errors with perror;
    if (spawn_status != 0) {
        // Directly modify the global errno variable
        errno = spawn_status;
        perror("posix_spawn error");
        return 1;
    }

    // Wait for the process we spawned to finish before we do anything else
    int return_status;
    waitpid(pid, &return_status, 0);

    if (return_status != 0) {
        errno = spawn_status;
        perror("posix_spawn error");
        return 1;
    }

    printf("This should be printed *after* whoami finishes.\n");

    return 0;
}