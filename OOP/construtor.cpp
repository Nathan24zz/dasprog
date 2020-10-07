#include <iostream>
#include <string>

using namespace std;

class Mahasiswa{
  public:
    string nama;
    string NIM;
    string jurusan;
    double IPK;  

    Mahasiswa(string inputNama, string inputNIM, string inputJurusan, double inputIPK){
      Mahasiswa::nama = inputNama;
      Mahasiswa::jurusan = inputJurusan;
      Mahasiswa::NIM = inputNIM;
      Mahasiswa::IPK = inputIPK;
      
      cout << Mahasiswa::nama << endl;
      cout << Mahasiswa::jurusan << endl;
      cout << Mahasiswa::NIM << endl;
      cout << Mahasiswa::IPK << endl;
    }
};

int main()
{ 

  Mahasiswa mahasiswa1("ucup", "031", "tekfis", 10);
  Mahasiswa mahasiswa2("otong", "032", "tekfis", 90);

  return 0;
}
