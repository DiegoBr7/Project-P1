<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Completo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./styleCadastro3.css">
</head>
<body>


    <div class="container my-5">
        <div class="row justify-content-center">
            <!-- Seção de Cadastro de Banco -->
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow-sm mb-5">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Cadastro de Banco</h2>
                    </div>
                    <div class="card-body">
                        <form action="CadastroBancoServlet" method="post">
                            <div class="mb-3">
                                <label for="nomeBanco" class="form-label">Nome do Banco</label>
                                <input type="text" class="form-control" id="nomeBanco" name="nomeBanco" required>
                            </div>
                            <div class="mb-3">
                                <label for="agencia" class="form-label">Agência</label>
                                <input type="text" class="form-control" id="agencia" name="agencia" required>
                            </div>
                            <div class="mb-3">
                                <label for="conta" class="form-label">Conta</label>
                                <input type="text" class="form-control" id="conta" name="conta" required>
                            </div>
                            <div class="mb-3">
                                <label for="saldo" class="form-label">Saldo</label>
                                <input type="number" step="0.01" class="form-control" id="saldo" name="saldo" required>
                            </div>
                            <div class="mb-3">
                                <label for="tipoConta" class="form-label">Tipo de Conta</label>
                                <select class="form-control" id="tipoConta" name="tipoConta" required>
                                    <option value="CORRENTE">Corrente</option>
                                    <option value="POUPANCA">Poupança</option>
                                    <option value="SALARIO">Salário</option>
                                    <option value="DIGITAL">Digital</option>
                                </select>
                            </div>
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" id="carteira" name="carteira">
                                <label class="form-check-label" for="carteira">Adicionar Carteira</label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Cadastrar</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Seção de Dados Complementares -->
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow-sm mb-5">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Dados Complementares</h2>
                    </div>
                    <div class="card-body">
                        <form name="frmComplemento" action="completarCadastro" method="post">
                            <!-- Campos de Endereço -->
                            <div class="mb-3">
                                <label for="logradouro" class="form-label">Logradouro</label>
                                <input type="text" class="form-control" id="logradouro" name="logradouro" placeholder="Digite seu logradouro">
                            </div>
                            <div class="mb-3">
                                <label for="cep" class="form-label">CEP</label>
                                <input type="text" class="form-control" id="cep" name="cep" placeholder="Digite seu CEP">
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-8">
                                    <label for="rua" class="form-label">Rua</label>
                                    <input type="text" class="form-control" id="rua" name="rua" placeholder="Digite sua rua">
                                </div>
                                <div class="col-md-4">
                                    <label for="numero" class="form-label">Número do imóvel</label>
                                    <input type="text" class="form-control" id="numero" name="numero" placeholder="Digite o número do imóvel">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="bairro" class="form-label">Bairro</label>
                                <input type="text" class="form-control" id="bairro" name="bairro" placeholder="Digite seu bairro">
                            </div>
                            <div class="mb-3">
                                <label for="cidade" class="form-label">Cidade</label>
                                <input type="text" class="form-control" id="cidade" name="cidade" placeholder="Digite sua cidade">
                            </div>
                            <div class="mb-3">
                                <label for="estado" class="form-label">Estado</label>
                                <input type="text" class="form-control" id="estado" name="estado" placeholder="Digite seu estado">
                            </div>
                            <!-- Campos de Telefone -->
                            <div class="mb-3">
                                <label for="ddd" class="form-label">DDD</label>
                                <input type="text" class="form-control" id="ddd" name="ddd" placeholder="Digite o DDD">
                            </div>
                            <div class="mb-3">
                                <label for="telefone" class="form-label">Telefone</label>
                                <input type="text" class="form-control" id="telefone" name="telefone" placeholder="Digite seu telefone">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Enviar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
