#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/wait.h>

// get environ
extern char **environ;

void spawn_process(char *p_argv[]) {
    // set up for posix spawn
    pid_t id;

    // posix spawn
    int spawn_status = posix_spawn(
        &id,
        p_argv[0],
        NULL,
        NULL,
        p_argv,
        environ
    );

    // handle errors
    if (spawn_status != 0) {
        errno = spawn_status;   // Set the global error number
        perror("posix_spawn");
        exit(EXIT_FAILURE);
    }

    // wait for it to finish
    int spawn_exit_status;
    if (waitpid(id, &spawn_exit_status, 0) == -1) {
        perror("waitpid");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    char *date_argv[] = {"/bin/date", "+%d-%m-%Y", NULL};
    spawn_process(date_argv);

    char *time_argv[] = {"/bin/date", "+%T", NULL};
    spawn_process(time_argv);

    char *user_argv[] = {"/usr/bin/whoami", NULL};
    spawn_process(user_argv);

    char *hostname_argv[] = {"/bin/hostname", "-f", NULL};
    spawn_process(hostname_argv);

    char *working_dir_argv[] = {"/usr/bin/realpath", ".", NULL};
    spawn_process(working_dir_argv);

    char *q1_argv[] = {"./q1", NULL};
    spawn_process(q1_argv);

    return 0;
}