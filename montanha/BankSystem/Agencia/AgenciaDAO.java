package Agencia;

import java.sql.Statement;
import java.util.ArrayList;

import Banco.Banco;
import Banco.BancoDAO;
import Banco.BancoNaoEncontradoExeception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Conexao.Conexao;

public class AgenciaDAO {
    
    public static void criarTabela() throws SQLException{

        try{

            Connection conexao = Conexao.obterConexao(); 

            Statement stmt = conexao.createStatement();

            stmt.execute("CREATE TABLE IF NOT EXISTS `Sistema`.`Agencia` (" + //
                                "  `idAgencia` INT NOT NULL AUTO_INCREMENT," + //
                                "  `idagencia` INT NOT NULL," + //
                                "  `codigo` INT NULL," + //
                                "  `endereco` VARCHAR(255) NULL," + //
                                "  `telefone` VARCHAR(45) NULL," + //
                                "  PRIMARY KEY (`idAgencia`, `idagencia`)," + //
                                "  INDEX `fk_Agencia_agencia_idx` (`idagencia` ASC) VISIBLE," + //
                                "  CONSTRAINT `fk_Agencia_agencia`" + //
                                "    FOREIGN KEY (`idagencia`)" + //
                                "    REFERENCES `Sistema`.`agencia` (`idagencia`)" + //
                                "    ON DELETE NO ACTION" + //
                                "    ON UPDATE NO ACTION)");

        }catch(SQLException e){

            throw e;

        }

    }

    public static Agencia obterPorCodigoBancoAgencia(int codigoBanco, int codigoAgencia) throws AgenciaNaoEncontradaExeception, SQLException{

        try {
            
            Connection conexao = Conexao.obterConexao();

            Statement stmt = conexao.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM agencia WHERE codigo ="+codigoAgencia+" AND idBanco = (SELECT idBanco FROM Banco WHERE Codigo ="+codigoBanco+") ;");

            Banco banco = BancoDAO.obterPorCodigo(codigoBanco);

            if (result.next()){

                return new Agencia(
                    banco,
                    result.getInt(3),     // Codigo
                    result.getString(4),  // Endereco
                    result.getString(5),  // Telefone  
                    );

            }
            
            throw new AgenciaNaoEncontradaExeception(codigo);

        } catch (SQLException e) {
            throw e;
        }

    }

    public static void inserir(agencia agencia) throws SQLException{

        try {
            
            PreparedStatement pstmt = Conexao.obterConexao().prepareStatement("INSERT INTO agencia(nome, codigo, endereco, telefone, email, cnpj, numeroAgencias) VALUES(?,?,?,?,?,?,?)");

            pstmt.setString(1, agencia.nome);
            pstmt.setInt(2, agencia.codigo);
            pstmt.setString(3, agencia.endereco);
            pstmt.setString(4, agencia.telefone);
            pstmt.setString(5, agencia.email);
            pstmt.setString(6, agencia.cnpj);
            pstmt.setInt(7, agencia.numeroAgencias);

            pstmt.execute();

        } catch (SQLException e) {
            throw e;
        }

    }

    public static void remover(agencia agencia) throws SQLException,AgenciaNaoEncontradaExeception{

        try{

            PreparedStatement pstmt = Conexao.obterConexao().prepareStatement("DELETE FROM agencia WHERE codigo ="+agencia.codigo+";");
            if (pstmt.executeUpdate() == 0) throw new AgenciaNaoEncontradaExeception(agencia.codigo);

        }catch(SQLException e){
            throw e;
        }

    } 

    public static ArrayList<agencia> obterLista() throws SQLException, AgenciaNaoEncontradaExeception{
        
        try {
            
            Connection conexao = Conexao.obterConexao();
            
            Statement stmt = conexao.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM agencia");

            ArrayList<agencia> agencias = new ArrayList<>();

            if (!result.next()) throw new AgenciaNaoEncontradaExeception();

            do{

                agencia agencia = new agencia(
                    result.getString(2),  // Nome
                    result.getInt(3),     // Codigo
                    result.getString(4),  // Endereco
                    result.getString(5),  // Telefone  
                    result.getString(6),  // Email
                    result.getString(7)  // Cnpj
                );
                 
                agencia.setNumeroAgencias(result.getInt(8));
            
                agencias.add(agencia);

            }while(result.next());

            return agencias;

        } catch (Exception e) {
            throw e;
        }

    }

}
