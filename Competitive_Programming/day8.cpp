#include <iostream>

using namespace std;

float avgHours (int a, int b, int c, int d, int e, int f, int n){
  float totalHrs = a+b+c+d+e+f;
  float avgHrs = (float)(totalHrs/n);
}

int main(){
  cout << avgHours (8,10,9,8,7,13,6);
  return 0;
}