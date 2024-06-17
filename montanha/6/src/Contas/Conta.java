package Contas;
import Operacao.*;
import Cliente.*;
import java.util.Arrays;

public abstract class Conta {

    protected int numero;
    protected Cliente dono;
    protected double saldo;
    protected double limiteMax, limiteMin;
    protected Operacao[] operacoes;
    protected int proximaOperacao;
    protected static int totalContas = 0;

    public Conta(int numero, Cliente dono, double saldo) {
        this.numero = numero;
        this.dono = dono;
        this.saldo = saldo;

        this.operacoes = new Operacao[10];
        this.proximaOperacao = 0;

        Conta.totalContas++;
    }

    protected void redimensionarOperacoes() {
        if (operacoes.length == proximaOperacao) {
            operacoes = Arrays.copyOf(operacoes, operacoes.length * 2);
        }
    }
    
    public boolean sacar(double valor) {
        if (valor >= limiteMin && valor <= limiteMax) {
            this.saldo -= valor;

            this.operacoes[proximaOperacao] = new OperacaoSaque(valor);
            this.proximaOperacao++;
            redimensionarOperacoes();
            return true;
        }

        return false;
    }

    public void depositar(double valor) {
        this.saldo += valor;

        this.operacoes[proximaOperacao] = new OperacaoDeposito(valor);
        this.proximaOperacao++;
        redimensionarOperacoes();
    }

    public boolean transferir(Conta destino, double valor) {
        boolean valorSacado = this.sacar(valor);
        if (valorSacado) {
            destino.depositar(valor);
            return true;
        }
        return false;
    }

    public String toString() {
        return
        "\n===== Conta " + this.numero + " ====="+
        "\nDono: " + this.dono.getNome()+
        "\nSaldo: " + this.saldo+
        "\nLimite: " + this.limiteMax+
        "\n====================";
    }

    @Override
    public boolean equals(Object conta) {
        return this.numero==((Conta) conta).numero; //converte Object conta to Conta conta
    }

    public void imprimirExtrato() {
        System.out.println("\n======= Extrato Conta " + this.numero + "======");
        for(Operacao atual : this.operacoes) {
            if (atual != null) {
                System.out.println(atual);
            }
        }
        System.out.println("====================");
    }

    public int getNumero() {return numero;}
    public Cliente getDono() {return dono;}
    public double getSaldo() {return saldo;}
    public double getLimiteMax() {return limiteMax;}
    public double getLimiteMin() {return limiteMin;}
    public static int getTotalContas() {return Conta.totalContas;}
    public void setNumero(int numero) {this.numero = numero;}
    public void setDono(Cliente dono) {this.dono = dono;}
    abstract void setLimite(double limiteMax, double limiteMin);
}
