public class Main {
    public static void main(String[] args) {

        PessoaFisica ana = new PessoaFisica("Ana", "Av. Antonio Carlos, 6627", "023.065.376.66", 25, 'f');
        PessoaJuridica neuxC = new PessoaJuridica("NeuxC", "Av. Contorno, 1152", "555669813", 25, "Shipping");


        Conta conta1 = new Conta(1234, ana, 0, 1500);
        Conta conta2 = new Conta(12121, ana, 10000, 1500);

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

        conta1.imprimirExtrato();

        ana.imprimir();
        neuxC.imprimir();

        int media = Operacao.getTotalOperacoes() / Conta.getTotalContas();
        System.out.println("Média de operações por conta aberta: " + media);
    }
}