#include <stdio.h>
int main(){
int n;
printf("Masukkan banyak angka= ");
scanf("%d", &n);
	int a[n],i;
	float b=0;
	for (i=0;i<n;i++){
		scanf("%d", &a[i]);
	}
	for (i=0;i<n;i++){
		b=b+a[i];
	}
	b=b/10;
	printf("rata-ratanya = %.2f", b);
}
