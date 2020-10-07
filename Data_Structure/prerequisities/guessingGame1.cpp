// game using vector
#include <iostream>
#include <cstdlib>
#include <time.h>
#include <vector>

using namespace std;

void printVector(vector<int>& vec){
   for (int i=0; i<vec.size(); i++){
    cout << vec[i] << "\t";
  }
  cout << endl;
}

void playGame(){
  vector<int> vec;
  
  int random = rand()%251;
  cout << random << endl;

  while(true){
    int guess;
    cout << "Guess a number ";
    cin >> guess;
    vec.push_back(guess);
    if(guess == random){
      cout << "You Win\n";
      break;
    }
    else if(guess < random){cout << "Too Low\n";}
    else {cout << "Too High\n";}
  }

  cout << "Here all your guessing\n";
  printVector(vec);
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