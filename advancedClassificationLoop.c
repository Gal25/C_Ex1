#include <stdio.h>
#include <math.h>

int isPalindrome(int num){
    int reverseNum =0;
     for (int ans= num; ans > 0; ans=ans/10){
        reverseNum = reverseNum*10 + ans%10;
    }
     if (reverseNum == num){return 1;}
     else{return 0; }
}
int isArmstrong(int num){
   int ans=0;
   int temp=0;
   int n = 0;
   int sum = 0;
   
 for (ans = num; ans != 0; ++n) {
       ans /= 10;
   }

   for (ans= num; ans != 0; ans /= 10) {
       temp=ans % 10;
      sum += pow(temp, n);
   }

  
   if (sum == num){return 1;}
else{return 0;}
}
