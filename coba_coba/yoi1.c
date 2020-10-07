#include<stdio.h>
int main(){
	int a[10], i, c;
	
	for (i=1;i<=9;i++){
		scanf("%d", &a[i]);
		if(a[i]>10){c++;}
	}
	printf("banyaknya data lebih dari 10 = %d", c);
}
