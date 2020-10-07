#include <iostream>

using namespace std;
// int a=10;
extern int a;

void function(){

}

int main(){
  cout << a << endl;
  return 0;
}

//cara compile : g++ -g **.cpp -o main