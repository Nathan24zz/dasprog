#include <stdio.h>
int main(){

int a[100],b,c,d=0;
a[0]=1;
a[1]=1;

scanf("%d",&b);
for (c=2;c<=b;c++){
	a[c]=a[c-1]+a[c-2];
	if (a[c]==b){d++;
	}
}
if (b==1){printf("FIBONACCI");}
else if (d>0){printf("FIBONACCI");}
else {printf("BUKAN");}

}


