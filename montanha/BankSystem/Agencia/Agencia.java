package Agencia;

import Banco.Banco;

public class Agencia {
    protected Banco banco;
    protected int codigo;
    protected String endereco;
    protected String telefone;
    protected String email;
    protected int numeroContas;

    public Agencia(Banco banco, int codigo, String endereco, String telefone, String email) {
        this.banco = banco;
        banco.setNumeroAgencias(banco.getNumeroAgencias() + 1);
        this.codigo = codigo;
        this.endereco = endereco;
        this.telefone = telefone;
        this.email = email;
    }

    public int getNumeroContas() {
        return numeroContas;
    }

    public void setNumeroContas(int numeroContas) {
        this.numeroContas = numeroContas;
    }

    public Banco getBanco() {
        return banco;
    }

    public void setBanco(Banco banco) {
        this.banco = banco;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

}