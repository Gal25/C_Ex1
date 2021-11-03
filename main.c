#include <stdio.h>
#include <math.h>
#include "NumClass.h"
#include "basicClassification.c"
#include "advancedClassificationLoop.c"

void main(){

     int num1,num2;
     printf("Please enter positive number: ");
     scanf("%d",&num1);
     printf("Please enter positive number: ");
     scanf("%d",&num2);
         
        if (num2 < num1){
        int temp= num2;
        num2 = num1;
        num1 = temp;
    }
    printf("The Amstrong numbers between %d to %d are:",num1,num2);
     for(int i=num1;i<=num2;i++){
         int ans=isArmstrong(i);
         if(ans==1)
         printf(" %d",i);
     }


      printf("\n");
      printf("The Palindrom numbers between %d to %d are:",num1,num2);
     for(int i=num1;i<=num2;i++){
         int ans=isPalindrome(i);
         if(ans==1)
         printf(" %d",i);
     }

     printf("\n");
     printf("The prime numbers between %d to %d are:",num1,num2);
     for(int i=num1; i<=num2; i++){
         int ans=isPrime(i);
         if(ans==1) {
             printf(" %d",i);
         }
     }
    
      printf("\n");
      printf("The Strong numbers between %d to %d are:",num1,num2);
     for(int i=num1; i<=num2; i++){
         int ans=isStrong(i);
         if(ans==1)
         printf(" %d",i);
     }
    printf("\n");

     
 }