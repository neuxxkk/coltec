#include <stdio.h>

int main() {
    char name[100];
    int i, min, max, age;

    printf("Whats your name?\n");
    scanf("%s", name);

    printf("Hello %s!\n",name);
    sleep(1);

    printf("This is an Adult program (+18)\nHow olds are you?");
    scanf("%d", &age);

    if (age<18){
        printf("NO! You can't acces this site!\n");
        return 0;
    }
    else{
        printf("OK! You are allowed!");
        }

    printf("Type a range\nMin: ");
    scanf("%d", &min);
    printf("Max: ");
    scanf("%d", &max);

    for (i=min;i<=max;i++){
    printf("%d\n", i);
    usleep(500000);
    }

    return 0;
}
