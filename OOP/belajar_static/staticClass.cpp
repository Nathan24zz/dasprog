#include <iostream>

using namespace std;

struct Entity
{
  static int x, y;

  static void print(){
    cout << x << ", " << y <<endl;
  }
};

int Entity::x;
int Entity::y;

int main(){
  // Entity e;
  // e.x = 2;
  // e.y = 3;

  // Entity e1 = {5,8};

  // e.print();
  // e1.print();

  Entity::x = 2;
  Entity::y = 3;

  Entity::x = 5;
  Entity::y = 8;

  Entity::print();
  Entity::print();

  return 0;
}