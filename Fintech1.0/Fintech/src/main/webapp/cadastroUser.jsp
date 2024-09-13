<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fintech Cadastro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="stylesCadastro.css">
</head>
<body>

    <div class="header">
        <h1>Com o Fintech a resposta vem em menos de 1 minuto</h1>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Cadastro Fintech</h2>
                    </div>
                    <div class="card-body">
                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) { %>
                            <div class="alert alert-danger"><%= errorMessage %></div>
                        <% } %>
                        <form name="frmContato" action="cadastroUsuario" method="post">
                            <div class="mb-3">
                                <label for="cpf" class="form-label">CPF</label>
                                <input type="text" class="form-control" id="cpf" name="cpf" placeholder="Digite seu CPF">
                            </div>
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome completo</label>
                                <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome completo">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Digite seu email">
                            </div>
                            <div class="mb-3">
                                <label for="confirmacaoEmail" class="form-label">Confirmação de email</label>
                                <input type="email" class="form-control" id="confirmacaoEmail" name="confirmacaoEmail" placeholder="Confirme seu email">
                            </div>
                            <div class="mb-3">
                                <label for="dataNascimento" class="form-label">Data de Nascimento</label>
                                <input type="date" class="form-control" id="dataNascimento" name="dataNascimento">
                            </div>
                            <div class="mb-3">
                                <label for="sexo" class="form-label">Sexo</label>
                                <select class="form-control" id="sexo" name="sexo">
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                    <option value="I">Indefinido</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="profissao" class="form-label">Profissão</label>
                                <input type="text" class="form-control" id="profissao" name="profissao" placeholder="Digite sua profissão">
                            </div>
                            <div class="mb-3">
                                <label for="salario" class="form-label">Salário</label>
                                <input type="number" step="0.01" class="form-control" id="salario" name="salario" placeholder="Digite seu salário">
                            </div>
                            <div class="mb-3">
                                <label for="senha" class="form-label">Senha</label>
                                <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha">
                            </div>
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" id="comunicacao-whatsapp" name="comunicacaoWhatsapp">
                                <label class="form-check-label" for="comunicacao-whatsapp">Aceito receber comunicações do Nubank por WhatsApp.</label>
                            </div>
                            <div class="form-check mb-4">
                                <input type="checkbox" class="form-check-input" id="politica-privacidade" name="politicaPrivacidade">
                                <label class="form-check-label" for="politica-privacidade">Eu li, estou ciente das condições de tratamento dos meus dados pessoais e dou meu consentimento, quando aplicável, conforme descrito nesta Política de Privacidade.</label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100" onclick="return validar()">Enviar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="Scripts/validador.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
