#include <iostream>
using namespace std;

int main(){
  int panjang, lebar;
  cin >> panjang;
  cin >> lebar;

  for(int p=0; p<panjang; p++){
    if(p==0 || p==panjang-1){
      for(int l=0; l<lebar; l++){
        cout << '*';
      }
    }
    else{
      cout << '*';
      for(int l=0; l<lebar-2; l++){
        cout << ' ';
      }
      cout << '*';
    }
    
    cout << endl;
  }
}