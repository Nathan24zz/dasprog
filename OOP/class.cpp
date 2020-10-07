#include <iostream>

using namespace std;

class Log{
public:
  enum Level
  {
    levelError = 0, levelWarning, levelInfo
  };

private:
  Level m_LogLevel = levelInfo;

public:
  void setLevel(Level level){
    m_LogLevel = level;
  }
  void error(const char* message){
    if(m_LogLevel >= levelError){
      cout <<"[ERROR] "<< message << endl;
    }
  }
  void warn(const char* message){
    if(m_LogLevel >= levelWarning){
      cout <<"[WARNING] "<< message << endl;
    }
  }
  void info(const char* message){
    if(m_LogLevel >= levelInfo){
      cout <<"[INFO] "<< message << endl;
    }
  }
  // nyoba static dalam fungsi
  //  void function(){
  //   static int i = 0;
  //   i++;
  //   cout << i <<endl;
  // }
};

int main(){
  Log log;
  log.setLevel(log.levelWarning);
  log.warn("Hello");
  log.info("Hello");
  log.error("Hello");  
  // log.function();
  // log.function();
  // log.function();
  // log.function();
  // log.function();
}