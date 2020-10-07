#include <stdio.h>
int main (){
int a,i,j,k,b,c=0;
scanf("%d", &a);
b=(a/2)+1;
if (a%2==1){
	for (i=1;i<=b;i++){
		for (j=1;j<i;j++){printf("_");}
		for (k=a;k>=2*i-1;k--){printf("=");}
		for (j=1;j<i;j++){printf("_");}
	printf("\n");
	}
	for (i=1;i<b;i++){
		for (j=b-2;j>=i;j--){printf("_");}
		for (k=1;k<=2*i+1;k++){printf("=");}
		for (j=b-2;j>=i;j--){printf("_");}
	printf("\n");
	}}
else {
	for (i=1;i<=b;i++){
		for (j=1;j<i;j++){printf("_");}
		for (k=a;k>c;k--){printf("=");}
		for (j=1;j<i;j++){printf("_");}
	printf("\n");c++;a--;
	}
	c=0;a=b+1;
	for (i=1;i<b;i++){
		for (j=b-1;j>i;j--){printf("_");}
		for (k=c+b;k<=a;k++){printf("=");}
		for (j=b-1;j>i;j--){printf("_");}
	printf("\n");c--;a++;
	}
}
}
