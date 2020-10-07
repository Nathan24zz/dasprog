#include <stdio.h>
int main(){
int a, b, c, d;
scanf("%d", &a);

printf("pola 1\n");
	for (b=1; b<=a; b++){
		for (c=1; c<b; c++){
			printf(" ");
		}
			for (d=a; d>=b; d--){
			printf("*");
			}
	printf("\n");
	}
	
printf("\npola 2\n");
	for (b=1; b<=a; b++){
		for (c=a; c>b; c--){
			printf(" ");
		}
			for (d=1; d<=b; d++){
			printf("*");
			}
	printf("\n");
	}

printf("pola 3\n");
for (b=1;b<=a;b++){
	for (c=a; c>b; c--){
			printf(" ");}
	for (c=1;c<=2*b-1;c++){
		printf("*");	
	}
printf("\n");
}

}

