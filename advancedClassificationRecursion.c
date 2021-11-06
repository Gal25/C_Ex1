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

int order(int x);
int ArmHelper(int x, int y);
int isArmstrong(int num ){
    int n = order(num);
    int temp = num, sum = 0;
    while (temp!=0) {
        int r = temp % 10;
        sum += ArmHelper(r, n);
        temp = temp / 10;
    }
 
    if (sum == num)
        return 1;
    else
        return 0;
}
int ArmHelper(int x, unsigned int y){
    if (y == 0)
        return 1;
    if (y % 2 == 0)
        return ArmHelper(x, y / 2) * ArmHelper(x, y / 2);
    return x * ArmHelper(x, y / 2) * ArmHelper(x, y / 2);
}
 
int order(int x){
    int n = 0;
    while (x!=0) {
        x = x / 10;
        n++;
       
    }
    return n;
}
