// kalau pake dynamic programming caranya sm kyk cari bilangan fibonacci
#include <iostream>

using namespace std;

int rec(int total){
  if (total == 0) {return 1;}
  else if (total < 0) {return 0;}
  else {
    return rec(total-1) + rec(total-2);
  }
}

int main(){
  int a;
  cout << "Jarak untuk sampai ke ujung sungai ";
  cin >> a;
  cout <<"banyak cara katak sampai di ujung sungai "<< rec(a) << endl;
}
// SOAL :
// ada seekor katak ingin menyebrang sungai, sungai tersebut memiliki jarak sebesar "a"
// katak dapat melompat dengan jarak 1 atau 2
// hitung semua kemungkinan katak dapat sampai ke ujung sungai
