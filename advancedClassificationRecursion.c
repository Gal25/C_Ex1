#include <stdio.h>
#include <math.h>

int rev_num (int num, int rev);
int isPalindrome(int num){
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

int NumOfdigit(int x);
int pow(int x, unsigned int y);
int isArmstrong(int n){
    int k = NumOfdigit(n);
    int temp = n, sum = 0;
    while (temp!=0) {
        int r = temp % 10;
        sum += pow(r, k);
        temp = temp / 10;
    }
 
    if (sum == n)
        return 1;
    else
        return 0;
}
int pow(int x, int y){
    if (y == 0)
        return 1;
    if (y % 2 == 0)
        return pow(x, y / 2) * pow(x, y / 2);
    return x * pow(x, y / 2) * pow(x, y / 2);
}
 
int NumOfdigit(int x){
    int n = 0;
    while (x!=0) {
        x = x / 10;
        n++;
       
    }
    return n;
}
