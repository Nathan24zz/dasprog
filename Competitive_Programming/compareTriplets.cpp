#include <iostream>

using namespace std;

int pointA, pointB;

int compareTriplets(int a, int b) {
  if (a<b){pointB++;}
  if (a>b){pointA++;}
  return 0;
}

int main(){
  int a[3], b[3];
  
  for (int i=0; i<3; i++ ){
    cin >> a[i];
  }

  for (int j=0; j<3; j++ ){
    cin >> b[j];
  }

  for (int k=0; k<3; k++ ){
    compareTriplets(a[k], b[k]);
  }

  cout << pointA << " " << pointB;

}