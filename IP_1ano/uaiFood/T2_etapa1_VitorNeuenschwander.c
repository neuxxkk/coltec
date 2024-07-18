#include <stdio.h>
#include <stdlib.h>


typedef struct{
	int codigo;
	char nome[100];	
}Restaurante;

typedef struct{
	int codigo_prato, codigo_restaurante;
	char descricao[100];
	float preco;
}Prato;

char t[100];
int tamanho_array_restaurante=0, tamanho_array_prato=0;
Prato *p=NULL;
Restaurante *r=NULL;

void input(char txt[100], char type, int *var){
	printf("%s\n", txt);
	
	if (type=='c') scanf(" %99[^\n]", var);
	else if(type=='i') scanf("%d", var);
	else if (type=='f') scanf("%f", var);
}

void criarRestaurante(int i){
	tamanho_array_restaurante++;
	r=(Restaurante *)realloc(r, (i+1)*sizeof(Restaurante));
	sprintf(t, "Cadastre o codigo e nome do restaurante %i: ", i+1);
	input(t, 'i', &r[i].codigo);
	scanf(" %99[^\n]", r[i].nome);
}

void criarPrato(int j, int i){
	p=(Prato *)realloc(p, (tamanho_array_prato+1)*sizeof(Prato));
	scanf("%d", &p[tamanho_array_prato].codigo_prato);
	scanf("%d", &p[tamanho_array_prato].codigo_restaurante);
	scanf(" %99[^0-9]", p[tamanho_array_prato].descricao);
	scanf("%f", &p[tamanho_array_prato].preco);
	tamanho_array_prato++;
}

void header(){
	printf("\n");
	for (int i=0; i<100; i++){
		if (i==50)printf("\nuaiFood - Restaurante\n");	
		printf("*");
	}printf("\n");
}

int menu(int numero_restaurante){
	int opcao_menu, opcao_prato;
	while(opcao_menu){
		printf("\n\n%s - Menu de Opcoes\n", r[numero_restaurante].nome);
		input("\n1 - Mostrar pratos\n\n0 - Logout\n", 'i', &opcao_menu);
		if (opcao_menu){
			while (opcao_prato){ 
				printf("\n%s - Pratos - Menu de Opcoes\n", r[numero_restaurante].nome);
				for (int i=0; i<tamanho_array_prato; i++){
					if (p[i].codigo_restaurante == r[numero_restaurante].codigo){
						printf("\n%d - %s - Preco: R$ %.2f", p[i].codigo_prato, p[i].descricao, p[i].preco);
					}
				}
				printf("\n0 - Voltar ao menu anterior\n");
				scanf("%d", &opcao_prato);

				if (opcao_prato){
					printf("Codigo do prato: %d", opcao_prato);
					printf("\nCodigo do restaurante: %d", p[opcao_prato-1].codigo_restaurante);
					printf("\nNome do prato: %s", p[opcao_prato-1].descricao);
					printf("\nPreco: %.2f\n", p[opcao_prato-1].preco);
				}

			}
		}
	}
}

void login(){
	int v,g;
	int codigo_restaurante_escolhido;
	while (v){
		v=1, g=0;
		printf("\nLOGIN UAIFOOD RESTAURANTE\n");
		input("\nDigite o codigo do restaurante (ou um numero negativo para sair):\n", 'i', &codigo_restaurante_escolhido);
		if(codigo_restaurante_escolhido<0)v=0;
		else{
			for (int i=0; i<tamanho_array_restaurante; i++){
				if (codigo_restaurante_escolhido == r[i].codigo) menu(i);
				else g++;
			}
			if(g==tamanho_array_restaurante)printf("\nRestaurante nao encontrado. Tente novamente.\n\n");
			}
		}
}


int main(){
	header();
	for (int i=0; i<3; i++){
		criarRestaurante(i);
		printf("Cadastre codigo do prato, codigo do restaurante, descricao e preco dos pratos do restaurante %s:\n", r[i].nome);
		for (int j=0; j<4;  j++) criarPrato(j, i);
	}

	login();

	return 0;
}