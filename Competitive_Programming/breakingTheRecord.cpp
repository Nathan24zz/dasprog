#include <iostream>

using namespace std;

int main(){
  int a, max, min, countMax=0, countMin=0;
  cin >> a;
  int b[a];
 
  for (int i=0; i<a; i++){
    cin >> b[i];
  }
  max = min = b[0];

  for (int i=1; i<a; i++){
    if (b[i] > max) {
      countMax++;
      max = b[i]; 
    }
    if (b[i] < min) {
      countMin++;
      min = b[i];
    }
  }
  cout << countMax << " " << countMin;
}