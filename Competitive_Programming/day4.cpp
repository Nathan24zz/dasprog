#include <iostream>

using namespace std;

int main(){
  int hotDogs = 400;
  int package = 8;
  int temp = hotDogs / package;
  int totalPackages = (hotDogs%package==0) ? temp : temp+1;
  cout << totalPackages;
  return 0;
}