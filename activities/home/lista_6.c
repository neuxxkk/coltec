#include <stdio.h>

void init(){
	printf("\033[1mLISTA 6\033[0m\n");
	for (int i = 1; i<9; i++){
		printf("\033[1m%i.\033[0m Execício %i\n", i,i);
	}
}

int main(){

	init();

	switch (){}

}