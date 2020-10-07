#include <stdio.h>
#include <string.h>

int main(){
    char mystr[20];
    char str[20]="Budi asem";
    char str1[200]="Gantungkan cita-cita mu setinggi langit! Bermimpilah setinggi langit.\n";
    char str2[100]="Jika engkau jatuh, engkau jatuh di antara binatang-binatang";
    char *p1;
    p1 = strchr(str,'u');
    printf("%c", *p1);

    

}