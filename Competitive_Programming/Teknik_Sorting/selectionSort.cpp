// SELECTION SORT : mencari elemen terkecil dan menempatkan pada tempat yang semestinta
#include <iostream>

using namespace std;

int findSmallest (int [], int);
int main(){
  int a[5] = {12,45,8,15,33};
  int pos, temp;
  cout <<"Input list of elements to be sorted\n";
  for(int i = 0; i<5; i++) {
    cout <<a[i]<<" ";
  }
  cout<<endl;

  for(int i=0; i<5;i++){
    pos = findSmallest(a, i);
    temp = a[i];
    a[i] = a[pos];
    a[pos]= temp;
  }

  cout <<"Sorted List of Elements is\n";
  for(int i = 0; i<5; i++) {
    cout <<a[i]<<" "; 
  }
}

int findSmallest (int a[], int i){
  int ele_small, position;
  ele_small = a[i];
  position = i;
  for(int j=i+1;j<5;j++)
  {
    if(a[j] < ele_small)
    {
      ele_small = a[j];
      position=j;
    }
  }
  return position;
}