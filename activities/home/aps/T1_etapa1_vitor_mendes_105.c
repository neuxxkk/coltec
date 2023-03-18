#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#ifdef _WIN32
    char clean[100] = "cls";

#elif __linux__ || __APPLE
    char clean[100] = "clear";

#else 
    #error "Not supported operational system."

#endif

 char *titulos[] = {"Calculo dos juros reais",
                       "Conversao de moedas",
                       "Calculo da reserva de emergência",
                       "Juros compostos com deposito mensal",
                       "Poupanca para a faculdade",
                       "Plano para juntar dinheiro",
                       "Simulador de empréstimo",
                       "Calculo do imposto de renda",
                       "Independência Financeira"};

void init(){
        system(clean);
		for(int i=0; i<=100; ++i){
			if(i==50){printf("\nMYMONEY – DIGITE A OPÇÃO DESEJADA\n");}
			else{printf("*");}
	}

	printf("\n");

	for (int n = 1; n < 10; ++n)
	{
		printf("(%i) %s\n", n, titulos[n-1]);
	}

	printf("\n");

	for (int o = 0; o < 52; ++o)
	{
		printf("*");
	}

	printf("\n");
}

int main(){
	init();
}