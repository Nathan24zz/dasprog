#include <stdio.h>

void faktorial (int n)
{
	if (n<=1) 
		return 1;
	else 
		return n*faktorial(n-1);
}

int main()
{
	int n;
	printf("Masukkan integer: "); scanf("%d", &n);
	printf("Faktorial dari %d adalah %d\n", n, faktorial(n));
	
	return 0;
}
