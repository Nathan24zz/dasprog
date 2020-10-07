#include <stdio.h>
int c=0;
int fungsi (int a){
int b;
if (a<0){a=a*-1;
    printf("Setelah dibalik = -");}
else {printf("Setelah dibalik = ");}

while (a>0){
    b=a%10;
    c=c*10+b;
    a=a/10;}
return c;
}

int main(){
int a;
printf("Masukkan angka = ");
scanf("%d",&a);

fungsi(a);
printf("%d",c);
printf("\n");
}