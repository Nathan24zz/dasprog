#include <stdio.h>
int main (){
int a, b, c, d, e, z;
	scanf("%d %d %d", &a, &b, &c);

z=a;	
	for (d=1; d<=c; d++){
		a=z;
		z=z+b;

		for (e=1; e<=c; e++){
			printf("%d ",a);
			a=a+b;
		}
	printf("\n");
		
	}
}
