#include <stdio.h>

char x[100];
char read[100];

void input(char* txt, char* var){
	printf("%s", txt);
	fgets(var, 100, stdin);
}

int main(){
	input("Your text: ", x);

	system("ls");
	system("cat test.txt");

	FILE *fp = fopen("test.txt", "w+");

	fprintf(fp, "%s", x);

	fgets(read, 100, fp);

	fclose(fp);

	printf("%s\n", read);

	return 0;
}