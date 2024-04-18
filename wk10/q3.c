#include <stdio.h>
#include <pthread.h>

// Our thread function takes and returns a void pointer
void *print_loop(void *data) {
    // We cast the void pointer to the type we want
    char *message = data;

    while(1) {
        printf("%s\n", message);
    }
}


int main() {
    char *thread_message = "hello from the thread!";

    pthread_t thread;
    pthread_create(
        &thread,
        NULL,
        print_loop,
        thread_message
    );

    while (1) {
        printf("Hello!\n");
    }

    return 0;
}