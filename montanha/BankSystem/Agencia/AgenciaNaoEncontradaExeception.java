package Banco;

public class AgenciaNaoEncontradaExeception extends Exception{
    
    public AgenciaNaoEncontradaExeception(int codigo){

        super("Banco do código:"+ codigo + ", não encontrado");

    }

    public AgenciaNaoEncontradaExeception(){
        super("Nenhum banco encontrado no sistema");
    }

}
