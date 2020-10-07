#include <stdio.h>
int main(){
int n;
printf("Masukkan banyak angka= ");
scanf("%d", &n);
int a[n],i,c,b;
	for (i=0;i<n;i++){
		scanf("%d", &a[i]);
	}
b=a[0];
	for (i=1;i<n;i++){
		if (a[i]<=b){b=a[i];}
	}
	printf("bilangan terkecilnya adalah %d", b);
	printf("/n");
}
