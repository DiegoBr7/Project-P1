package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private static String driver = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
    private static final String USUARIO = "RM553090";
    private static final String SENHA = "270695";

    public static Connection abrirConexao() {
        Connection conexao = null;

        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(URL, USUARIO, SENHA);
            return conexao;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}

