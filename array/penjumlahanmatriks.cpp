//penjumlahan matriks
#include <stdio.h>
int main(){
int baris, kolom;
	printf("Masukkan jumlah baris = "); scanf("%d", &baris);
	printf("Masukkan jumlah kolom = "); scanf("%d", &kolom);
int a[baris][kolom], b[baris][kolom],i,j, hasil;
	printf("Masukkan anggota matriks a=\n"); 
	for (i=0;i<baris;i++){
		for (j=0;j<kolom;j++){
			scanf("%d", &a[i][j]);
		}
	}
	
	printf("Masukkan anggota matriks b=\n"); 
	for (i=0;i<baris;i++){
		for (j=0;j<kolom;j++){
			scanf("%d", &b[i][j]);
		}
	}

//untuk ngeprint hasil penjumlahan
printf("hasil penjumlahannya adalah =\n");
for (i=0;i<baris;i++){
	for (j=0;j<kolom;j++){
		hasil=a[i][j]+b[i][j];
		printf("%d ", hasil);
		hasil=0;
	}
	printf("\n");
  }
}
