#include <stdio.h>
int main(){
int n,i,j,k;
	scanf("%d", &n);
	
	for (i=1;i<=n;i++){
		k=n+1;
		for (j=1;j<=i;j++){
			k=k-1;
			printf("%d",k);
		}
	printf("\n");
	}
}

