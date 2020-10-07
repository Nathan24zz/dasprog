#include <iostream>

namespace utilz{
  int mult(int a, int b){
    return a*b;
  }
}

using namespace std;

class Node{
public:
  int data;
  Node(int d){
    data = d;
  }
};

int main(){
  Node n1(1);
  cout << n1.data << endl;
  cout << utilz::mult(5,6);
}