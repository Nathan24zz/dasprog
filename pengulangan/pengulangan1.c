#include <stdio.h>
int main (){
int a, b, c;
	printf("masukkan angka= ");
	scanf("%d", &a);
	
	if (a>=0)
		printf("1");
		for (b=1; b<=a; b++){
		printf("0");}
	if (a<0)
		printf("0,");
		for (c=-1; c>a; c--){
		printf("0");
		}
		printf("1");
	
}
