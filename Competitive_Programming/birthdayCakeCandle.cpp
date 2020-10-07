#include <iostream>

using namespace std;

int main(){
  int x, biggestNum, count=1;
  cin >> x;
  int arr[x];

  for(int i=0; i<x; i++){
    cin >> arr[i];
  }

  biggestNum = arr[0];
  for (int i=1; i<x; i++){
    if(arr[i] == biggestNum){count++;}
    if(arr[i] > biggestNum) {
      count=1;
      biggestNum = arr[i];
    }
  }
  cout << count;
  return 0;
}