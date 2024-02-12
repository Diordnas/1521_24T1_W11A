// Print the contents of HOME/.diary to stdout

// Find home/.diary
// Open it
// Handle errors
// Print the file to stdout

#include <stdio.h>
#include <stdlib.h>

// This could be a problem if the path gets super long, but
// 256 is a sensible limit for path names
// Maybe switch to 512 if there are problems
#define MAX_LEN 256

int main (int argc, char *argv[]) {
    // Getenv the home variable into a string
    char *home = getenv("HOME");

    // Create a buffer
    char *filename = malloc(MAX_LEN);

    // snprintf prints to a buffer
    snprintf(filename, MAX_LEN, "%s/.diary", home);

    // open the file
    FILE *fp = fopen(filename, "r");

    // handle errors
    if (fp == NULL) {
        perror(filename);
        return 1;
    }

    // loop through the fike
    int c;
    while ((c = fgetc(fp)) != EOF) {
        printf("%c", c);
    }

    return 0;
}