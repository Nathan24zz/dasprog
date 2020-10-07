#include <stdio.h>
int main(){

int data[4],i;
FILE *fp;

//char nama[]="test.txt";

fp=fopen("test.txt","r+");

for (i=0;i<4;i++){
    fscanf(fp,"%d", &data[i]);}

fprintf(fp,"NATHAN");
fclose(fp);
for (i=0;i<4;i++){
    printf("%d ", data[i]);
    }
}