#include <stdio.h>

int main() {
    int i = 0;
    int termo = 1;
    int soma = 0;

    while(i < 10) {
        printf("%d ", termo);
        soma = soma + termo;
        termo = termo + 2;
        i = i + 1;
    }

    printf("\nSoma dos termos = %d\n", soma);

    return 0;
}