<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.text.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calcular Rendimentos</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        double taxa = Double.parseDouble(request.getParameter("taxa"));
        double rendimento = saldo * (taxa / 100) * 12;

        DecimalFormat df = new DecimalFormat("#.##");
        session.setAttribute("rendimentoAnual", df.format(rendimento));

        response.sendRedirect("User1.jsp");
    %>
</body>
</html>
