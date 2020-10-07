#include <stdio.h>

int main ()
{ int a;
    printf("masukkan nilai anda: ");
    scanf("%d", &a);

    if (a>70) printf("A");
    if (a>40 && a<81) printf("B");
    if (a<51) printf("C");

}
