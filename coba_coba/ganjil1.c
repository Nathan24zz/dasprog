#include <stdio.h>

int main ()
{
int a, b;
	printf("masukkan angka= ");
	scanf(" %d", &a);
	
	for (b=1 ; b<=a; b++){
		printf("%d", b);
		if (b<a) printf("_");
	}
		
	printf("\n");
	
}
