#include <stdio.h>
int main(){

int a,b,c=0;
	scanf("%d",&a);
	
for (b=2;b<=a/2;b++){
	if (a%b==0){
		c++;
	}
}
if (c>0){printf("bukan bilangan prima");}
else {printf("bilangan prima");
}
}
