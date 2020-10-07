#include <iostream>
#include <vector>

using namespace std;

// array jika di-pass melalui fungsi tdk perlu pake "&"
int i =0 ;
int addArray(int n, int *arr){
  arr[i] = n;
  i++;
}

void printArray(int arr[]){
  for (int i=0; i<5; i++){
    cout <<"elemen array ke-"<< i <<" adalah " << arr[i] << endl;
  }
}

int main(){
  vector <int> vec{10,20,30};
  // vec.push_back(10);
  // vec.push_back(20);
  // vec.pop_back();
  // iterator itu kyk pointer tp lebih canggih
  vector <int> :: iterator it = vec.begin(); 
  vector <int> :: reverse_iterator rit = vec.rbegin();
  
  cout <<"elemen pertama =  " << vec.front() << endl;
  cout <<"elemen terakhir = " << vec.back() << endl;
  cout <<"ukuran vector = " << vec.size() << endl;

  cout << "iterator pertama = "<< *it << endl;
  it++;
  cout << "iterator setelah nilainya ditambah 1 = "<< *it << endl;
  cout << "reverse iterator pertama = "<< *rit << endl;
  rit++;
  cout << "iterator setelah nilainya ditambah 1 = "<< *rit << endl;
  cout << vec.empty() << endl <<endl;  // nilainya 0 jika vektor ada isinya, nilainya 1 jika vektor ada isinya

  vec.insert(it-1,0);
  for (int i=0; i<vec.size();i++){
    cout << "elemen ke-" << i << " adalah " << vec[i] << endl; 
  }

  int arr[5];
  addArray(5, arr);
  addArray(10, arr);
  addArray(15,arr);
  printArray(arr);
}