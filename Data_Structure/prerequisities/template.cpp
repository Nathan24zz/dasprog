#include <iostream>
#include <string>

template <typename T>
void swap(T &a, T &b){
  T temp = a;
  a = b;
  b = temp;
}

template <typename T>
void swap(T a[], T b[], int size){
  for (int i=0; i<size; i++){
    T temp = a[i];
    a[i] = b[i];
    b[i] = temp;
  }
}

int main(){
  int a=10; int b=20;
  swap(a,b);
  std::cout << "a: " << a << " b: " << b << std::endl;

  std::string a1="Rudy"; std::string b1="Saitama";
  swap(a1,b1);
  std::cout << "a1: " << a1 << " b1: " << b1 << std::endl;

  int arr[]={1,1,1}, brr[]={2,2,2};
  for (int i=0; i<3; i++){
    std::cout << arr[i] << " " << brr[i] << '\t';
  }
  std::cout << std::endl;
  swap(arr, brr, 3);
  for (int i=0; i<3; i++){
    std::cout << arr[i] << " " << brr[i] << '\t';
  }
  std::cout << std::endl;
}