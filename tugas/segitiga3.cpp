#include <stdio.h>
int main()
{
int a,i,j;
scanf("%d", &a);

for (i=1;i<=a;i++){
	for (j=1;j<i;j++){
		printf(" ");}	
	for (j=a; j>=i; j--){
			printf("* ");}
printf("\n");
	}

}
