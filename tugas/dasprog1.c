#include <stdio.h>
#include <math.h>

int n,k,i,temp;
int nilai_n=0,nilai_k=0,countn=0,countk=0;

int fungsi_ubah(){

//mengkonversi nilai n & k ke desimal
for(i=0;i<countn;i++){
    temp=n%10;
    nilai_n=nilai_n+temp*pow(8,i);
    n=n/10;
}

for(i=0;i<countk;i++){
    temp=k%10;
    nilai_k=nilai_k+temp*pow(8,i);
    k=k/10;
}
return nilai_k,nilai_n;
}


int main(){
int j=1, N, K,c;
while (j==1){
    
    printf("Masukkan nilai untuk N dan K\n");
    printf("N = "); scanf("%d", &n);
    printf("K = "); scanf("%d", &k);
    N=n;
    K=k;

    if (N<0){N=N*-1;} //agar n dapat dihitung banyaknya
    if (K<0){K=K*-1;} //agar k dapat dihitung banyaknya

    while (N>0){
    c=N%10;
    if (c<=7){}
    else {printf("angka dari N tidak boleh lebih besar dari 7\n");break;}
    N=N/10;
    countn++; //menghitung banyak angka dari n
    }

    while (K>0){
    c=K%10;
    if (c<=7){}
    else {printf("angka dari K tidak boleh lebih besar dari 7\n");break;}
    K=K/10;
    countk++; //menghitung banyak angka dari k
    }

    if (N==0 && K==0 && n<k) {
            printf("Nilai bilangan N harus lebih besar dari K\n");
            }
    else if (N==0 && K==0 && n>=k){
            fungsi_ubah();
            printf ("Jumlah kedua bilangan dalam desimal = ");
            printf ("%d\n", nilai_n+nilai_k);
            printf ("Pengurangan kedua bilangan dalam desimal = ");
            printf ("%d\n", nilai_n-nilai_k);
            j--;}
        }

return 0;
}