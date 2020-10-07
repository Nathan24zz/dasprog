// Soal ada pada bagian greedy https://osn.toki.id/arsip/pemrograman-kompetitif-dasar.pdf
#include <iostream>
#include <algorithm>

using namespace std;

struct angka
{
  int start, end;
};

bool compare(angka a, angka b){
  return a.end < b.end;
}

int main(){
 
  angka a[]={{1,7},{2,6},{5,7},{6,9},{9,12},{10,12},{11,15},{13,14}};
  int n = sizeof(a)/sizeof(a[0]);
  sort(a,a+n,compare); //mengurutkan a[] berdasarkan waktu akhirnya

  int temp=0;
  for (int i=0; i<n; i++){
    if(a[i].start >= temp){
      temp = a[i].end;
      cout << "[" << a[i].start << "," << a[i].end << "] ";
    }
  }
  

  // for (int i=0; i<n; i++){
  //   cout << "[" << a[i].start << "," << a[i].end << "] ";}
 
}
