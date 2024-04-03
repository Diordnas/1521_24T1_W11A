// 1 or more command line arguments

// argument 1: substring/needle
// read lines from stdin print them if they have the needle

// argument 2 or more: filenames
// read from each file instead of stdin

// prefix with line number

// error if wrong args
// error if file open goes wrong

#define MAX_SIZE 1024

#include <stdio.h>
#include <string.h>

void search_stream(FILE *fp, char *needle);

int main (int argc, char *argv[]) {

    if (argc < 2) {
        fprintf(stderr, "Wrong number of arguments!\n");
        return 1;
    }

    if (argc == 2) {
        search_stream(stdin, argv[1]);
    } else {
        for (int i = 2; i < argc; i++) {
            FILE *fp = fopen(argv[i], "r");

            if (fp == NULL) {
                perror(argv[i]);
                return 1;
            }

            printf("\t%s:\n", argv[i]);
            search_stream(fp, argv[1]);
        }
    }

    return 0;
}

void search_stream(FILE *fp, char *needle) {
    char haystack[MAX_SIZE];
    int line_num = 1;

    while (fgets(haystack, MAX_SIZE, fp) != NULL) {
        // Print line if it has the substring/needle
        if (strstr(haystack, needle) != NULL) {
            printf("%d: %s", line_num, haystack);
        }

        line_num++;
    }
}