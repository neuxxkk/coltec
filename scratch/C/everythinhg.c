#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void input(char *message, char *value) {
    printf("%s", message);
    scanf("%s", value);
}

int main() {
    char name[100];
    int i, min, max, age;

    input("Hello what's your name? ", name);

    printf("Hello %s!\n",name);
    sleep(1);

    printf("This is an Adult program (+18)\nHow old are you? ");
    scanf("%d", &age);

    if (age < 18) {
        printf("NO! You can't access this site!\n");
        return 0;
    }
    else {
        printf("OK! You are allowed!\n");
    }

    printf("Type a range\nMin: ");
    scanf("%d", &min);
    printf("Max: ");
    scanf("%d", &max);

    for (i = min; i <= max; i++) {
        printf("%d\n", i);
        usleep(500000);
    }

    return 0;
}

