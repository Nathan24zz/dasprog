#include <stdio.h>
int b;
int main(){
scanf ("%d", &b);
int a[b],i,j;

for (i=0;i<b;i++){
	scanf ("%d", &a[i]);
}
for (i=(b-1);i>=0;i--){
	printf ("%d ", a[i]);
}
}
