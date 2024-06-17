package Contas;

import Cliente.*;
public class ContaCorrente extends Conta{

    public ContaCorrente(int numero, Cliente dono, double saldo, double limiteMax, double limiteMin){
        super(numero, dono, saldo);
        setLimite(limiteMax, limiteMin);
    }

    @Override
    void setLimite(double limiteMax, double limiteMin) {
        if (limiteMin < -100) limiteMin = -100;
        super.limiteMin=limiteMin;
        super.limiteMax=limiteMax;
    }
}