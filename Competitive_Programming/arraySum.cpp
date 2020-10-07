#include <iostream>

using namespace std;

int main(){
  int a;
  cin >> a;
  int b[a];
  long long int result=0;
  for (int i=0; i<a; i++){
    cin >> b[i];
    result += b[i];
  }
  cout << result;

}