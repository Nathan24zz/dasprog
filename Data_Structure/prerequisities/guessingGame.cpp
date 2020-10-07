// game using STL array 
#include <iostream>
#include <cstdlib>
#include <time.h>
#include <array>

using namespace std;

void printArray(array<int,251> arr, int count){
  for (int i=0; i<count; i++){
    cout << arr[i] << "\t";
  }
  cout << endl;
}

void playGame(){
  array<int, 251> arr;
  int count=0;
  // int arr[251], count=0;
  int random = rand()%251;
  cout << random << endl;

  while(true){
    int guess;
    cout << "Guess a number ";
    cin >> guess;
    arr[count++]=guess;
    if(guess == random){
      cout << "You Win\n";
      break;
    }
    else if(guess < random){cout << "Too Low\n";}
    else {cout << "Too High\n";}
  }

  cout << "Here all your guessing\n";
  printArray(arr, count);
}

int main(){
  srand(time(NULL));
  int choice;

  do{
    cout << "0. exit\n" << "1. Play Game\n";
    cin >> choice;
    switch (choice)
    {
      case 0:
        cout << "Thank you for playing\n";
        return 0;
      
      case 1:
        cout << "Let's play\n";
        playGame();
        break;
    }

  }while(choice != 0);

}