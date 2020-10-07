//menghitung jumlah baris dan kolom matriks 5x5
#include <stdio.h>
int main(){
int a[5][5],i,j,sum;

for (i=0;i<5;i++){
	for (j=0;j<5;j++){
		scanf ("%d", &a[i][j]);
	}
}
//row sum
sum=0;printf("jumlah baris = ");
for (i=0;i<5;i++){
	for (j=0;j<5;j++){
		sum=sum+a[i][j];
	}
	printf("%d ",sum);sum=0;
}
//column sum
printf("\n");printf("jumlah kolom = ");
for (i=0;i<5;i++){
	for (j=0;j<5;j++){
		sum=sum+a[j][i];
	}
	printf("%d ",sum);sum=0;
}
}
/* 8 3 9 0 10
3 5 17 1 1
2 8 6 23 1
15 7 3 2 9
6 14 2 6 0*/
 
