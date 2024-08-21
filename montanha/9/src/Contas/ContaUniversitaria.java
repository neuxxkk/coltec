package Contas;

import Cliente.*;

public class ContaUniversitaria extends Conta{

    public ContaUniversitaria(int numero, Cliente dono, double saldo, double limiteMin, double limiteMax){
        super(numero, dono, saldo, limiteMin, limiteMax);
    }

    @Override //Conta()
    void setLimite(double limiteMin, double limiteMax) {
        if (limiteMin < 0) throw new IllegalArgumentException("Limite abaixo do permitido. Conta de número: " + numero);
        if (limiteMax > 500) throw new IllegalArgumentException("Limite acima do permitido. Conta de número: " + numero);
        this.limiteMin = limiteMin;
        this.limiteMax = limiteMax;
    }

    @Override //ITaxas()
    public double calculaTaxas(){
        return 0;
    }

}