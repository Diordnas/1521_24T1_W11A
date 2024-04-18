#include <stdlib.h>
#include <stdio.h>
#include <spawn.h>
#include <sys/wait.h>
#include <errno.h>

// Get the system environment
extern char **environ;

void spawn_process(char *p_argv[]) {
    pid_t pid;

    int spawn_status = posix_spawn(
        &pid,
        p_argv[0],
        NULL,
        NULL,
        p_argv,
        environ
    );

    if (spawn_status != 0) {
        errno = spawn_status;
        perror("posix_spawn error");
        exit(1);
    }

    int return_status;
    waitpid(pid, &return_status, 0);

    if (return_status != 0) {
        errno = spawn_status;
        perror("posix_spawn error");
        exit(1);
    }
}

int main () {
    char *date_argv[] = {"/bin/date", "+%d-%m-%Y", NULL};
    spawn_process(date_argv);

    char *time_argv[] = {"/bin/date", "+%T", NULL};
    spawn_process(time_argv);

    char *user_argv[] = {"/usr/bin/whoami", NULL};
    spawn_process(user_argv);

    char *host_argv[] = {"/bin/hostname", "-f", NULL};
    spawn_process(host_argv);

    char *pwd_argv[] = {"/usr/bin/realpath", ".", NULL};
    spawn_process(pwd_argv);

    return 0;
}