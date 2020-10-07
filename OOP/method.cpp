#include <iostream>
#include <string>

using namespace std;

class Mahasiswa{
  public:
    //atribut
    string nama;
    double IPK;

    Mahasiswa(string nama, double IPK){
      Mahasiswa::nama = nama;
      Mahasiswa::IPK = IPK;
    }
    //method tanpa parameter dan tanpa return
    void tampilkanData(){
      cout <<"Nama saya : "<< Mahasiswa::nama << endl;
      cout <<"IPK saya : " << Mahasiswa::IPK << endl;
    }
    //method dengan parameter tanpa return
    void ubahNama(const char* namaBaru){
      Mahasiswa::nama = namaBaru;
    }
    //method tanpa parameter denga return
    string getNama(){
      return Mahasiswa::nama;
    }
    double getIPK(){
      return IPK;
    }
    //method dengan parameter dengan return
    double katrolIPK(const double& tambahanNilai){
      return Mahasiswa::IPK + tambahanNilai;
    }
};



int main()
{
  Mahasiswa mahasiswa1("ucup", 10);
  Mahasiswa mahasiswa2("otong", 5);
  mahasiswa1.tampilkanData();
  mahasiswa2.tampilkanData();

  mahasiswa1.ubahNama("Mario");
  mahasiswa1.tampilkanData();

  string dataNama = mahasiswa1.getNama();
  cout << dataNama << endl;
  cout << mahasiswa1.getIPK() << endl;
  cout << "nilai katrol : " << mahasiswa2.katrolIPK(1) <<endl;

  return 0;
}
