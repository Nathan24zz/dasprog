#include <stdio.h>
int hitung_luas(int p, int l){
	int luas = p*l;
	return luas;
}
void tampilkan_luas(int p, int l){
	printf ("luasnya adalah: ");
	printf ("%d", hitung_luas(p,l));
}
int main (){
	int p, l;
	scanf("%d", &p);
	scanf("%d", &l);
	tampilkan_luas(p,l);
}
