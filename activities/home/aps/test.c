#include <stdio.h>

char *coins[] = {"Real (BRL)", "Dolar (USD)", "Euro (EUR)", "Libra Esterlina (GBP)"};

struct coin {
    char* name;
    double fee;
};

struct coin array[] = {
    {coins[0], 5.27},
    {coins[0], 6.22},
    {coins[0], 7.24},
    {coins[0], 0.19},
    {coins[0], 0.16},
    {coins[0], 0.14}
};

int main() {
    // print the array of coins with their fees
    for(int i = 0; i < 6; i++) {
        printf("%s -> %s: fee = %lf\n", coins[0], coins[i+1], array[i].fee);
    }
    return 0;
}
