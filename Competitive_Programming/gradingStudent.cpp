#include <iostream>

using namespace std;

int main(){
  int x,rounding_number, distance;
  cin >> x;
  int arr[x];

  for(int i=0; i<x; i++){
    cin >> arr[i];
    if (arr[i] >= 38){
      rounding_number = (arr[i]/5+1)*5;
      distance = rounding_number - arr[i];
      if (distance<3){arr[i]=rounding_number;}
    }
    cout << arr[i] << endl;
  }

  return 0;
}