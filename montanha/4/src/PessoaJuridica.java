import java.util.Date;

public class PessoaJuridica extends Cliente {

    String cnpj;
    int numFuncionarios;
    String setor;

    public PessoaJuridica(String nome,  String endereco, String cnpj, int numFuncionarios, String setor){
         super(nome, endereco, new Date());
         this.cnpj=cnpj;
         this.numFuncionarios = numFuncionarios;
         this.setor = setor;
         
    }

    public void imprimir(){
        System.out.println("===== Cliente PJ =====");
        System.out.println("Nome: " + this.nome);
        System.out.println("Setor: " + this.setor);
        System.out.println("Numero de funcionários: " + this.numFuncionarios);
        System.out.println("Endereco: " + this.endereco);
        System.out.println("CNPJ: " + this.cnpj);
        System.out.println("====================");
    }

}