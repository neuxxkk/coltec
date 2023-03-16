
    /*q = '\033['

    #style
    default = f'{q}0m'
    bold = f'{q}1m'
    bright = f'{q}2m'
    italic = f'{q}3m'
    underl = f'{q}4m'

    #color
    black_font = f'{q}30m'
    red_font = f'{q}31m'
    green_font = f'{q}32m'
    yellow_font = f'{q}33m'
    blue_font = f'{q}34m'
    purple_font = f'{q}35m'
    light_blue_font = f'{q}36m'
    white_font = f'{q}37m'

    #bg_color
    black_bg = f'{q}40m'
    red_bg = f'{q}41m'
    green_bg = f'{q}42m'
    yellow_bg = f'{q}43m'
    blue_bg = f'{q}44m'
    purple_bg = f'{q}45m'
    light_blue_bg = f'{q}46m'
    white_bg = f'{q}47m'*/

#include <stdio.h>

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
		for(int i=0; i<=52; i++){
			if(i==26){printf("\n\t\033[1;31mMYMONEY – DIGITE A OPÇÃO DESEJADA\n\033[0m");}
			else{printf("-=");}
	}

	printf("\n");

	for (int n = 1; n < 10; ++n)
	{
		printf("%i. %s\n", n, titulos[n-1]);
	}

	printf("\n");

	for (int o = 0; o < 26; ++o)
	{
		printf("-=");
	}

	printf("\n");
}

int main(){
	init();
}
