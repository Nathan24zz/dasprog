#include<stdio.h>
#include<math.h>

int main()
{
int a,b=1,n,N, nilai_n=0, temp,i,countn=0;
/*while(b==1){
	
	printf("masukkan angka : ");
	scanf("%d",&a);

if (a<45) {printf("bilangan terlalu kecil\n");}
else if (a>45) {printf("bilangan terlalu besar\n");}
else if (a==45) {printf("mantul bos");b=0;}}*/

    printf("N = "); scanf("%d", &n);
    
	N=n;
if (N<0){N=N*-1;}
while (N>0){
    N=N/10;
    countn++;
}

for(i=0;i<countn;i++){
    temp=n%10;
    nilai_n=nilai_n+temp*pow(8,i);
    n=n/10;
}
printf("%d", nilai_n);
}
