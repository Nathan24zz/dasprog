#include <stdio.h>
#define max 10

void function1(int a[]);

int main(){
    int i, a[max];

    printf("masukkan %d angka\n", max);
    for (i=0;i<max-1; i++){
        scanf ("%d", &a[i]);
    }

    function1(a);
    for (i=0;i<max-1; i++){
        printf ("%d ", a[i]);
    }
return 0;
}

void function1(int a[]){
    int k, l, min, temp;

    for (k=0; k<max-1; k++){
        min=k;
        for(l=k+1; l<=max-1; l++){
            if (a[l]<a[min]){min=1;}
        }
        temp=a[min]; a[min]=a[k]; a[k]=temp;
    }
}