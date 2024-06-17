package Contas;
import Cliente.Cliente;
public class ContaPoupanca extends Conta{

    public ContaPoupanca(int numero, Cliente dono, double saldo, double limiteMax, double limiteMin){
        super(numero, dono, saldo);
        setLimite(limiteMax, limiteMin);
    }

    @Override
    void setLimite(double limiteMax, double limiteMin) {
        if (limiteMin < 100) limiteMin = 100;
        if (limiteMax > 1000) limiteMax = 1000;
        super.limiteMin=limiteMin;
        super.limiteMax=limiteMax;
    }
}