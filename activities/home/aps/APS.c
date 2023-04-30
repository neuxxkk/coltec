#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <unistd.h>

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
    "Conversao de moedas",
    "Calculo da reserva de emergencia",
    "Juros compostos com deposito mensal",
    "Poupanca para a faculdade",
    "Plano para juntar dinheiro",
    "Simulador de emprestimo",
    "Calculo do imposto de renda",
    "Independencia Financeira"
};

struct system{
    void(*inp)();
    void(*back)();
    void(*title)();
};


void input(const char *type, const char *msg, void *var) {
    if (msg == NULL)
        msg = "";
    printf("%s", msg);
    if (scanf(type, var) == 1)
       return;
    else{
        printf("Entrada invalida\n");
        getchar();
        input(type, msg, var);
    }
}



void back(){
    int back;
    input("%i", ("\n1. Menu \t\t\t\t\t\t\t\t      2. Sair\n: "), &back);
    switch(back){
        case 1:break;
        case 2:exit(0);
    }
}

void title(){
    system(clean);
    char str[100];
    strcpy(str, titulos[option-1]);
    for (int i = 0; str[i]; ++i)
        str[i] = toupper(str[i]);

    printf("\n%s\n\n", str);
}

struct system sys = {input, back, title}; //instanciating the functions in the struct

void menu(){
    system(clean);
    for(int i=0; i<=100; ++i){
        if(i==50) printf("\nMYMONEY – DIGITE A OPCAO DESEJADA\n"); 
        else printf("*");
    }
    
    printf("\n");

    for (int n = 1; n < 10; ++n) printf("(%i) %s\n", n, titulos[n-1]);

    printf("(0) Sair\n");

    for (int o = 0; o < 50; ++o) printf("*");

    sys.inp("%i", "\n:", &option);
}

struct sections{
    void (*sec1)();
    void (*sec2)();
    void (*sec3)();
    void (*sec4)();
    void (*sec5)();
    void (*sec6)();
    void (*sec7)();
    void (*sec8)();
    void (*sec9)();
};

//sec1 #
void real_fee(){
    sys.title();
    float nominal_fee, inflation, real_fee;
    sys.inp("%f", "Digite a taxa de juros nominal a.a. em %: ", &nominal_fee);
    sys.inp("%f", "Digite a taxa de inflacao a.a. em %: ", &inflation);

    real_fee = ((1+nominal_fee/100) / (1+inflation/100) - 1)*100;

    printf("Taxa de juros reais a.a. em %%: %.2f\n", real_fee);
}

//sec2 #
void coin_converter(){
    sys.title();

    char *coins[] = {"Real (BRL)", "Dolar (USD)", "Euro (EUR)", "Libra Esterlina (GBP)"};
    option = 0;
    float bv, av;

    struct coin{
    char* name;
    double fee;
    };

    //improvised dict in C by instanciating a struct inside another

    struct coin array[] = {
        {"Dolar (USD) -> Real (BRL)", 5.12},
        {"Euro (EUR) -> Real (BRL)", 5.40},
        {"Libra Esterlina (GBP) -> Real (BRL)", 6.29},
        {"Real (BRL) -> Dolar (USD)", 0.19},
        {"Real (BRL) -> Euro (EUR)", 0.18},
        {"Real (BRL) -> Libra Esterlina (GBP)", 0.16}
    };

    int array_size = sizeof(array)/sizeof(array[0]);

    printf("Selecione a conversao desejada\n");
    for (int i=0; i<array_size; ++i){
        printf("(%i) %s\n", i+1, array[i].name);
    }

    sys.inp("%i",  ": ", &option);

    int from, to;
    if(option<=3){
        from=option;
        to=0;
    }else if(option<=6){
        from=0;
        to=option-3;
    }else{
        printf("Opcao invlida");
        sleep(1);
        coin_converter();
    }
    system(clean);
    printf("Digite o valor em %s a ser convertido: ", coins[from]);
    scanf("%f", &bv);
    av = bv*array[option-1].fee;

    printf("Valor correspondente em %s: %.2f\n", coins[to], av);

}

//sec3 #
void emergency_save(){
    sys.title();
    float salary, costs, reserv, save_m;
    int time;

    input("%f", "Digite o valor do salario mensal em R$: ", &salary);
    input("%f", "Digite o valor das despesas mensais em R$: ", &costs);

    save_m = salary - costs;
    reserv = costs * 6;
    time = reserv / save_m;

    printf("Sua reserva de emergencia deve ser de R$ %.2f\n", reserv);
    printf("Serao necessarios %i meses para atingir esse valor poupando R$ %.2f por mes.\n", time, save_m);
}

//sec4 #
void compound_fee(){
    sys.title();
    int t;
    float c, i, d, M;

    input("%f", "Digite o valor do investimento inicial em R$: ", &c);
    input("%f", "Digite o valor dos depositos mensais em R$: ", &d);
    input("%f", "Digite a taxa de juros mensal: ", &i);
    input("%i", "Digite o periodo de tempo em meses: ", &t);

    M = c;

    for (int n=1;n<t; ++n){
        M = M * (1+i) + d;
    }

    printf("O valor ao final de %i meses sera R$ %.2f\n", t, M);
}

//sec5 #
void school_save(){
    sys.title();
    float course_fee, course_long, age, monthly_valuation_tax, course_price, save;
    sys.inp("%f", "Digite o valor da mensalidade em R$: ", &course_fee);
    sys.inp("%f", "Digite o tempo do curso em anos: ", &course_long);
    sys.inp("%f", "Digite a idade atual do filho: ", &age);
    sys.inp("%f", "Digite a taxa de juros mensal dos investimentos: ", &monthly_valuation_tax);

    course_price = course_fee * (course_long*12);
    save = (course_price*monthly_valuation_tax) / (pow(1+monthly_valuation_tax, 12*(18-age))-1);

    printf("O valor total do curso apos 5 anos e R$ %.2f", course_price);
    printf("\nVoce deve poupar R$ %.2f por mes\n", save);
}

//sec6 #
void save_plan(){
    sys.title();
    int time = 0;
    float salary, cost_b, cost_l, goal, fee, M, save;

    input("%f", "Digite o valor da renda atual em R$: ", &salary);
    input("%f", "Digite o percentual de gastos basicos: ", &cost_b);
    input("%f", "Digite o percentual de gastos com estilo de vida: ", &cost_l);
    input("%f", "Digite o objetivo finaceiro em R$: ", &goal);
    input("%f", "Digite a taxa de juros mensal dos investimentos: ", &fee);

    cost_l = (cost_l/100) * salary;
    cost_b = (cost_b/100) * salary;
    save = salary - (cost_l+cost_b);
    M = save;

    do{
        ++time;
        M = M * (1+fee) + save;
    }while(M<goal);

    printf("Total em gatos  basicos: R$ %.2f\n", cost_b);
    printf("Total em gatos  com estilo de vida: R$ %.2f\n", cost_l);
    printf("Total a ser poupado: R$ %.2f\n", salary - (cost_l+cost_b));
    printf("Tempo para atingir objetivo financeiro %i meses\n", time);
}

//sec7
void simulator(){
    sys.title();

    float total_financiado, juros_mensal, juros_final, total_final, amortizacao, divida, parcela;
    int numero_prestacoes;
    
    float prestacoes[120];

    input("%f", "Digite o valor total a ser financiado em R$: ", &total_financiado);
    input("%i", "Digite o numero de prestacoes mensais: ", &numero_prestacoes);
    input("%f", "Digite a taxa de juros mensal do financiamento: ", &juros_mensal);
    
    amortizacao = total_financiado/numero_prestacoes;
    divida = total_financiado;
    
    for (int i = 0; i < numero_prestacoes; ++i){
        parcela = amortizacao + (juros_mensal * divida);
        prestacoes[i] = parcela;
        total_final += parcela;
        divida -= amortizacao;  
    }
    
    juros_final = total_final - total_financiado;
    
    printf("\nTotal pago em juros: R$ %.2f\n", juros_final);
    printf("Total do financiamento: R$ %.2f\n", total_final);
    printf("\nValor da 1 prestacao: R$ %.2f\n", prestacoes[0]);
    for(int n=0;n<12;++n) printf("Valor da %d0 prestacao: R$ %.2f\n", n+1,prestacoes[((n+1)*10)-1]);
}
    
//sec8 #
void taxs(){
    sys.title();
    
    float capital, total, net_profit, gross_profit, iof, alq;
    int opt, days;

    input("%i", "(1) Acoes\n(2) Renda fixa\n: ", &opt);

    if(opt == 1){

        input("%f", "\nDigite o valor total investido em R$: ", &capital);
        input("%f", "Digite o valor total resgatado em R$: ", &total);
        input("%i", "Digite o tempo total do investimento em dias:", &days);
        
        alq = 0;
        gross_profit = total - capital;

        if(days < 1){
            alq = 0.2;
        }else if(total < 20000){
            alq = 0.15;
        }

        net_profit = gross_profit * (1 - alq);

        printf("Lucro bruto: R$ %.2f\n", gross_profit);
        printf("Lucro liquido: R$ %.2f\n", net_profit);
        printf("Imposto de renda retido: R$ %.2f\n", (gross_profit * alq));

    }else if(opt==2){

        input("%f", "\nDigite o valor total investido em R$: ", &capital);
        input("%f", "Digite o valor total resgatado em R$: ", &total);
        input("%i", "Digite o tempo total do investimento em dias:", &days);

        gross_profit = total - capital;

        if(days <= 180){
            alq = 0.225;
        }
        else if(days <= 360){
            alq = 0.2;
        }
        else if(days <= 720){
            alq = 0.175;
        }
        else{
            alq = 0.15;
        }

        iof = (1 - (days*0.0333))*gross_profit;

        net_profit = (gross_profit - iof) * (1 - alq);

        printf("Lucro bruto: R$ %.2f\n", gross_profit);
        printf("Lucro liquido: R$ %.2f\n", net_profit);
        printf("IOF retido: R$ %.2f\n", iof);
        printf("Imposto de renda retido: R$ %.2f\n", (gross_profit - iof) * alq);

    }else{
        printf("Opcao invalida");
        sleep(1);
        taxs();
    }
}

//sec9
void financial_indep(){

    float PMT, i = 0.002, n, FV; //PMT = aporte; i = taxa a.m; n = periodo; FV = montante;
    float matriz[17][10];

    do{
        sys.title();
        input("%f", "Digite o valor da meta para indepencia financeira em R$: ", &FV);
        if (FV<0){
            printf("\nValor inválido!\n");
            sleep(1);
            system(clean);
        }
    }while (FV<0);

    printf("\n\t\t\t\t\t  \033[1m\033[4;41mPRAZO\n");
    printf("\033[45mTAXA\033[0m\033[1m\t3\t5\t7");
    for(int o=10;o<41;o+=5) printf("\t%i",o);

    for (int x = 0; x < 17; x ++){
        n = 36;
        printf("\033[1m\n%.2f%%\033[0m",i*100);

        for (int j = 0; j < 10; j ++){
            PMT = (FV*i)/(pow((1+i), n)-1)  ;
            if (n<84) n += 24;
            else if (n==84) n += 36;
            else n += 60; 
            printf("\t%.2f",PMT);
            matriz[x][j] = PMT;
        }

        i += 0.0005;
    }

    printf("\n");

}

int main(){

    struct sections sec = {
        real_fee,
        coin_converter,
        emergency_save,
        compound_fee,
        school_save,
        save_plan,
        simulator,
        taxs,
        financial_indep
    };

    do{
        menu();
        switch(option){

            case 0:break;

            case 1:
                sec.sec1();
                sys.back();
                break;

            case 2:
                sec.sec2();
                sys.back();
                break;

            case 3:
                sec.sec3();
                sys.back();
                break;

            case 4:
                sec.sec4();
                sys.back();
                break;

            case 5:
                sec.sec5();
                sys.back();
                break;

            case 6:
                sec.sec6();
                sys.back();
                break;

            case 7: 
                sec.sec7();
                sys.back();
                break;

            case 8:
                sec.sec8();
                sys.back();
                break;

            case 9:
                sec.sec9();
                sys.back();
                break;

            default:
                printf("Opcao invalida\n");
                sleep(1);
        }
    }while(option!=0);
    return 0;
}
