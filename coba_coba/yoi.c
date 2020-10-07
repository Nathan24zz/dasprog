#include <stdio.h>

int main ()
{
int a, b, c, hasil;
	printf("Masukkan alas= ");
	scanf("%d", &a);
	printf("Masukkan atap= ");
	scanf("%d", &b);
	printf("Masukkan tinggi= ");
	scanf("%d", &c);
	
	hasil=(a+b)/2*c;
	printf("luas= %d\n", hasil);
	
	if (hasil % 2==0){
		printf("bilangan genap");}
	else 
		printf("bilangan ganjil");
	printf("\n");
	
}
