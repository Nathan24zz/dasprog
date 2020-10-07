#include <stdio.h>
void cetak(char a[])
{
	printf("Halo %s\n", a);
}
int main(){
	char a[20],b[20];
	scanf("%s %s", &a,&b);
	cetak(a);
	cetak(b);
}
