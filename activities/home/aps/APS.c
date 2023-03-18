#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#ifdef _WIN32
    char clean[100] = "cls";
#elif __linux__ || __APPLE__
    char clean[100] = "clear";
#else 
    #error "Not supported operational system."
#endif

int option;

char *titulos[] = {
    "Calculo dos juros reais",
    "Conversão de moedas",
    "Calculo da reserva de emergência",
    "Juros compostos com deposito mensal",
    "Poupança para a faculdade",
    "Plano para juntar dinheiro",
    "Simulador de empréstimo",
    "Cálculo do imposto de renda",
    "Independência Financeira"
};

void input(char *type, char *msg, void *var){
    if(msg == NULL){msg = "";}
    printf("%s", msg);
    scanf(type, var);
}

void menu(){
    system(clean);
    for(int i=0; i<=100; ++i){
        if(i==50){printf("\nMYMONEY – DIGITE A OPÇÃO DESEJADA\n");}
        else{printf("*");}
    }
    
    printf("\n");

    for (int n = 1; n < 10; ++n){
        printf("(%i) %s\n"    , n, titulos[n-1]);
    }

    printf("(0) Sair\n");

    for (int o = 0; o < 50; ++o){
        printf("*");
    }

    printf("\n: ");
    input("%i", NULL, &option);
}

void back(){
    int back;
    input("%i", ("\n1. Menu \t\t\t\t 2. Sair\n: "), &back);
    switch(back){
        case 1:break;
        case 2:exit(0);
    }
}

void title(){
    system(clean);
    char str[100];
    strcpy(str, titulos[option-1]);
    for (int z = 0; str[z]; ++z){
        str[z] = toupper(str[z]);
    }

    printf("\n%s\n", str);
}

//sec1
void real_fee(){
    title();
    float nominal_fee, inflation, real_fee;
    input("%f", "Digite a taxa de juros nominal a.a. em %: ", &nominal_fee);
    input("%f", "Digite a taxa de inflação a.a. em %: ", &inflation);

    real_fee = ((1+nominal_fee/100) / (1+inflation/100) - 1)*100;

    printf("Taxa de juros reais a.a. em %: %.2f\n", real_fee);
}

//sec2
void coin_conveter(){

    title();
}

int main(){
    do{
        menu();
        switch(option){

            case 0:break;

            case 1:
                real_fee();
                back();
                break;

            case 2:
                coin_conveter();
                back();
                break;

            default:
                printf("Opcão inválida\n");
                sleep(1);
        }
    }while(option!=0);
    return 0;
}
