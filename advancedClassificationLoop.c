#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int is_Palindrome(int num){
    int rev_num =0;
    int ans= num;
    while (num > 0){
        rev_num = rev_num*10 + num%10;
        num= num/10;
    }
     if (rev_num == ans){return 1;}
     else{return 0; }
     
}
int is_Armstrong(int num){
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
