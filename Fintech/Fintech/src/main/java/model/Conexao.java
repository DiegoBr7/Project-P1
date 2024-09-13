package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class Conexao {

    private static String driver = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
    private static final String USUARIO = "RM553011";
    private static final String SENHA = "fiap24";

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

    // Crud Criação //
    public void inserirContato(Usuario usuario) {
        String criarUser = "INSERT INTO T_SIP_USUARIO (nm_user, cd_usuario, cpf, dt_nascimento, sexo, ds_email, ds_profissao, vl_salario, senha)"
                + "VALUES (?, SQ_T_USUARIO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conexao = abrirConexao();
            PreparedStatement ps = conexao.prepareStatement(criarUser);
            ps.setString(1, usuario.getNomeCompleto());
            ps.setString(2, usuario.getNrCpf());
            LocalDate localDate = usuario.getDtAniversario();
            if (localDate != null) {
                ps.setDate(3, java.sql.Date.valueOf(localDate));
            } else {
                ps.setDate(3, null);
            }
            ps.setString(4, usuario.getDsSexo());
            ps.setString(5, usuario.getDsEmail());
            ps.setString(6, usuario.getDsProfissao());
            ps.setDouble(7, usuario.getVlSalario());
            ps.setString(8, usuario.getSenha());

            ps.executeUpdate();

            ps.close();
            conexao.close();
            System.out.println("Registro do Usuario feito com Sucesso!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Usuario> listarContatos() {
        ArrayList<Usuario> usuarios = new ArrayList<>(); // Corrigido: ArrayList com "L" maiúsculo e inicializado a lista
        String readUser = "SELECT * FROM T_SIP_USUARIO ORDER BY cd_usuario"; //
        try {
            Connection conexao = abrirConexao();
            PreparedStatement ps = conexao.prepareStatement(readUser);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cd_usuario = rs.getInt("cd_usuario"); // Certifique-se de que o nome da coluna está correto
                String nm_user = rs.getString("nm_user");
                String cpf = rs.getString("cpf");
                Date data = rs.getDate("dt_nascimento");
                String sexo = rs.getString("sexo");
                String ds_email = rs.getString("ds_email");
                String ds_profissao = rs.getString("ds_profissao");
                Double vl_salario = rs.getDouble("vl_salario");
                String senha = rs.getString("senha");

                // Certifique-se de que o construtor exista na classe Usuario
                usuarios.add(new Usuario(cd_usuario, nm_user, cpf, data != null ? data.toLocalDate() : null, sexo, ds_email, ds_profissao, vl_salario, senha));
            }
            rs.close();
            ps.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>(); // Retorna uma lista vazia em caso de erro
        }
        return usuarios;
    }
}
