package Main;
import Cliente.*;
import Contas.*;


public class Main {
    public static boolean realTime = true; //1 segundo para cada operação
    public static void main(String[] args) {

        ClientePessoaFisica ana = new ClientePessoaFisica("Ana", "Av. Antonio Carlos, 6627", "023.065.376.66", 25, 'f');
        ClientePessoaFisica vitor = new ClientePessoaFisica("Vitor", "R. Castelo Ajuda, 695", "014.957.656.23", 17, 'm');

        //ClientePessoaJuridica neuxCIA = new ClientePessoaJuridica("NeuxCIA", "Av. Contorno, 1152", "555669813", 25, "Shipping");
        ClientePessoaJuridica anaC = new ClientePessoaJuridica("AnaC", "Av. Fleming, 895", "555669813", 78, "Publishing");

        Conta conta1 = new ContaUniversitaria(1021, vitor, 565, -500, 3500);
        Conta conta2 = new ContaCorrente(1234, ana, 2000, -300, 10000); //
        conta1.setDono(anaC);
        System.out.println(conta2);

        conta1.depositar(3000);
        conta1.sacar(500); //
        
        conta2.transferir(conta1, 666); //
        conta2.depositar(234);
        conta2.sacar(350); //
        conta2.depositar(5000);
        conta2.sacar(1);

        //System.out.println(conta2);
        conta2.imprimirExtratoConta(1); //Depositos seguido de Saques
        conta2.imprimirExtratoConta(0); //Ordem de Data
        //conta2.imprimirExtratoTaxas();

        //System.out.println(conta2);

        /* System.out.println(ana);
        System.out.println(neuxCIA);

        int media = Operacao.getTotalOperacoes() / Conta.getTotalContas();
        System.out.println("\nMédia de operações por conta aberta: " + media);

        System.out.println("conta1 == conta2 ? " + conta1.equals(conta2));
        System.out.println("ana == vitor ? " + ana.equals(vitor));
        System.out.println("anaC == neuxCIA ? " + neuxCIA.equals(anaC));

        System.out.println("authenticator: " + neuxCIA.autenticar("555669813"));
        */
    }
    
}

/* public static void delay(long millis){
    if (timeout){
        try{Thread.sleep(millis);}
        catch (InterruptedException e){Thread.currentThread().interrupt();}
    }
} */