#include <stdio.h>

int hari, bulan, tahun, hari_bayar, bulan_bayar, tahun_bayar;
int hari_max;

int fungsi(int bulan)
{
  if(bulan==1 || bulan==3 || bulan==5 || bulan==7 || bulan==8 || bulan==10 || bulan==12){hari_max = 31;}
  else if(bulan==4 || bulan==6 || bulan==9 || bulan==11){hari_max = 30;}
  else if(bulan==2){hari_max=28;}
  return hari_max;
}
int main()
{
int i, pinjaman;
  int temp, temp1=0, temp2, temp3;
  float a,b,c;
  scanf("%d %d %d", &hari, &bulan, &tahun);
  scanf("%d %d %d", &hari_bayar, &bulan_bayar, &tahun_bayar);
  scanf("%d", &pinjaman);

  if (tahun == tahun_bayar)
  {
    for(i=bulan; i<=bulan_bayar; i++)
    {
      // if (i==bulan)
      // {
      //   fungsi(i);
      //   a=hari_max-hari;
      //   b=a/hari_max;
      //   temp2 = b*0.04*pinjaman;
        
      //   printf("%d\n", temp2);
      // }
      // else if(i!=bulan_bayar)
      // {
      //   fungsi(i); 
      //   temp = 0.04*pinjaman;
      //   temp1 = temp1 + temp;
      //   printf("%d\n", temp);
      // }
      printf("1\n");
      if(i==bulan_bayar)
      {
        fungsi(i);
        printf("%d\n",hari_bayar);
        printf("%d\n",hari_max);
        a = 5/30;
        temp3 = a*0.04*pinjaman;
        printf("%.2f", a);
      }
      
    }
    pinjaman = pinjaman + temp1;
    //printf("%d", pinjaman);
  
  }
}