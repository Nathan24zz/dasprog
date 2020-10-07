#include <stdio.h>
int tampil(int N){
    if (N!=0){
        printf("X^%d + ",N );
        tampil(N-1);
    }
    else {printf("X^0");}
    return N;
}

int main(){
    int masukan, hasil;
    printf("Input : ");
    scanf("%d", &masukan);
    printf("f(x) = ");
    hasil=tampil(masukan);
    printf("\n");
}

