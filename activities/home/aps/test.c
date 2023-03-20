#include <stdio.h>
#include <math.h>

float M, d, goal, f;
int time;

int main() {
    time = 36;
    f = 0.002;
    printf("%f",goal);
    scanf("%f", &goal);
    d = goal/time;
    M = d;
    while(floor(M)!=goal){
        d = d - 0.01;
        M=d;
        for(int i = 0; i < time; i++){
            M = M * (f+1) + d;
        }
        printf("\nM: %.2f and d: %.2f\n", M,d);
    }
}
