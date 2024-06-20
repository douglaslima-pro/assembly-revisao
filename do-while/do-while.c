#include <stdio.h>

int main() {

    int i = 1;
    int produto = 1;

    do {
        produto = produto * i;
        i = i + 1;
    } while (i != 10);

    printf("Produto = %d\n", produto);

    return 0;
}