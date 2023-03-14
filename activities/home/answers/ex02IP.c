#include <stdio.h>

int opt;

void input(char *msg, int *var){
    printf("%s" ,msg);
    scanf("%i", var);
}

int main(){
    printf("Chose an option:\n");
    printf("1. Ferraduras\n2. Clock\n3. Age\n");
    
    input(": ", &opt);

    switch(opt){
        case 1: 
            printf("One");
            break;
        case 2: 
            printf("Two");
            break;
        case 3:
            printf("Three"); 
            break;
    }
    return 0;
}
