public class Main {
    public static void main(String[] args) {

        

        PessoaFisica ana = new PessoaFisica("Ana", "Av. Antonio Carlos, 6627", "023.065.376.66", 25, 'f');
        PessoaFisica vitor = new PessoaFisica("Vitor", "R. Castelo Ajuda, 695", "014.957.656.23", 17, 'm');

        PessoaJuridica neuxCIA = new PessoaJuridica("NeuxCIA", "Av. Contorno, 1152", "555669813", 25, "Shipping");
        PessoaJuridica anaC = new PessoaJuridica("AnaC", "Av. Fleming, 895", "555669813", 78, "Publishing");


        Conta conta1 = new Conta(1234, neuxCIA, 565, 5888);
        Conta conta2 = new Conta(1234, ana, 0, 1500);

        conta1.depositar(3000);
        conta1.depositar(2000);
        conta1.sacar(500);
        conta1.sacar(500);
        conta1.sacar(500);
        conta1.depositar(500);
        conta1.sacar(500);
        conta1.sacar(500);
        conta1.sacar(500);
        conta1.sacar(500);



        conta2.transferir(conta1, 666);
        conta2.depositar(234);

        System.out.println(conta2);
        conta1.imprimirExtrato();

        System.out.println(ana);
        System.out.println(neuxCIA);

        int media = Operacao.getTotalOperacoes() / Conta.getTotalContas();
        //System.out.println("Média de operações por conta aberta: " + media);

        System.out.println("conta1 == conta2 ? " + conta1.equals(conta2));
        System.out.println("ana == vitor ? " + ana.equals(vitor));
        System.out.println("anaC == neuxCIA ? " + neuxCIA.equals(anaC));

    }
}