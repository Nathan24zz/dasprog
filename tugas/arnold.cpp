#include <iostream>
#include <math.h>
#include <string.h>

class Segitiga
{
public:
  float panjang, lebar, luas, keliling, miring;

  void luasSegitiga(float panjang, float lebar)
  {
    luas = panjang*lebar/2;
    std::cout << "Luas Segitiga : "<< luas << std::endl;
  }

  void kelilingSegitiga(float panjang, float lebar)
  {
    miring = sqrt(panjang*panjang + lebar*lebar);
    keliling = panjang + lebar + miring;
    std::cout << "Keliling Segitiga : "<< keliling <<std::endl;
  }
};

class SegiEmpat : public Segitiga
{
public:
  void luasSegiempat(float panjang, float lebar)
  {
    luas = panjang*lebar;
    std::cout << "Luas Segiempat : "<< luas <<std::endl;
  }

  void kelilingSegiempat(float panjang, float lebar)
  {
    keliling = 2*(panjang+lebar);
    std::cout << "Keliling Segiempat : "<< keliling <<std::endl;
  }
};

class Trapesium : public Segitiga
{
public:
  float atas, c;
  void luasTrapesium(float panjang, float lebar, float atas)
  {
    luas = (panjang+atas)*lebar/2;
    std::cout << "Luas Trapesium : "<< luas <<std::endl;
  }

  void kelilingTrapesium(float panjang, float lebar, float atas)
  {
    c = panjang - atas;
    miring = sqrt(c*c + lebar*lebar); 
    keliling = 2*miring + panjang + lebar;
    std::cout << "Keliling Trapesium : "<< keliling <<std::endl;
  }
};

int main()
{
  //declare object
  Segitiga segitiga;
  SegiEmpat segiempat;
  Trapesium trapesium;

  //deklarasi variabel
  int input;
  float p,l,a;

  std::cout << "pengen seng ndi bos (1=segitiga, 2=segiempat, 3=trapesium)" << std::endl;
  std::cin >> input;

  if(input == 1){
    std::cout << "Masukkan alas : ";
    std::cin >> p; 
 
    std::cout << "Masukkan tinggi : ";
    std::cin >> l;

    segitiga.luasSegitiga(p,l);
    segitiga.kelilingSegitiga(p,l);
  }
  else if(input == 2){
    std::cout << "Masukkan panjang : ";
    std::cin >> p; 
 
    std::cout << "Masukkan lebar : ";
    std::cin >> l;

    segiempat.luasSegiempat(p,l);
    segiempat.kelilingSegiempat(p,l);
  }
  else {
    std::cout << "Masukkan alas : ";
    std::cin >> p; 

    std::cout << "Masukkan atas: ";
    std::cin >> a;
 
    std::cout << "Masukkan tinggi : ";
    std::cin >> l;

    trapesium.luasTrapesium(p,l,a);
    trapesium.kelilingTrapesium(p,l,a);

  }

}