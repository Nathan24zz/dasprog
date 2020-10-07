#include <iostream>

using namespace std;

int main(){
  int a, biggestNumber;
  cout << "Input amount of number that you want : ";
  cin >> a;
  int number[a];

  for (int i=0; i<a; i++){
    cin >> number[i];
  }
  biggestNumber = number[0];

  for (int j=1; j<a; j++){
    biggestNumber = (biggestNumber >= number[j]) ? biggestNumber : number[j];
  }
  cout << "The biggest number is " << biggestNumber << endl;
  return 0;
}