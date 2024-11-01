package Cliente;

import java.util.Date;

public class Cliente {
    protected String nome;
    protected String cpf;
    protected char genero;
    protected Date dataNasc;
    protected String endereco;
    protected String telefone;
    protected String email;

    public Cliente(String nome, String cpf, char genero, Date dataNasc, String endereco, String telefone,
            String email) {
        this.nome = nome;
        this.cpf = cpf;
        this.genero = genero;
        this.dataNasc = dataNasc;
        this.endereco = endereco;
        this.telefone = telefone;
        this.email = email;
    }
    
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public char getGenero() {
        return genero;
    }
    public void setGenero(char genero) {
        this.genero = genero;
    }
    public Date getDataNasc() {
        return dataNasc;
    }
    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
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
