#include <iostream>
#include <math.h>

using namespace std;

class CTitik{
public:
  int x, y;

  void jumlahDuaTitik(int titik1X, int titik1Y, int titik2X, int titik2Y){
    x=titik1X + titik2X;
    y=titik1Y + titik2Y;
  }

  void tampilkanTitik(){
    cout << x << endl;
    cout << y << endl;
  }
};

class CGaris : public CTitik
{
public:
  int x1, y1, panjang;
  void panjangGaris(int titik1X, int titik1Y, int titik2X, int titik2Y){
    x1=titik1X - titik2X;
    y1=titik1Y - titik2Y;
    panjang = sqrt(pow(x1, 2) + pow(y1, 2));
    cout << panjang << endl;
  }
};

int main(){
  int titik1X=2, titik1Y=4, titik2X=5, titik2Y=8;
  CTitik Baru;
  Baru.jumlahDuaTitik(titik1X, titik1Y, titik2X, titik2Y);
  Baru.tampilkanTitik();

  CGaris Baru1;
  Baru1.panjangGaris(titik1X, titik1Y, titik2X, titik2Y);
  return 0;
}