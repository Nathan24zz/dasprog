#include <stdio.h>
int barisa, koloma, barisb, kolomb;
int main(){
printf("Masukkan baris dan kolom matrik a = ");
scanf("%d %d", &barisa,&koloma);
int i,j,k,a[barisa][koloma],jumlah=0;

printf("Masukkan elemen matrik a = \n");
for (i=0;i<barisa;i++){
	for (j=0;j<koloma;j++){
		scanf("%d", &a[i][j]);
	}
}
printf("\nMasukkan baris dan kolom matrik b = ");
scanf("%d %d", &barisb, &kolomb);
int b[barisb][kolomb];

printf("Masukkan elemen matrik b = \n");
for (i=0;i<barisb;i++){
	for (j=0;j<kolomb;j++){
		scanf("%d", &b[i][j]);
	}
}

if (barisa=kolomb){
//untuk perkalian matriks
printf("hasil perkaliannya =\n");
for (i=0;i<barisa;i++){
	for (j=0;j<kolomb;j++){
		for (k=0;k<koloma;k++){
			jumlah=jumlah+a[i][k]*b[k][j];
		}
	printf("%d ",jumlah);
	jumlah=0;
	}
printf("\n");
}
}
else {printf("gk iso bos");}
return 0;
}


