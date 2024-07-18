#include <stdio.h>
#include <stdlib.h>
#include "restaurantes.c"

int opcao, i;

Restaurante *r=NULL;

void header(){
	printf("\n");
	for (int i=0; i<100; i++){
		if (i==50)printf("\nuaiFood - Restaurante\n");	
		printf("*");
	}printf("\n");
}


void criarRestaurante(){
	header();
	printf("Criar novo restaurante - Digite o nome do novo restaurante: ");
	r = (Restaurante *)realloc(r, 1+i*sizeof(Restaurante));
	getchar();
	fgets(r[i].nome, 100, stdin);
	r[i].codigo=i+1;
}

void login(){
	printf("LOGIN UAIFOOD RESTAURANTE");
}

int menu(){
	header();
	printf("Selecione a acao desejada:\n1 - Criar restaurante\n2 - Fazer login\n-1 - Sair\n");
	scanf("%i", &opcao);

	return opcao;
}

int main(){
	while(1){
		if (menu()<0) break;
		switch (menu()){
		case 1: criarRestaurante();
		case 2: login();
		default: break;
		}
	}

	return 0;
}