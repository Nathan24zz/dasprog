// Macam - macam teknik sorting
#include<iostream>  
using namespace std;
int main (){
  int i, j,temp;
  int a[5] = {12,45,8,5,16};
  cout <<"Input list of elements to be sorted\n";
  for(i = 0; i<5; i++) {
    cout <<a[i]<<" ";
  }
  cout<<endl;

  // BUBLE SORT: kita membandingkan setiap elemen dan menukar elemen tsb jika mereka tidak dalam urutan yg benar
  for(i = 0; i<5; i++) {
    for(j = i+1; j<5; j++)
    {
      if(a[j] < a[i]) {
        temp = a[i];
        a[i] = a[j];
        a[j] = temp;
      }
      // kalau mau tahu cara kerja buble sort
      // cout << "pengulangan ke-" << j << endl;
      // for(int k = 0; k<5; k++) {
      //   cout <<a[k]<<" ";
      // }
      // cout << endl;
    }  
  }
  cout <<"Sorted List of Elements is\n";
  for(i = 0; i<5; i++) {
    cout <<a[i]<<" "; 
  }

  // SELECTION SORT : mencari elemen terkecil 

return 0;
}
