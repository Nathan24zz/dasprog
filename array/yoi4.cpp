//mengetahui apakah ada angka yang sama
#include <stdio.h>
int main(){
int seen[10]={0},i,b,c;
scanf("%d", &b);

while (b>0){
	c=b%10;
	if (seen[c]==1){break;}
	seen[c]=1;
	b=b/10;
}
if (b>0){printf("yes");}
else {printf("no");}
}

