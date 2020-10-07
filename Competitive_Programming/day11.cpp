#include <iostream>

using namespace std;

int main(){
  int minutesMovie1 = 100;
  int minutesMovie2 = 110;
  int totalMinutes = minutesMovie1 + minutesMovie2;
  int minutesTohrs = 60;
  float totalhrs = (float)(totalMinutes)/minutesTohrs;
  cout << "Dan watch two movies for " << totalhrs << " hours";
  return 0;
}