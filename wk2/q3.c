#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    //if (x <= 100 || x >= 1000) {
    if x <= 100 goto if_true;
    if x >= 1000 goto if_true;
    goto if_false;

    if_true:
        printf("medium\n");
    } else {
    if_false:
        printf("small/big\n");

    if_end:
    }
}