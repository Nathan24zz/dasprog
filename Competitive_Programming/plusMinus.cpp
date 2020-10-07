#include <iostream>

using namespace std;

int main(){
  int a, countPositive=0, countNegative=0, countZero=0;
  float positive, negative, zero;
  cin >> a;
  int b[a];

  for (int i=0; i<a; i++){
    cin >> b[i];
  }
  
  for (int j=0; j<a; j++ ){
    if (b[j]>0){countPositive++; }
    if (b[j]==0){countZero++;  }
    if (b[j]<0){countNegative++;  }
  }
  cout << (float)countPositive/a << endl;
  cout << (float)countNegative/a << endl;
  cout << (float)countZero/a << endl;
}