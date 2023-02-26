#include <stdio.h>

int main(){
int x, y;
printf("Hello, world!\nNumber 1: ");
scanf("%d", &x);
printf("Number 2: ");
scanf("%d", &y);
int res = x+y;
printf("The sum between those two numbers is: %d\n",res);
return 0;
}
