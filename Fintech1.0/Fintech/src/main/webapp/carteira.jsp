<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, model.Conexao" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carteira</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        margin-top: 50px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Carteira</h1>
        <div class="mt-4">
            <h2>Adicionar Valor</h2>
            <form method="post" action="carteira.jsp">
                <div class="form-group">
                    <label for="cdUsuario">ID do Usuário</label>
                    <input type="number" class="form-control" id="cdUsuario" name="cdUsuario" required>
                </div>
                <div class="form-group">
                    <label for="vlSaldo">Valor</label>
                    <input type="number" step="0.01" class="form-control" id="vlSaldo" name="vlSaldo" required>
                </div>
                <button type="submit" class="btn btn-primary">Adicionar</button>
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    Connection connection = null;
                    PreparedStatement statement = null;
                    try {
                        int cdUsuario = Integer.parseInt(request.getParameter("cdUsuario"));
                        double vlSaldo = Double.parseDouble(request.getParameter("vlSaldo"));

                        connection = Conexao.abrirConexao();
                        String sql = "MERGE INTO T_SIP_CARTEIRA USING dual ON (CD_USUARIO = ?) " +
                                     "WHEN MATCHED THEN UPDATE SET VL_SALDO = ? " +
                                     "WHEN NOT MATCHED THEN INSERT (CD_CARTEIRA, CD_USUARIO, VL_SALDO) VALUES (SEQ_CARTEIRA.NEXTVAL, ?, ?)";
                        statement = connection.prepareStatement(sql);
                        statement.setInt(1, cdUsuario);
                        statement.setDouble(2, vlSaldo);
                        statement.setInt(3, cdUsuario);
                        statement.setDouble(4, vlSaldo);

                        int rowsAffected = statement.executeUpdate();
                        
                        if (rowsAffected > 0) {
                            out.println("<div class='alert alert-success mt-3'>Valor adicionado com sucesso.</div>");
                        } else {
                            out.println("<div class='alert alert-danger mt-3'>Erro ao adicionar o valor.</div>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger mt-3'>Erro ao adicionar o valor no banco de dados.</div>");
                    } finally {
                        if (statement != null) {
                            try {
                                statement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            %>
        </div>
        <div class="mt-4">
            <h2>Saldo Atual</h2>
            <form method="get" action="carteira.jsp">
                <div class="form-group">
                    <label for="consultaCdUsuario">ID do Usuário</label>
                    <input type="number" class="form-control" id="consultaCdUsuario" name="consultaCdUsuario" required>
                </div>
                <button type="submit" class="btn btn-primary">Consultar</button>
            </form>
            <%
                if (request.getParameter("consultaCdUsuario") != null) {
                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;
                    try {
                        int consultaCdUsuario = Integer.parseInt(request.getParameter("consultaCdUsuario"));

                        connection = Conexao.abrirConexao();
                        String sql = "SELECT VL_SALDO FROM T_SIP_CARTEIRA WHERE CD_USUARIO = ?";
                        statement = connection.prepareStatement(sql);
                        statement.setInt(1, consultaCdUsuario);
                        resultSet = statement.executeQuery();
                        if (resultSet.next()) {
                            double valorAtual = resultSet.getDouble("VL_SALDO");
                            out.println("<p class='mt-3'>O saldo atual é: R$ " + String.format("%.2f", valorAtual).replace(".", ",") + "</p>");
                        } else {
                            out.println("<p class='mt-3'>Nenhum saldo encontrado para o usuário.</p>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p class='mt-3'>Erro ao buscar o saldo no banco de dados.</p>");
                    } finally {
                        if (resultSet != null) {
                            try {
                                resultSet.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (statement != null) {
                            try {
                                statement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            %>
        </div>
        <div class="d-flex justify-content-center mt-4">
            <a href="banco.jsp" class="btn btn-secondary">Voltar ao Banco</a>
        </div>
    </div>
</body>
</html>
