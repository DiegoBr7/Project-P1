package controller;

import Dao.UsuarioDAO;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/cadastroUsuario")
public class CadastroUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CadastroUsuarioServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String confirmacaoEmail = request.getParameter("confirmacaoEmail");
        String dataNascimentoStr = request.getParameter("dataNascimento");
        char sexo = request.getParameter("sexo").charAt(0);
        String profissao = request.getParameter("profissao");
        double salario = Double.parseDouble(request.getParameter("salario"));
        String senha = request.getParameter("senha");

        if (!email.equals(confirmacaoEmail)) {
            request.setAttribute("errorMessage", "Emails não coincidem.");
            request.getRequestDispatcher("cadastroUser.jsp").forward(request, response);
            return;
        }

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dataNascimento = null;
        try {
            dataNascimento = format.parse(dataNascimentoStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Usuario usuario = new Usuario();
        usuario.setCpf(cpf);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setDataNascimento(dataNascimento);
        usuario.setSexo(sexo);
        usuario.setProfissao(profissao);
        usuario.setSalario(salario);
        usuario.setSenha(senha);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.adicionar(usuario);

        response.sendRedirect("usuarios.jsp");
    }
}
