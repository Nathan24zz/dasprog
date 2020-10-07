// SOAL :
// kita ingin menaiki anak tangga, jumlah anak tangga tsb adalah "n"
// kita dapat melangkah dengan jarak tertentu sesuai dengan angka yg ada di dlm array
// hitung semua kemungkinan agar kita dapat sampai ke atas tangga
// masih salah
#include <iostream>

using namespace std;

int numWays(int n, int x[]){
  int total =0;
  if (n==0) {return 1;}
  
  for(int i=0; i<3; i++){
    if(n-x[i]>=0){total += numWays(n-x[i], x); }
  }
  
  return total;
}

int main(){
  int x[3]={1,3,5}, n, total=0;
  cin >> n;
  cout << numWays(n, x);
}