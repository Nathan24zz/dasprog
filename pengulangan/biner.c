#include <stdio.h>
int main(){
int a,b;

scanf ("%d",&a);
for (b=1; b<=4; b++){

	if (a%2==1)
		printf("1");
	else printf ("0");
	a=a/2;
}
printf ("\n");
	return 0;
}

