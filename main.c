#include <stdio.h>
#include <math.h>
#include "NumClass.h"


int main(){

   int num1,num2;
     printf("Please enter 2 numbers: ");
     scanf("%d %d",&num1 , &num2);
         
        if (num2 < num1){
        int temp= num2;
        num2 = num1;
        num1 = temp;
    }
    printf("The Armstrong numbers are:");
     for(int i=num1;i<=num2;i++){
         int ans=isArmstrong(i);
         if(ans==1)
         printf(" %d",i);
     }


      printf("\n");
      printf("The Palindromes are:");
     for(int i=num1;i<=num2;i++){
         int ans=isPalindrome(i);
         if(ans==1)
         printf(" %d",i);
     }

     printf("\n");
     printf("The Prime numbers are:");
     for(int i=num1; i<=num2; i++){
         int ans=isPrime(i);
         if(ans==1) {
             printf(" %d",i);
         }
     }
    
      printf("\n");
      printf("The Strong numbers are:");
     for(int i=num1; i<=num2; i++){
         int ans=isStrong(i);
         if(ans==1)
         printf(" %d",i);
     }
    printf("\n");
    printf("\n");
     
     return 0;

     
 }
