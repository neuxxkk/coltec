#include <stdio.h>

typedef struct{
	int codigo_prato, codigo_restaurante;
	char descricao[100];
	float preco;
}Prato;

r=(Restaurante *)realloc(r, (i+1)*sizeof(Restaurante));
	
		sprintf(t, "Cadastre o codigo e nome do restaurante %i: ", i+1);
		input(t, 'i', &r[i].codigo);
		scanf(" %99[^\n]", r[i].nome);