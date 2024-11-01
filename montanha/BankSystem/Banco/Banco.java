package Banco;

public class Banco {
    protected String nome;
    protected int codigo;
    protected String endereco;
    protected String telefone;
    protected String email;
    protected String cnpj;
    protected int numeroAgencias;

    public Banco(String nome, int codigo, String endereco, String telefone, String email, String cnpj) {
        this.nome = nome;
        this.codigo = codigo;
        this.endereco = endereco;
        this.telefone = telefone;
        this.email = email;
        this.cnpj = cnpj;
        this.numeroAgencias = 0;
    }

    

    @Override
    public String toString() {
        return "Banco [nome=" + nome + ", codigo=" + codigo + ", endereco=" + endereco + ", telefone=" + telefone
                + ", email=" + email + ", cnpj=" + cnpj + ", numeroAgencias=" + numeroAgencias + "]";
    }



    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public int getNumeroAgencias() {
        return numeroAgencias;
    }

    public void setNumeroAgencias(int numeroAgencias) {
        this.numeroAgencias = numeroAgencias;
    }
    
    

}
