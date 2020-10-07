// program masih banyak kekurangan
#include <iostream>

using namespace std;

int main(){
  int arr[5];
  long int biggestNum, smallestNum, miniSum=0, maxSum=0;
  // untuk mengetahui apakah ada angka yg berulang dengan asumsi angka yg berulang cuma 1
  // dan yg berulang angka yg terbesar
  int temp, count=0; 

  for (int i=0; i<5; i++){
    cin >> arr[i];
  }

  // mencari bilangan terbesar dan terkecil
  biggestNum = smallestNum = arr[0];
  for (int j=1; j<5; j++){
    if (arr[j] > biggestNum) {biggestNum = arr[j];}
    if (arr[j] < smallestNum) {smallestNum = arr[j];}
    if (biggestNum == arr[j]){
      temp = biggestNum;
      count++;
    }
  }
  // mencari jumlah terbesar
  for (int i=0; i<5; i++){
    if (arr[i] != smallestNum){
      maxSum += arr[i];
    }
  }
  // mencari jumlah terkecil
  for (int i=0; i<5; i++){
    if (arr[i] != biggestNum){
      miniSum += arr[i];
    }
  }
  // biar jawabannya betul
  if(count != 0 && biggestNum==smallestNum){
    for (int i=0; i<count; i++){
      maxSum += temp;
      miniSum += temp;
    }
  }
  
  cout << miniSum << " " << maxSum;
  return 0;
}