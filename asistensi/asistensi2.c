#include <stdio.h>
int main (){
int a, b, c, d;
	scanf("%d %d %d", &a, &b, &c);
	
	
	for (d=1; d<=c; d++){
		printf("%d ", a);
		a=a+b;
		b++;
	}
}
