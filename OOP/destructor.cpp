#include <iostream>

using namespace std;

class Entity{
public:
  int x, y;

  Entity(){
    x=0;
    y=0;
    cout << "Entitiy created!" << endl;
  }

  ~Entity(){
    cout << "Entity destroyed!" << endl;
  }

  void print(){
    cout << x << ", " << y << endl;
  }
};
//agar bisa lihat kerja dari destructor
void function(){
  Entity e;
  e.print();
}

int main(){
  function();

  return 0;
}