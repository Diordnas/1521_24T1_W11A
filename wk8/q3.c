// instead of reading from file to terminal
// we read from terminal to file

#include <stdio.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        fprintf(stderr, "Wrong number of arguments\n");
        return 1;
    }

    FILE *fp = fopen(argv[1], "w");

    if (fp == NULL) {
        // Error opening the file
        perror("File Error");
        return 1;
    }

    int c;
    while ((c = fgetc(stdin)) != EOF) {
        fputc(c, fp);
        if (c == '\n') {
            break;
        }
    }

    return 0;
}