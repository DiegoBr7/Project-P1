<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adicionar Valor</title>
</head>
<body>
    <%
        double valorAdicionado = Double.parseDouble(request.getParameter("valor"));
        Date dataAtual = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("d/MMM", new Locale("pt", "BR"));

        String novoRegistro = "Valor Adicionado - R$ " + valorAdicionado + " - " + sdf.format(dataAtual);

        List<String> valoresAdicionados = (List<String>) session.getAttribute("valoresAdicionados");
        if (valoresAdicionados == null) {
            valoresAdicionados = new ArrayList<>();
        }
        valoresAdicionados.add(novoRegistro);
        session.setAttribute("valoresAdicionados", valoresAdicionados);

        response.sendRedirect("User1.jsp");
    %>
</body>
</html>
