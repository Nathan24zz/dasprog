#include <iostream>

using namespace std;

int main(){
  int angka;
  cout << "Masukkan angka ";
  cin >> angka;
  for (int i=1; i<=angka; i++){
    int k = (i%2==1) ? i+1 : i;
    for (int l=k; l<angka; l++){
      cout << " ";
    }
    for (int j=0; j<k; j++){
      cout << "* ";
    }
    cout << endl;
  }
}