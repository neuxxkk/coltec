import java.util.Date;
public class Cliente {

    protected String nome;
    protected String endereco;
    protected Date data;
    int y;

    public Cliente(String nome, String endereco, Date data) {
        this.nome = nome;
        this.endereco = endereco;
        this.data = data;
    }

    public void imprimir(){System.out.println("cliente inválido");}

    public String getNome() {return nome;}
    public void setNome(String nome) {this.nome = nome;}
//
    public String getEndereco() {return endereco;}

}
