// SOAL :
// Terdapat N tombol yang dinomori dari 1 hingga N dan sebuah lampu dalam keadaan mati. 
// Apabila tombol ke-i ditekan, keadaan lampu akan berubah (dari mati menjadi menyala,
// atau sebaliknya) apabila N habis dibagi oleh i. Apabila masing-masing tombol
// ditekan tepat sekali ,bagaimana keadaan lampu pada akhirnya?

#include <iostream>
#include <math.h>

using namespace std;

// int main(){
//   int n;
//   bool lampu=false;
//   cin >> n;
//   for (int i=1; i<=n; i++){
//     if(n%i==0){lampu = !lampu;}
//   }
//   if(lampu){cout << "lampu nyala" << endl;} 
//   else {cout << "lampu mati"<<endl;}
// }

// Solusi yg lebih baik

int main(){
  int n;
  cin >> n;
  int temp = round(sqrt(n));

  if (temp*temp == n){cout << "lampu nyala";}
  else {cout << "lampu mati";}
}