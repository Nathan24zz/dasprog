#include <stdio.h>

int main(){
int a=1,b=1,i,n,hasil;
scanf("%d", &n);
	for (i=1;i<=n;i++){
		printf("%d ", a);
		hasil=a+b;
		a=b;
		b=hasil;
	}

}
