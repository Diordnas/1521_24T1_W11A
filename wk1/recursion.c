#include <stdio.h>

int fact(int n);

// main function
int main() {
    printf("%d\n", fact(5));
    return 0;
}

// TODO: factorial function
int fact(int n){
    if (n == 1) {
        return 1;
    }
    return n * fact(n - 1);
}