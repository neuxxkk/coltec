package Conta;

import Agencia.Agencia;
import Cliente.Cliente;

public class Conta {
    protected Cliente cliente;
    protected int numero;
    protected Agencia agencia;
    protected float saldo;
    
    public Conta(Cliente cliente, int numero, Agencia agencia) {
        this.cliente = cliente;
        this.numero = numero;
        this.agencia = agencia;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Agencia getAgencia() {
        return agencia;
    }

    public void setAgencia(Agencia agencia) {
        this.agencia = agencia;
    }

    public float getSaldo() {
        return saldo;
    }    

}
