package Cliente;

import java.util.Date;
public abstract class Cliente { //Não se pode criar objects

    protected String nome; //Protected = class and subclass
    protected String endereco;
    protected Date data;

    Cliente(String nome, String endereco, Date data) {
        this.nome = nome;
        this.endereco = endereco;
        this.data = data;
    }

    public void imprimir(){System.out.println("cliente inválido");}

    abstract boolean autenticar(String key);

    //Encapsulation
    public String getNome() {return nome;}
    public void setNome(String nome) {this.nome = nome;}
    public String getEndereco() {return endereco;}
    public void setEndereco(String endereco) {this.endereco = endereco;}
    public Date getData() {return data;}
    
}
