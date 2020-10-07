#include <stdio.h>
int main()
{
int a,i,j;
scanf("%d", &a);

printf("pola 1\n");
for (i=1;i<=a;i++){
	for (j=a; j>i; j--){
			printf(" ");}
	for (j=1;j<=2*i-1;j++){
		printf("*");}	
printf("\n");}

printf("pola 2\n");
for (i=1;i<=a;i++){
	for (j=1; j<i; j++){
			printf(" ");}
	for (j=a;j>=i;j--){
		printf("*");}	
printf("\n");}

printf("pola 3\n");
for (i=1;i<=a;i++){
	for (j=1;j<i;j++){
		printf(" ");}	
	for (j=a; j>=i; j--){
			printf("* ");}
printf("\n");
	}

}
