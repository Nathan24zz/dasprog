// solve without using *
#include <iostream>

using namespace std;

int multiply (int x, int y){
  if (y == 0){
    return 0;
  }

  if (y > 0){
    x = x + multiply(x,y-1);
    return x;
  }

  if (y < 0){
    return -multiply(x, -y);
  }
}


int main(){
  cout << multiply(12000,365);
  return 0;
}