// memasukkan elemen array tanpa mengetahui anggotanya berapa
#include <iostream>
#include <string>
#include <limits>

using namespace std;

int main(){
  int arr[20], count=0;
  for (int i=0; i<20; i++){
    if (cin >> arr[i]){
      count++;
    }
    else{
      break;
    }
  }
  // kalau ini ngeprint semua elemen array
  // for (int n : arr){
  //   cout << n << '\t';
  // }

  for (int i=0; i<count; i++){
    cout << arr[i] << "\t"; 
  }
  cout << endl;
  cin.clear();
  cin.ignore(numeric_limits<streamsize>::max(), '\n');

  string test;
  cin >> test;
  cout << test;

}