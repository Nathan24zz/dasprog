#include <stdio.h>
int main(){
int a[11],i,b;
	 for (i=0;i<=10;i++){
		scanf("%d", &a[i]);}

i=-1;
while (i<12){
	i++;
	if (a[i]<5){continue;}
	else if (a[i]>10){break;}
	printf ("%d ", a[i]);
	}
}
