#include <graphics.h>

void Pesawat(int x,int y,float s)
{
  moveto(-1*s+x,0*s+y);
  lineto(1*s+x,0*s+y);
  lineto(1*s+x,5*s+y);
  lineto(-1*s+x,5*s+y);
  lineto(-1*s+x,0*s+y);

  moveto(-3*s+x,1*s+y);
  lineto(3*s+x,1*s+y);
  lineto(3*s+x,2*s+y);
  lineto(-3*s+x,2*s+y);
  lineto(-3*s+x,1*s+y);

  moveto(-2*s+x,4*s+y);
  lineto(2*s+x,4*s+y);
  lineto(2*s+x,5*s+y);
  lineto(-2*s+x,5*s+y);
  lineto(-2*s+ Pesawat(x,y,100);x,4*s+y);
}


int main()
{
  int gd = DETECT, gm; 
  initgraph(&gd, &gm, NULL);
  int x,y;
  int x1,y1;
  float s;
  s=20;
  x=100;
  y=100;
  x1=40;
  y1 =500;
  
  
  while(!kbhit())
   {
      cleardevice();
      x=mousex();
      y=mousey();
      Pesawat(x,y,10);
      Pesawat(x1,y1,20);
      y1=y1-10;
      if (y1<0 p="">      {
          y1=500;
          x1=x1+50;
      }


      //xp=mousex();
      //yp=mousey();
      // circle(xp,yp,20);

      // circle(x,y,20);
      // x=x+2;
      // if(x>500)
      // {
      //     x=0;
       //}
       delay(50);
   }
   closegraph();
}
 
