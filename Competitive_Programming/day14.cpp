#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

int main(){
  string catat[]={"Ram", "Anuj", "Deepak", "Ravi"};
 
  do {
    for (int i=0; i<4; i++){
      cout << catat[i] << " ";
    }
    cout << endl;
  } while ( next_permutation(catat,catat+4) );
}