<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String[][] turmas = {
        { "Programação para Web", "ENSOF4AN1", "60h", "Reinaldo Vieira" },
        { "Banco de Dados", "ENSOF4BD1", "80h", "Carlos Souza" },
        { "Engenharia de Software", "ENSOF4ES1", "80h", "Ana Lima" }
    };

    // Objeto implícito session: recupera o valor salvo por processar.jsp.
    String ultimoCadastro = (String) session.getAttribute("ultimoCadastro");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turmas do 4º Período</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
            <div>
                <h1 class="h2 mb-1">Turmas do 4º período</h1>
                <p class="text-muted mb-0">Engenharia de Software - 2026/2</p>
            </div>
            <a href="portal-bootstrap.html" class="btn btn-outline-success">Voltar ao portal</a>
        </div>

        <% if (ultimoCadastro != null) { %>
            <div class="alert alert-info">
                Último cadastro desta sessão: <strong><%= ultimoCadastro %></strong>
            </div>
        <% } %>

        <div class="table-responsive shadow-sm">
            <table class="table table-bordered table-hover align-middle bg-white mb-0">
                <caption class="visually-hidden">Lista de turmas disponíveis no quarto período</caption>
                <thead class="table-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Disciplina</th>
                        <th scope="col">Código</th>
                        <th scope="col">Carga</th>
                        <th scope="col">Professor</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Loop Java: gera uma linha HTML para cada turma do array. --%>
                    <% for (int i = 0; i < turmas.length; i++) { %>
                        <tr>
                            <th scope="row"><%= (i + 1) %></th>
                            <td><%= turmas[i][0] %></td>
                            <td><%= turmas[i][1] %></td>
                            <td><%= turmas[i][2] %></td>
                            <td><%= turmas[i][3] %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
