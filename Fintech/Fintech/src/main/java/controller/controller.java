package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Conexao;
import model.Usuario;

@WebServlet(urlPatterns = { "/controller", "/main", "/cadastroUsuario" })
public class controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Conexao conexao = new Conexao();
    Usuario usuario = new Usuario();

    public controller() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        String action = request.getServletPath();
        System.out.println(action);
        if (action.equals("/main")) {
            contatos(request, response);
        } else if (action.equals("/cadastroUsuario")) {
            novoContato(request, response);
        } else {
            response.sendRedirect("index.html");
        }
    }

    // Listar contatos
    protected void contatos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Criando um objeto que irá receber os dados do Usuario ///
    	ArrayList<Usuario> lista = conexao.listarContatos();
    	for (int i = 0; i < lista.size(); i++) {
    		System.out.println(lista.get(i).getCdUsuario());
    		System.out.println(lista.get(i).getNomeCompleto());
    		System.out.println(lista.get(i).getNrCpf());
    		System.out.println(lista.get(i).getDtAniversario());
    		System.out.println(lista.get(i).getDsSexo());
    		System.out.println(lista.get(i).getDsEmail());
    		System.out.println(lista.get(i).getDsProfissao());
    		System.out.println(lista.get(i).getVlSalario());
    		System.out.println(lista.get(i).getSenha());

    	}
    }

    // Novo contato
    protected void novoContato(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Setar as variaveis do Usuario (JavaBeans)
        usuario.setNomeCompleto(request.getParameter("nome"));
        usuario.setNrCpf(request.getParameter("cpf"));
        // Converta a string de data para LocalDate
        String dataNascimento = request.getParameter("dtNasc");
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate dtAniversario = LocalDate.parse(dataNascimento, formatter);
            usuario.setDtAniversario(dtAniversario);
        } catch (DateTimeParseException e) {
            System.out.println("Formato de data inválido: " + dataNascimento);
        }
        usuario.setDsSexo(request.getParameter("sexo"));
        usuario.setDsEmail(request.getParameter("email"));
        usuario.setDsProfissao(request.getParameter("profissao"));
        // Converta a string de salário para double
        String salario = request.getParameter("salario");
        try {
            salario = salario.replace(".", "").replace(",", ".");
            double vlSalario = Double.parseDouble(salario);
            usuario.setVlSalario(vlSalario);
        } catch (NumberFormatException e) {
            System.out.println("Formato de salário inválido: " + salario);
        }
        usuario.setSenha(request.getParameter("senha"));
        // CRUD //
        conexao.inserirContato(usuario);
         // Redirecionar para cadastro.jsp //
        response.sendRedirect("main");
    }
}
