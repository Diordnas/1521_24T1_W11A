int fact(int n) {
    int total = 1;
    int i = 1;

    while (i < n) {
        total *= i;
        i++;
    }

    return total;
}