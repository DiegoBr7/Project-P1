package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Conexao;
import model.Usuario;

public class UsuarioDAO {
    private Connection connection;

    public UsuarioDAO() {
        this.connection = Conexao.abrirConexao();
    }

    public void adicionar(Usuario usuario) {
        String sql = "INSERT INTO T_SIP_USUARIO (cd_usuario, nm_user, cpf, dt_nascimento, sexo, ds_email, ds_profissao, vl_salario, senha) VALUES (SQ_T_USUARIO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getCpf());
            stmt.setDate(3, new java.sql.Date(usuario.getDataNascimento().getTime()));
            stmt.setString(4, String.valueOf(usuario.getSexo()));
            stmt.setString(5, usuario.getEmail());
            stmt.setString(6, usuario.getProfissao());
            stmt.setDouble(7, usuario.getSalario());
            stmt.setString(8, usuario.getSenha());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Usuario> listarContatos() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM T_SIP_USUARIO ORDER BY cd_usuario";
        try (Connection conexao = Conexao.abrirConexao();
             PreparedStatement ps = conexao.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setCdUsuario(rs.getInt("cd_usuario"));
                usuario.setNome(rs.getString("nm_user"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setDataNascimento(rs.getDate("dt_nascimento"));
                usuario.setSexo(rs.getString("sexo").charAt(0));
                usuario.setEmail(rs.getString("ds_email"));
                usuario.setProfissao(rs.getString("ds_profissao"));
                usuario.setSalario(rs.getDouble("vl_salario"));
                usuario.setSenha(rs.getString("senha"));

                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public Usuario validarLogin(String email, String senha) {
        String sql = "SELECT * FROM T_SIP_USUARIO WHERE ds_email = ? AND senha = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, senha);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setCdUsuario(rs.getInt("cd_usuario"));
                    usuario.setNome(rs.getString("nm_user"));
                    usuario.setCpf(rs.getString("cpf"));
                    usuario.setEmail(rs.getString("ds_email"));
                    usuario.setDataNascimento(rs.getDate("dt_nascimento"));
                    usuario.setSexo(rs.getString("sexo").charAt(0));
                    usuario.setProfissao(rs.getString("ds_profissao"));
                    usuario.setSalario(rs.getDouble("vl_salario"));
                    usuario.setSenha(rs.getString("senha"));
                    return usuario;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
