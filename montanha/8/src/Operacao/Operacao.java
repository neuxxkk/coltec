package Operacao;

import java.util.*;
import ITaxas.*;
import Main.*;

@SuppressWarnings("rawtypes")
public abstract class Operacao implements ITaxas, Comparable{

    private Date data;
    protected char tipo;
    protected double valor;
    private static int totalOperacoes = 0;

    public Operacao(char tipo, double valor) {
        this.tipo = tipo;
        this.valor = valor;
        data = new Date();
        if (Main.realTime) data.setTime((totalOperacoes * data.getTime()/5) + (new Random().nextLong(data.getTime()))/8);
        Operacao.totalOperacoes++;
    }

    @Override //Object()
    public String toString() {
        return String.format("%s\t%s\t%s", this.data,  this.tipo,  this.valor);
    }

    @Override
    public int compareTo(Object obj){
        return tipo - ((Operacao) obj).tipo;
    }

    //Encapsulation
    public Date getData() {return data;}
    public char getTipo() {return tipo;}
    public double getValor() {return valor;}
    public static int getTotalOperacoes() {return Operacao.totalOperacoes; }
    public void setTipo(char tipo) {if(tipo == 'd' || tipo == 's')this.tipo = tipo;}
    public void setValor(double valor) {this.valor = valor;}

}