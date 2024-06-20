#include <stdio.h>
#include <math.h>

int main() {
    int i = 0;
    int base = 1;
    int  termo = 1;
    int soma = 0;

    while(i<15) {
        printf("%d ", termo);
        soma = soma + termo;
        base = base + 1;
        termo = base * base;
        i = i + 1;
    }

    printf("\nSoma dos termos = %d\n", soma);

    return 0;
}