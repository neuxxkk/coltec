import Cliente.*;
import Contas.*;
import Operacao.*;
public class Main {
    public static void main(String[] args) {

        ClientePessoaFisica ana = new ClientePessoaFisica("Ana", "Av. Antonio Carlos, 6627", "023.065.376.66", 25, 'f');
        ClientePessoaFisica vitor = new ClientePessoaFisica("Vitor", "R. Castelo Ajuda, 695", "014.957.656.23", 17, 'm');

        ClientePessoaJuridica neuxCIA = new ClientePessoaJuridica("NeuxCIA", "Av. Contorno, 1152", "555669813", 25, "Shipping");
        ClientePessoaJuridica anaC = new ClientePessoaJuridica("AnaC", "Av. Fleming, 895", "555669813", 78, "Publishing");

        Conta conta1 = new ContaUniversitaria(1234, vitor, 565, 5888, 0);
        Conta conta2 = new ContaCorrente(1234, ana, 0, 1500, 0);

        System.out.println(conta1);

        conta1.depositar(3000);
        conta1.sacar(500);

        conta2.transferir(conta1, 666);
        conta2.depositar(234);

        System.out.println(conta1);
        conta1.imprimirExtrato();

        System.out.println(ana);
        System.out.println(neuxCIA);

        int media = Operacao.getTotalOperacoes() / Conta.getTotalContas();
        System.out.println("Média de operações por conta aberta: " + media);

        System.out.println("conta1 == conta2 ? " + conta1.equals(conta2));
        System.out.println("ana == vitor ? " + ana.equals(vitor));
        System.out.println("anaC == neuxCIA ? " + neuxCIA.equals(anaC));

        System.out.println("authenticator: " + neuxCIA.autenticar("555669813"));

    }
}