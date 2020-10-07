// masih salah
// SOAL :
// Anda ingin menukar uang Rp12.000 dengan lembaran uang kertas Rp5.000,Rp2.000, dan Rp1.000. 
// Anda ingin menukar dengan jumlah lembaran sesedikitmungkin.

#include <iostream>

using namespace std;

// int count = 0;
int tukar(int total, int arr[], int i, int& count, int& hasil){
  if (total==0){
    // return count;
    // if (hasil == 0){hasil = count;} // untuk mengisi nilai hasil pertama kali
    // else if(count<hasil){
    //   hasil=count;
    //   return hasil;
    // }
    // else return count;
  }
  else if(total < 0){return 0;}
  else if(i>2){return 0;}
  else if(total>=arr[i]){
    count++;
    return tukar(total-arr[i], arr, i, count, hasil);
    // return tukar(total, arr, i++, count, hasil);
  }
  else if(total<arr[i]){
    return tukar(total, arr, i++, count, hasil);
  } 
}

// int tambah(int a, int& i){
//   if(a==0){return i;}
//   else{
//     i+=2;
//     return tambah(a-1,i);
//   }
// }

int main(){
  int total, i=0, hasil=0, count=0;
  int arr[]={5000,4000,1000};
  cin >> total;
  cout << tukar(total, arr, i, count, hasil);

}