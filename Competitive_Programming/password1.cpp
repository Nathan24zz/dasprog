#include <iostream>
#include <algorithm>

using namespace std;

int main(){
  int a, n=1;
  cin >> a;
  int catat[a]={0};
  for (int i=0; i<a; i++){
    catat[i]=n;
    n++;
  }
  
  do {
    for (int i=0; i<a; i++){
      cout << catat[i];
    }
    cout << endl;
  } while ( next_permutation(catat,catat+a) );
}