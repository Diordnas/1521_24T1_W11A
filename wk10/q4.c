#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>

#include <unistd.h> // Sleep function

#define MAX_LINE 1024

void *print_infinite(void *data) {
    while (true) {
        printf("Feed me input\n");
        sleep(1);
    }
}

int main(void) {
    // create a thread
    pthread_t thread;

    pthread_create(
        &thread,
        NULL,
        print_infinite,
        NULL
    );

    while (true) {
        char buffer[MAX_LINE];
        scanf("%s", buffer);
        printf("You entered: %s\n", buffer);
    }
}