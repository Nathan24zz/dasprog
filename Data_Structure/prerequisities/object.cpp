// passing object to function as argumen
// copy constructor
// friend function
#include <iostream>

using namespace std;

class ComplexNumber
{
  private:
    int real;
    float imaginer;
  public:
    // plain constructor
    ComplexNumber(){
      
    }
    // parameterized constructor
    ComplexNumber(int r, float i){
      real = r;
      imaginer = i;
    }
    // copy constructor
    ComplexNumber(ComplexNumber &obj){
      cout << "Copy contructor called" << endl;
      real = obj.real;
      imaginer = obj.imaginer;
    }
    // friend function
    friend void addNumber(ComplexNumber &obj);

    void display(){
      cout << real << " + " << imaginer << "i"<< endl;
    }
    int getReal(){
      return real;
    }
    float getImaginer(){
      return imaginer;
    }
};

ComplexNumber addTwoNumber(ComplexNumber n1, ComplexNumber n2){
  int r;
  float i;
  r = n1.getReal() + n2.getReal();
  i = n1.getImaginer() + n2.getImaginer();
  ComplexNumber temp(r,i);    // make new object to hold the sum value
  return temp;
}

void addNumber(ComplexNumber &obj){
  obj.real = obj.real+2;
  obj.imaginer = obj.imaginer+2;
}


int main(){
  ComplexNumber a(2,5), b(5,7), c, d = a/*copy constructor called*/; 
  c = addTwoNumber(a,b);
  c.display();
  d.display();  // member of 'd' is exactly the same as 'a' because of copy constructor
  
  // a.display();
  // // friend function called
  // addNumber(a);
  // a.display();

  // pointer to object
  // ComplexNumber* ptr;
  // ptr = &a;
  // a.display();
  // ptr = &b;
  // b.display();
}