#include <stdio.h>
#include <pthread.h>
#include <unistd.h>


void *print_loop(void *data) {
    while(1) {
        printf("Awaiting user input...\n");

        // Wait 1 second
        sleep(1);
    }
}


int main() {
    pthread_t thread;
    pthread_create(
        &thread,
        NULL,
        print_loop,
        NULL
    );

    while (1) {
        int c = getchar();
        putchar(c);
    }

    return 0;
}