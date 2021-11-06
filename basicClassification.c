#include <stdio.h>
#include <math.h>

int isPrime(int num){
    if (num==0){
        return 0;}
    if (num==1){return 1;}
    for(int i = 2; i < num; i++){
        if (num%i == 0 && num != i){
            return 0;}
    }   
    return 1;
}
int facturial(int i);
int isStrong(int num){
    int sum=0;
    int fact;
    for (int ans=num; ans != 0; ans=ans/10){
        fact= facturial(ans%10);
        sum= sum+fact;
    }
    if(sum==num){return 1;}

return 0;

}

int facturial(int i){
    int mul=1;
    for (int j = 1; j <= i ; j++)
    {
        mul=mul*j;
    }
    return mul;
}
