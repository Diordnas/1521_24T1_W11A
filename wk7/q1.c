// A helper for question 1

#include <stdio.h>
#include <stdint.h>

int main() {
    // We can read a number as hexadecimal using %x
    // and then print it as a decimal
    int number;
    printf("Enter number: ");
    scanf(" %x", &number);

    // Printing as hexadecimal and decimal
    printf("As hexadecimal: 0x%x\n", number);
    printf("As decimal:     %d\n", number);

    // To convert from negative, invert and add
    printf("\n --- Converting from Negative ---\n");
    uint16_t positive = ~number + 1;
    printf("Inverted/Positive Version: 0x%x = %d\n", negative, negative);

    printf("\n");
}