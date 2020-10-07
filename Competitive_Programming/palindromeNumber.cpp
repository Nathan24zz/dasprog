#include <iostream>

using namespace std;

int main(){
  int a, temp1, temp2, hasil=0;
  cin >> a;
  temp1=a;
  while(temp1>0){
    temp2 = temp1%10;
    hasil = hasil*10+temp2;
    temp1 = temp1/10;
  }
  if (hasil == a){cout << "Palindrome number";}
  else {cout << "Not palindrome number";}
}