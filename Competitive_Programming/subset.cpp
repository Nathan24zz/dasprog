// belum pake dynamic programmming
#include <iostream>

using namespace std;

int rec(int arr[], int total, int i){
  if (total == 0) {return 1;}
  else if (total < 0) {return 0;}
  else if (i<0) {return 0;}
  // gk perlu ditulis krn walaupun i=-1, tp total==0, tetap return 1
  // else if (i==0 && total==arr[i]) {return 1;}
  else if (total < arr[i]) {return rec(arr, total, i-1);}
  else {
    return rec(arr, total-arr[i], i-1) + rec(arr, total, i-1);
  }
}

int countSet(int arr[], int total, int size_array){
  return rec(arr, total, size_array-1);
}

int main(){
  int arr[5]={2,4,6,10,12};
  int size_array = sizeof(arr)/sizeof(arr[0]);
  // SOAL : dalam array ada berapa kombinasi elemen-elemen yang menghasilkan 16
  // jawaban = 3, yaitu {4,12},{6,10},{2,4,10}
  cout << countSet(arr, 16, size_array); 
}
