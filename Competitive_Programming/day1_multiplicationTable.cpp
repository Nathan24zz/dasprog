#include <iostream>

using namespace std;

int main(){
  int a, hasil;
  cin >> a;
  for (int i=0; i<=10; i++){
    hasil = a*i;
    if (i==10){
      cout << a << " x " << i << " = " << hasil << endl;
    }
    else {
      cout << a << " x " << i << "  = " << hasil << endl;
    } 
  }
  return 0;
}