#include <iostream>
#include <vector>

using namespace std;

// fibonacci with recursion
int fib(int n){
  if (n==1 || n==2){return 1;}
  else{
    return fib(n-1) + fib(n-2);
  }
}  

// fibonacci with memoize solution
// store calculation that we have made in array
int mfib(int n, int arr[]){
  int result;
  if (arr[n] != 0){return arr[n];}
  if (n==1 || n==2){result = 1;}
  else {
    result = mfib(n-1, arr) + mfib(n-2, arr);
  }
  arr[n]=result;
  return result;
}

// fibonacci with bottom-up Approach
int fibBottomUp(int n){
  if (n==1 || n==2){return 1;}
  int arr[n+1]={0};
  arr[1]=1;
  arr[2]=1;
  for (int i=3; i<=n; i++){
    arr[i]=arr[i-1]+arr[i-2]; 
  }
  return arr[n];
}

// fibonacci with memoize solution
// store calculation that we have made in array
// int mfib(int n, vector<int>& memo){
//   int result;

//   if (memo[n] != 0){return memo[n];}
//   if (n==1 || n==2){result = 1;}
//   else {
//     result = mfib(n-1, memo) + mfib(n-2, memo);
//   }
  
//   memo[n]=result;
//   return result;
// }

// int changeVector(int n, vector<int>& vec){
//   vec.reserve(n+1);
//   vec[n]=n;
// }

int main(){
  // vector <int> memo;
  int a;
  cin >> a;
  int arr[a+1]={0};

  // cout << "fibonacci ke-"<<a<< " adalah "<< fib(a) << endl;
  cout << "fibonacci ke-"<<a<< " adalah "<< mfib(a, arr) << endl;
  cout << "fibonacci ke-"<<a<< " adalah "<< fibBottomUp(a) << endl;

  // changeVector(1,memo);
  // changeVector(2,memo);
  // for (int i=0; i<10; i++) 
  //   cout << memo[i] << " ";  
 
}