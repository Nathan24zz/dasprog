// coba tok
#include <iostream>
#define MAX 10

using namespace std;

int arr[MAX];

void reverseArray(int x);
void multiply(int x, int y);

int main(){
  int a, b;
  cin >> a;
  cin >> b;

  reverseArray(a);
  multiply (a,b);

}

void reverseArray(int x){
  int temp;
  for (int i=0; i<MAX; i++){
    temp = x;
    temp %= 10;
    arr[i] = temp;
    x /= 10;
  }
}

void multiply(int x, int y){
  int carry = 0;
  for (int i=0; i<MAX; i++){
    int prod = arr[i] * y + carry;
    arr[i] = prod%10;
    carry = prod/10;
  }

  for (int i=MAX-1; i>=0; i--){
    cout << arr[i];
  }
}