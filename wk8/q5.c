// 1 or more command line arguments

// argument 1: substring
// read lines from stdin, print them if they have the substring

// arguments 2 onwards: filenames
// read from each filename instead of stdin

// prefix with line number

// error if args wrong
// error if file can't be opened

#define MAX_SIZE 10000

#include <stdio.h>
#include <string.h>

void search_file(FILE *fp, char *substring);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Wrong number of arguments!\n");
        return 1;
    }

    if (argc == 2) {
        search_file(stdin, argv[1]);
    } else {
        for (int i = 2; i < argc; i++) {
            // Loop through given filenames
            FILE *fp = fopen(argv[i], "r");

            if (fp == NULL) {
                perror(argv[i]);
                return 1;
            }

            search_file(fp, argv[1]);
        }
    }

    return 0;
}

void search_file(FILE *fp, char *substring) {
    int line_num = 1;

    char buffer[MAX_SIZE];
    while (fgets(buffer, MAX_SIZE, fp) != NULL) {

        if (strstr(buffer, substring) != NULL) {
            printf("%d %s", line_num, buffer);
        };

        line_num++;
    }
}