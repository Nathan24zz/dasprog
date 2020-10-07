#include <iostream>

using namespace std;

int main(){
  int totalMiles = 2052;
  float mileToKm = 1.60934;
  float totalKm = float(totalMiles*mileToKm);
  float kmEachDay = totalKm / 6;
  int totalStopEachDay = 2;
  cout << "she drive average "<< kmEachDay/totalStopEachDay << "km every stop"; 
  return 0;
}