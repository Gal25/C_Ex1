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

int NumOfDigit(int num);
int ArmHelper(int num, int NumDigit);
int isArmstrong(int num ){
    int n = NumOfDigit(num);
    int ans = num;
    int sum = 0;
    while (ans != 0) {
        sum += ArmHelper(ans%10, n);
        ans = ans / 10;
    }
 
    if (sum == num)
        return 1;
    else
        return 0;
}
int ArmHelper(int num, int NumDigit){
    if (NumDigit == 0){return 1;}
    if (NumDigit%2 == 0){
        return ArmHelper(num, NumDigit / 2) * ArmHelper(num, NumDigit / 2);}
    return (num * ArmHelper(num, NumDigit / 2) * ArmHelper(num, NumDigit / 2));
}
 
int NumOfDigit(int num){
    int n = 0;
   for (int ans = num; ans != 0; ++n) {
       ans /= 10;
   }
    return n;
}
