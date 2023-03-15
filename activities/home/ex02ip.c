#include <stdio.h>

int opt;

void inputI(char *msg, int *var){
    printf("%s", msg);
    scanf("%i", var);
}

void inputF(char *msg, float *var){
    printf("%s", msg);
    scanf("%f", var);
}

void init(){
    printf("\n\nChose an option:\n");
    printf("\n1. Ferraduras\n2. Clock\n3. Age\n4. Balance\n5. Area\n6. Gasolina\n7. Calculator\n8. Bakery");     
    inputI("\n: ", &opt);
    printf("\n");
}

int main(){
    do{
        init();
        switch(opt){

            case 1: 
                printf("Ferraduras\n");
                int hors, paw;
                inputI("Digite quantos cavalos: ", &hors);
                paw = hors * 4;
                printf("Serão necessárias %i ferraduras", paw);
                break;

            case 2:
                printf("Clock\n");
                int hour, min, sec;
                inputI("Digite quantas horas se passaram no dia: ", &hour);
                inputI("Digite quantos minutos se passaram no dia: ", &min);
                sec = 60 * (min + hour*60);
                printf("Se passaram %i segundos do dia", sec);
                break;

            case 3:
                printf("Age\n"); 
                int age, birt, now;
                inputI("Digite seu ano de nascimento: ", &birt);
                inputI("Digite o ano atual: ", &now);
                age = now - birt;
                printf("Você tem %i anos de idade", age);
                break;

            case 4:
                printf("Balance\n");
                float w, p;
                inputF("Digite o peso do seu prato: ", &w);
                p = w * 12;
                printf("Valor a pagar: R$%.2f", p);
                break;

            case 5:
                printf("Area\n");
                float height, width, area;
                inputF("Digite a largura do terreno: ", &width);
                inputF("Digite o comprimento do terreno: ", &height);
                area = width * height;
                printf("A área do terreno é %.2f metros", area);
                break;

            case 6:
                printf("Gasolina\n");
                float pay, price, lit;
                inputF("Digite o valor pago: ", &pay);
                inputF("Digite o preço do litro da gasolina: ", &price);
                lit = pay/price;
                printf("Você abasteceu com %.2f litros de gasolina", lit);
                break;

            case 7:
                int a, b;
                printf("Calculator\n");
                inputI("Digite um valor inteiro para A: ", &a);
                inputI("Digite um valor inteiro para B: ", &b);
                printf("A+B = %i\n", a+b);
                printf("A-B = %i\n", a-b);
                printf("A*B = %i\n", a*b);
                printf("A/B = %i\n", a/b);
                break;

            case 8:
                printf("Bakery\n");
                int broa, pao;
                float save, total;
                inputI("Digite a quantidade de broas: ", &broa);
                inputI("Digite a quantidade de pães franceses: ", &pao);
                total = broa*2 + pao*0.35;
                save = total*0.1;
                printf("Você arrecadou R$%.2f\nVocê deve poupar R$%.2f", total, save);
                break;
        }
    }while(opt < 17);
    return 0;
}
