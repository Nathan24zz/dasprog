#include <iostream>

using namespace std;

int main(){
  int a;
  int primaryDiagonal=0, secondaryDiagonal=0, result;
  cin >> a;
  int b[a][a];
  for (int i=0; i<a; i++){
    for (int j=0; j<a; j++){
      cin >> b[i][j];
    }  
  }

  for (int i=0; i<a; i++){
    primaryDiagonal += b[i][i];
  }

  int k=a-1;
  for (int i=0; i<a; i++){
    secondaryDiagonal += b[i][k]; 
    k--;
  }
 
  if (primaryDiagonal >= secondaryDiagonal ){
    result = primaryDiagonal - secondaryDiagonal;
  }
  else {result = secondaryDiagonal - primaryDiagonal;}
  cout << result;
}
