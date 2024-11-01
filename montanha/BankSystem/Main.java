import java.sql.SQLException;
import java.util.ArrayList;

import Banco.Banco;
import Banco.BancoDAO;
import Banco.BancoNaoEncontradoExeception;

public class Main {
    public static void main(String[] args)  throws SQLException, BancoNaoEncontradoExeception{
        System.out.println("Hello, world!");

        Banco bancoAlemao = new Banco(
            "Alebank",
            1313,
            "Belo Horizonte, MG - Brazil", 
            "(31)98415-2360", 
            "vitornms@gmail.com", 
            "02306537666-13"
        );

        ArrayList<Banco> bs = BancoDAO.obterLista();

        System.out.println(bs.get(0));

    }
}