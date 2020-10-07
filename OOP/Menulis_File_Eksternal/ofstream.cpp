#include <iostream>
#include <fstream>

using namespace std;

int main()
{
  // ios::out = ios::trunc gunanya utk me rewrite
  // ios::app = menambahkan pada baris selanjutnya
  ofstream myFile;
  int a = 1234;
  myFile.open("data1.txt", ios::trunc);
  myFile << "menuliskan baris baru pada data 1\n";
  myFile << a;
  myFile.close();

  myFile.open("data2.txt", ios::app);
  myFile << "\nmenuliskan baris baru pada data 2";
  myFile.close();

  return 0;
}
