//librarys
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <math.h> //add -lm in run

//global vars
int type;
float x, y;
bool i = 1;

//functions w/ no return
void input(char *msg, float *ans){ //imitating the "input()" from python
	printf("%s",msg);
	scanf("%f", ans);
}

void output(float res){ //wether will or not show the 2 digits after the .
	if (res - floor(res) > 0){
		printf("The result is: %.2f\n",res);
	}
	else{
		printf("The result is: %.0f\n",res);
	}
}

void get(){
	input("Type the first number: ", &x);
	input("Type the second number: ", &y);			
}

int main(){
	printf("\nWelcome to the Calculator in C!");

	do{
		sleep(1);
		printf("\n\nChose a operation:\n");
		printf("1 - Sum\n2 - Subtraction\n3 - Multiplication\n4 - Division\n5 - Quit\n:");
		scanf("%d", &type);

		switch (type){

		case 1:
			printf("\nSUM\n");
			get();
			output(x+y);
			break;

		case 2:
			printf("\nSUBTRACTION\n");
			get();
			output(x-y);
			break;

		case 3:
			printf("\nMULTIPLICATION\n");
			get();
			output(x*y);
			break;

		case 4:
			printf("\nDIVISION\n");
			get();
			output(x/y);
			break;

  case 5:
    printf("\nGoodbye!\n");
    return 0;

  default:
    printf("Invalid operation. Try again.\n");
    break;

		}
	}while(true);

	return 0;

}
