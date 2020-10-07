#include <iostream>
using namespace std;
int main(){
  int a,i,j,k,l;
  int count_bintang=0, count_donat=0;
  cin >> a;
  for(i=0;i<a;i++){
    for(k=0;k<i;k++){
      if(i<=a/2){
        cout << 'o';
        count_donat = count_donat+1;
        }
    }
    for(j=a-1;j>(2*i-1);j--){
      cout << '*';
      count_bintang = count_bintang+1;
    }
    for(k=0;k<i;k++){
      if(i<=a/2){
        cout << 'o';
        count_donat = count_donat+1;
        }
    }
  if(i<=a/2){cout << endl;}
  }
  if(a%2==1){
    for(i=0;i<a/2;i++){
      for(l=0;l<a;l++){
        cout << 'o';
        count_donat = count_donat+1;
      }
    cout << endl;
    }
  }
  else{
    for(i=0;i<a/2-1;i++){
      for(l=0;l<a;l++){
        cout << 'o';
        count_donat = count_donat+1;
      }
    cout << endl;
    }
  }
cout <<"Jumlah Bintang = " << count_bintang <<endl;
cout <<"Jumlah Donat = " << count_donat;
}