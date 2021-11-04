#include <stdio.h>
#include <math.h>
#include "NumClass.h"


int rev_num (int num, int rev);
int is_Palindrome(int num){
    int reverse= rev_num(num, 0);
    if(reverse == num){
        return 1; 
    }
    return 0;
}

int rev_num (int num, int rev){
    if(num==0){return rev;}
    rev= rev*10 + num%10;
    return rev_num(num/10, rev);
}

int order(int x);
int power(int x, unsigned int y);
int is_Armstrong(int num ){
    int n = order(num);
    int temp = num, sum = 0;
    while (temp!=0) {
        int r = temp % 10;
        sum += power(r, n);
        temp = temp / 10;
    }
 
    if (sum == num)
        return 1;
    else
        return 0;
}
int power(int x, unsigned int y){
    if (y == 0)
        return 1;
    if (y % 2 == 0)
        return power(x, y / 2) * power(x, y / 2);
    return x * power(x, y / 2) * power(x, y / 2);
}
 
int order(int x){
    int n = 0;
    while (x!=0) {
        x = x / 10;
        n++;
       
    }
    return n;
}

