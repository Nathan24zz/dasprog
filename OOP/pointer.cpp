#include <iostream>

using namespace std;

void plusOne(int& value){
  value++;
}

void increment(int* value){
  (*value)++;
}

int main(){
  // pointers
  // int a = 5;
  // int* ptr = &a;
  // int** ptr1 = &ptr;

  // *ptr = 8;//gk guna soal e di re-write sm baris selanjut e
  // **ptr1 = 9;
  // cout << a << endl;
  // cout << *ptr << endl;
  // cout << **ptr1 << endl;

  // references
  // int a = 5;
  // int& ref = a;
  // plusOne(ref);
  // cout << ref <<endl;

  // yg dilakukan oleh references juga bisa dilakukan oleh pointer tapi lebih ribet
  // int a =5;
  // int* ptr = &a;
  // increment(ptr);
  // cout << *ptr << endl;

  //mengganti nilai a dan b menggunakan pointer
  int a = 5;
  int b = 8;
  int* ptr = &a;
  *ptr = 2;
  ptr = &b;
  *ptr = 1;

  cout << a << endl;
  cout << b << endl;
  return 0;
}