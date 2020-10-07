#include <stdio.h>
int main(){

int a[10],b,i,c;
scanf("%d", &b);
for (i=0;i<b;i++){
	scanf("%d", &a[i]);}

c=a[0];
for (i=1;i<b;i++){
	if (a[i]<c){c=a[i];}
}

printf("%d", c);
}
