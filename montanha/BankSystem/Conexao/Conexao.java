package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    final private static String JDBC = "com.mysql.cj.jdbc.Driver";
    final private static int PORT = 3306;
    final private static String HOST = "172.18.0.2";
    final private static String DB_NAME = "Sistema";

    static{
        try {
            Class.forName(JDBC);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    static private Connection conexao = null;

    public Conexao() {}

    public static Connection obterConexao() throws SQLException{

        String url = "jdbc:mysql://"+HOST+":"+PORT+"/"+DB_NAME;
        String usuario = "root";
        String senha = "9841";

        try{

            if (conexao == null) conexao = DriverManager.getConnection(url, usuario, senha);
            return conexao;
        }catch(SQLException e){
            throw e;
        }
    }

    public void fechaConexao(){
        try {
            if (conexao != null) conexao.close();
        } catch (SQLException e) {
            // a
        }
    }
}
