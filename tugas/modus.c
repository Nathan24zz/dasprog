#include <stdio.h>
int main(){
int n;
printf("Masukkan berapa nilai yang mau diinputkan = ");
scanf("%d", &n);
int a[10],i,j,b;
a[10]=(0);
for (i=0;i<n;i++){
    scanf("%d", &b);
    for (j=0;j<=9;j++){
        if (j==b)(a[b]++);
    }
}
printf("%d", a[1]);

}