#include <iostream>

using namespace std;

int main(){
  int a, b, pivot, value; 
  int arr[100]={0};
  // mencari bilangan terkecil untuk dijadikan poros(pivot)
  cin >> a;
  int temp_arr[a], smallest_num;
  
  for (int i=0; i<a; i++){
    cin >> temp_arr[i];
  }

  smallest_num = temp_arr[0];
  for (int i=1; i<a; i++){
    if(temp_arr[i]<smallest_num){smallest_num=temp_arr[i];}
  }
  pivot = smallest_num;

  for (int i=0; i<a; i++){
    arr[temp_arr[i]-pivot]++;
  }

  cin >> b;
  for (int i=0; i<b; i++){
    cin >> value;
    if (value < pivot){cout << value << " ";}
    else {arr[value-pivot]--;}
  }
 
  for (int i=0; i<100; i++){
    if (arr[i] != 0){cout << pivot+i << " ";}
  }
}

// contoh inputan
    // 10
    // 203 204 205 206 207 208 203 204 205 206 
    // 13
    // 203 204 204 205 206 207 205 208 203 206 205 206 204

    // 10
    // 11 4 11 7 13 4 12 11 10 14
    // 15
    // 11 4 11 7 3 7 10 13 4 8 12 11 10 14 12