// function that has the same name in the derived class and base class
// function at base class not executed, except function at derived class call function at base class 
#include <iostream>

using namespace std;

class Animal{
  public:
    void getSound(){
      cout << "Animal sound"<<endl;
    }
};

class Dog: public Animal{
  public:
    void getSound(){
      Animal::getSound();
      // cout << "Dog bark"<<endl;
    }
};

int main(){
  Animal a;
  Dog d;
  a.getSound();
  d.getSound();
}