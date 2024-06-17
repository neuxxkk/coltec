package Contas;
import Cliente.*;
public class ContaUniversitaria extends Conta{

    public ContaUniversitaria(int numero, Cliente dono, double saldo, double limiteMax, double limiteMin){
        super(numero, dono, saldo);
        setLimite(limiteMax, limiteMin);
    }

    @Override
    void setLimite(double limiteMax, double limiteMin) {
        if (limiteMin < 0) limiteMin = 0;
        if (limiteMax > 500) limiteMax = 500;
        super.limiteMin=limiteMin;
        super.limiteMax=limiteMax;
    }
}