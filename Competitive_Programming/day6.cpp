#include <iostream>

using namespace std;

int main(){
  int f, u, o, n;
  cout << "Enter free disk size in bytes ";
  cin >> f;
  cout << "Enter used disk size in bytes ";
  cin >> u;
  cout << "Enter size of deleted file ";
  cin >> o;
  cout << "Enter size of creating new file ";
  cin >> n;
  int totalDiskSize = f + u;
  int currentUsedDiskSize = u - o + n;
  cout << "Free Space Available " << totalDiskSize - currentUsedDiskSize << " bytes"; 
  return 0;
}