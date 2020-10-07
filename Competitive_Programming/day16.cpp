#include <iostream>

using namespace std;

int main(){
  int input, sum=0, temp;
  cin >> input;
  while (input > 0){
    temp = input % 10;
    sum += temp;
    input /= 10;
  }
  cout << sum;
  
}