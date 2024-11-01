package Banco;

public class BancoNaoEncontradoExeception extends Exception{
    
    public BancoNaoEncontradoExeception(int codigo){

        super("Banco do código:"+ codigo + ", não encontrado");

    }

    public BancoNaoEncontradoExeception(){
        super("Nenhum banco encontrado no sistema");
    }

}
