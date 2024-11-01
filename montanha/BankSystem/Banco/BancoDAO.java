package Banco;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Conexao.Conexao;

public class BancoDAO {
    
    public static void criarTabela() throws SQLException{

        try{

            Connection conexao = Conexao.obterConexao(); 

            Statement stmt = conexao.createStatement();

            stmt.execute("CREATE TABLE IF NOT EXISTS `Banco` (" + //
                                "  `idBanco` INT NOT NULL AUTO_INCREMENT," + //
                                "  `nome` VARCHAR(55) NULL," + //
                                "  `codigo` INT NULL," + //
                                "  `endereco` VARCHAR(255) NULL," + //
                                "  `telefone` VARCHAR(45) NULL," + //
                                "  `email` VARCHAR(45) NULL," + //
                                "  `cnpj` VARCHAR(45) NULL," + //
                                "  `numeroAgencias` INT NULL," + //
                                "  PRIMARY KEY (`idBanco`))");

        }catch(SQLException e){

            throw e;

        }

    }

    public static Banco obterPorCodigo(int codigo) throws BancoNaoEncontradoExeception, SQLException{

        try {
            
            Connection conexao = Conexao.obterConexao();

            Statement stmt = conexao.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM Banco WHERE codigo ="+codigo+";");

            if (result.next()){

                Banco banco = new Banco(
                    result.getString(2),  // Nome
                    result.getInt(3),     // Codigo
                    result.getString(4),  // Endereco
                    result.getString(5),  // Telefone  
                    result.getString(6),  // Email
                    result.getString(7)  // Cnpj
                    );

                banco.setNumeroAgencias(result.getInt(8));

                return banco;

            }
            
            throw new BancoNaoEncontradoExeception(codigo);

        } catch (SQLException e) {
            throw e;
        }

    }

    public static void inserir(Banco banco) throws SQLException{

        try {
            
            PreparedStatement pstmt = Conexao.obterConexao().prepareStatement("INSERT INTO Banco(nome, codigo, endereco, telefone, email, cnpj, numeroAgencias) VALUES(?,?,?,?,?,?,?)");

            pstmt.setString(1, banco.nome);
            pstmt.setInt(2, banco.codigo);
            pstmt.setString(3, banco.endereco);
            pstmt.setString(4, banco.telefone);
            pstmt.setString(5, banco.email);
            pstmt.setString(6, banco.cnpj);
            pstmt.setInt(7, banco.numeroAgencias);

            pstmt.execute();

        } catch (SQLException e) {
            throw e;
        }

    }

    public static void remover(Banco banco) throws SQLException,BancoNaoEncontradoExeception{

        try{

            PreparedStatement pstmt = Conexao.obterConexao().prepareStatement("DELETE FROM Banco WHERE codigo ="+banco.codigo+";");
            if (pstmt.executeUpdate() == 0) throw new BancoNaoEncontradoExeception(banco.codigo);

        }catch(SQLException e){
            throw e;
        }

    } 

    public static ArrayList<Banco> obterLista() throws SQLException, BancoNaoEncontradoExeception{
        
        try {
            
            Connection conexao = Conexao.obterConexao();
            
            Statement stmt = conexao.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM Banco");

            ArrayList<Banco> bancos = new ArrayList<>();

            if (!result.next()) throw new BancoNaoEncontradoExeception();

            do{

                Banco banco = new Banco(
                    result.getString(2),  // Nome
                    result.getInt(3),     // Codigo
                    result.getString(4),  // Endereco
                    result.getString(5),  // Telefone  
                    result.getString(6),  // Email
                    result.getString(7)  // Cnpj
                );
                 
                banco.setNumeroAgencias(result.getInt(8));
            
                bancos.add(banco);

            }while(result.next());

            return bancos;

        } catch (Exception e) {
            throw e;
        }

    }

}
