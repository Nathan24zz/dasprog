// medium question
#include <iostream>
// membuat batas max dari array yg dpt menyimpan hasil factorial yg besar
#define MAX 100

using namespace std;

int result[MAX];
// banyaknya elemen pada array
int result_size;

// fungsi untuk mengalikan "n" dengan result[] dan meng-update hasil dalam urutan terbalik
void multiply(int n){
  int carry = 0;
  // perkalian satu per satu "n" dengan setiap digit individual dari result[]
  for (int i=0; i<result_size; i++){
    int product = result[i]*n + carry;
    result[i] = product % 10; // menyimpan digit terakhir dari "product" dalam result[]
    carry = product/10; // menaruh sisanya pada "carry"
  }
  // jika setelah perulangan nilai "carry" tidak 0, 
  // maka nilai tsb akan dimasukkan dlm result[] dan menambah "resul_size"
  while(carry){
    result[result_size] = carry%10;
    carry = carry/10;
    result_size++;
  }
}

// fungsi ini mencari faktorial dari suatu angka dan menampilkannya pada layar
void factorial(int x){
  result[0]=1;
  result_size = 1;

  // menerapkan formula faktorial sederhana formula n! = 1 * 2 * 3 * 4 ... * n
  for (int i=2; i<=x; i++){
    multiply(i);
  }
  // mencetak hasil dengan urutan yg dibalik lagi agar jawaban sesuai
  for (int i=result_size-1; i>=0; i--){
    cout << result[i];
  }
}

int main(){
  int a;
  cin >> a;
  factorial(a);
  return 0;
}

