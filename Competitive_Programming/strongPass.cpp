#include <iostream>
#include <string>

using namespace std;

int main(){
  int l_case=0, u_case=0, digit=0, special=0, length=0, result, l, temp;
  string str;
  cin >> l;
  cin >> str;
  
  for (int i=0; i<l; i++){
    if(islower(str[i])){l_case=1;}
    if(isupper(str[i])){u_case=1;}
    if(isdigit(str[i])){digit=1;}
    if(!isalpha(str[i]) && !isdigit(str[i])){special=1;}
  }
  temp = l_case + u_case + digit + special;

  if(l<6){
    if(l<=3){result = 6-l;}
    else if(l>=4 && temp==4){result = 6-l;}
    else if(l==4 && temp==3){result = 2;}
    else {result = 4-temp;}
  }
  if(l>=6){result = 4-temp;}
  cout << result;
}