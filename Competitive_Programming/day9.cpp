#include <iostream>

using namespace std;

int main(){
  int nSweater = 3, nComputerGame = 1, nBracelet = 2, returnBracelet = 1;
  int sweaterValue = 68, computerGameValue = 75, braceletValue = 43;
  int refund = 10;
  int totalBracelet = nBracelet - returnBracelet;

  cout << "Total cost of the gift $" 
  << nSweater * sweaterValue + nComputerGame * computerGameValue + totalBracelet * braceletValue - refund << endl; 

  return 0;
}