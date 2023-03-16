#include <stdio.h>

char red="\033[1;31m", green="\033[1;32m", orange="\033[1;33m", purple="\033[1;35m"
blue="\033[1;34m"

void init(){
		for(int i=0; i<=102; i++){
			if(i==51){printf("\n\t\033[32mMYMONEY – DIGITE A OPÇÃO DESEJADA\n\033[0m");}
			else{printf("*");}
	}
}

int main(){
	init();
}
