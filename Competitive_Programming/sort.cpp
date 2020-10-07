#include <iostream>
#include <algorithm>

using namespace std;

struct angka
{
  int start, end;
};

bool compare(angka a, angka b){
  return a.end < b.end;
}

bool compareInt(int a, int b){
  // // mengurutkan dari besar ke kecil kecuali angka 1
  // if (a==1) return true;
  // if (b==1) return false;
  // return a > b;

  // mengurutkan dari kecil ke besar kecuali angka 1
  if (a==1) return false;
  if (b==1) return true;
  return a < b;
}

int main(){
  int arr[]={2,5,1,3,4};
  int n = sizeof(arr)/sizeof(arr[0]);

  angka a[]={{2,5},{1,3},{6,8},{5,9}};
  int m = sizeof(a)/sizeof(a[0]);
  
  sort(a,a+m,compare);
  sort(arr, arr+n, compareInt);

  for (int i=0; i<m; i++){
    cout << "[" << a[i].start << "," << a[i].end << "] ";}

  for (int i=0; i<n; i++){
    cout << arr[i] << " ";}
}
