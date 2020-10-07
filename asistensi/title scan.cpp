#include <stdio.h>
int main(){

int a[10],b,c,d,e,kanan,kiri,f;

for (b=0;b<=9;b++){
	scanf("%d", &a[b]);
}
scanf ("%d", &c);
e=a[c-1];
kanan=c;
kiri=c-2;

if (c<1){printf("ERROR");}
else if (c>=1){
	for (d=0;d<=9;d++){
		if (kanan>=9){a[kanan]=a[9];}
		if (kiri<=0){a[kiri]=a[0];}
		if (a[kanan]>a[kiri]){f=a[kanan];}			
		else if (a[kanan]<a[kiri]){f=a[kiri];}
			
		if (f>e){e=f;break;}
		kanan++; kiri--;
	}
	if (e==a[c-1]){printf("NONE");} 
	//21 37 150 101 81 90 42 123 72 10
	else printf("%d", e);
}
}


