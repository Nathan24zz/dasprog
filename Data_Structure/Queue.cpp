#include <iostream>

using namespace std;

class Queue{
  private:
    int front=-1, rear=-1, arr[5];
    int n = sizeof(arr)/sizeof(arr[0]);
  public:
    bool isEmpty(){
      if (front==-1 && rear==-1)return true;
      else return false;
    }
    bool isFull(){
      if(rear == n-1){
        return true;
      }
      else return false;
    }
    void enqueue(int value){
      if(isFull()){return;}
      else if(isEmpty()){
        rear = front = 0;
      }
      else {
        rear++;
      }
      arr[rear] = value;
    }
    int dequeue(){
      int x=0;
      if(isEmpty()){return 0;}
      else if(front == rear){
        x = arr[front];
        front = rear = -1;
      }
      else {
        x = arr[front];
        front++;
      }
      return x;
    }
};

int main(){
  Queue q1;
  int option, value, position;

  do{
    cout << "What operation do you want to perform? Select option number. Enter 0 to exit." << endl;
    cout << "1. enqueue()" << endl;
    cout << "2. dequeue()" << endl;
    cout << "3. isEmpty()" << endl;
    cout << "4. isFull()" << endl<<endl;

    cin >> option;

    switch (option)
    {
    case 0:
      break;
    
    case 1:
      cout << "Enter the value"<<endl;
      cin >> value;
      q1.enqueue(value);
      cout << endl;
      break;

    case 2:
      cout << "dequeue function called - dequeue value: ";
      cout << q1.dequeue()<<endl;
      break;
    
    case 3:
      if(q1.isEmpty()){
        cout << "Queue is Empty"<<endl;
      }
      else {
        cout << "Queue is not Empty"<<endl;
      }
      break;

    case 4:
      if(q1.isFull()){
        cout << "Queue is Full"<<endl;
      }
      else {
        cout << "Queue is not Full"<<endl;
      }
      break;
    
    default:
      cout << "Masukkan angka dari 0 - 4"<< endl;
      break;
    }
  }while(option!=0);
}