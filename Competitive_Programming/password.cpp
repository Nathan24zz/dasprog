#include <iostream>

using namespace std;

void rec(int n, int a, int catat[], bool pernah[]){
  if (n>a){
    for (int i=1; i<=a; i++){
      cout << catat[i];
    }
    cout << endl;
  }
  else {
    for (int i=1; i<=a; i++){
      if (!pernah[i]){        // cek apakah i sdh permah digunakan
        pernah[i]=true;       // jika belum, gunakan. Pada pernah[] ubah jadi true
        catat[n] = i;
        rec(n+1, a, catat, pernah);
        pernah[i]=false;      // selesai menggunakan kembalika lagi jadi false
      }
    }
  }
  
}

int main(){
  int a;
  cin >> a;
  int catat[a+1]={0};
  bool pernah[a+1]={false};
  rec(1, a, catat, pernah);
}



