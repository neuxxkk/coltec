package Exceptions;

public class ValorNegativoException extends Exception{
    public ValorNegativoException(){
        super();
    }

    public ValorNegativoException(String msg){
        super(msg);
    }
}
