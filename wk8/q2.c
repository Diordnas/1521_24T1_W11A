// first arg - filename
// print first line

// if incorrect num args - error
// if problem opening file - error

#include <stdio.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        fprintf(stderr, "Wrong number of arguments\n");
        return 1;
    }

    FILE *fp = fopen(argv[1], "r");

    if (fp == NULL) {
        // Error opening the file
        perror("File Error");
        return 1;
    }

    int c;
    while ((c = fgetc(fp)) != EOF) {
        printf("%c", c);
        if (c == '\n') {
            break;
        }
    }

    return 0;
}