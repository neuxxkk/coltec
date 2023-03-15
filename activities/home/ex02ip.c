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
    printf("\n1. Ferraduras\n2. Clock\n3. Age\n4. Balance\n5. Area\n6. Gasolina\n7. Calculator\n8. Bakery\n9. Autonomia\n10. Volume\n11. Square\n12. Clothes\n13. Number\n14. Converter\n15. Exchange\n16. Meia-coca\n17. Quit");     
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
                float w, v;
                inputF("Digite o peso do seu prato: ", &w);
                v = w * 12;
                printf("Valor a pagar: R$%.2f", v);
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
                printf("Calculator\n");
                int a, b;
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

            case 9:
                printf("Autonomia\n");
                float time, vel, l, dist;
                inputF("Digite o tempo gasto na viagem: ", &time);
                inputF("Digite a velocidade média durante o trajeto: ", &vel);
                dist = time*vel;
                l = dist/12;
                printf("Com uma velocidade média de %.2f km/h em uma viagem de %.2f horas você percorreu %.2f kms e gastou %.2f litros de gasolina", vel, time, dist, l);
                break;

            case 10:
                printf("Volume\n");
                float radius, alt, vol;
                inputF("Digite o raio da lata: ", &radius);
                inputF("Digite a altura da lata: ", &alt);
                vol = 3.14 * (radius*radius) * alt;
                printf("O volume da lata é %.2f", vol);
                break;

            case 11:
                printf("Square\n");
                int n;
                inputI("Digite um número: ", &n);
                printf("O quadrado do número %i é %i", n, n*n);
                break;

            case 12:
                printf("Clothes\n");
                int p, m, g, arr;
                inputI("Digite a quantidade de P: ", &p);
                inputI("Digite a quantidade de M: ", &m);
                inputI("Digite a quantidade de G: ", &g);
                arr = p*10 + m*12 + g*15;
                printf("Você arrecadou R$%i,00", arr);
                break;

            case 13:
                printf("Number\n");
                int z;
                inputI("Digite um número: ", &z);
                printf("Antecessor: %i\nSucessor: %i", z-1, z+1);
                break;

            case 14:
                printf("Converter");
                float grauf, grauc;
                inputF("Digite os graus em F: ", &grauf);
                grauc = ((grauf-32)*5)/9;
                printf("Temperatura convertida: %.2f C", grauc);
                break;

            case 15:
                printf("Exchage");
                int n1, n2, s;
                inputI("Digite o valor A: ", &n1);
                inputI("Digite o valor B: ", &n2);
                printf("Valores A: %i, B: %i", n1, n2);
                s = n1;
                n1 = n2;
                n2 = s;
                printf("\nValores A: %i, B: %i", n1, n2);
                break;

            case 16:
                printf("Meia-cola\n");
                float l1, l2, l3, r;
                inputF("Digite a qtd de latas de 350ml: ", &l1);
                inputF("Digite a qtd de garrafas de 600ml: ", &l2);
                inputF("Digite a qtd de garrafas de 2l: ", &l3);
                r = (l1*350 + l2*600 + l3*2000)/1000;
                printf("Você comprou %.2f litros de Coca", r);
                break;

        }
    }while(opt < 17);
    return 0;
}
