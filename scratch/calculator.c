#include <stdio.h>

void input(char *msg, float *ans){
		printf("%s",msg);
		scanf("%f", ans);
}

int main(){
		float type, x, y, res;
		printf("Welcome to the Calculator in C!\n\nChose a operation:\n");
		printf("1 - Sum\n2 - Subtraction\n3 - Multiplication\n4 - Division\n:");

		scanf("%f", &type);
		if (type == 1){
				input("Type the first number: ", &x);
				input("Type the second number: ", &y);
			
				res = x+y;

				printf("The result is: %.2f\n",res);
	}
		return 0;
}
