#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>

void *print_infinite(void *data) {
    char *string = data;

    while (true) {
        printf("%s\n", string);
    }
}

int main(void) {
    // create a thread
    pthread_t thread;
    char *thread_message = "everybody";

    pthread_create(
        &thread,
        NULL,
        print_infinite,
        thread_message
    );

    // infinitely print Hello
    while (true) {
        printf("Hello\n");
    }
}