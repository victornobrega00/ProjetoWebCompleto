<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    // Escapa caracteres com significado em HTML para impedir XSS refletido.
    private String escaparHtml(String valor) {
        if (valor == null) return "";
        return valor.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
%>
<%
    request.setCharacterEncoding("UTF-8");

    // Objeto implícito request: lê os parâmetros enviados pelo formulário.
    String nomeRecebido = request.getParameter("nome");
    String emailRecebido = request.getParameter("email");
    String turmaRecebida = request.getParameter("turma");

    String nome = nomeRecebido == null ? "" : nomeRecebido.trim();
    String email = emailRecebido == null ? "" : emailRecebido.trim();

    String turma = null;
    if ("web".equals(turmaRecebida)) turma = "Programação para Web";
    if ("bd".equals(turmaRecebida)) turma = "Banco de Dados";
    if ("es".equals(turmaRecebida)) turma = "Engenharia de Software";

    boolean emailValido = email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
    boolean valido = !nome.isEmpty() && emailValido && turma != null;

    String nomeSeguro = escaparHtml(nome);
    String emailSeguro = escaparHtml(email);

    if (valido) {
        // Objeto implícito session: mantém o último cadastro entre requisições.
        session.setAttribute("ultimoCadastro", nomeSeguro);
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado do Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="mx-auto" style="max-width: 720px;">
            <% if (valido) { %>
                <section class="alert alert-success" aria-labelledby="titulo-sucesso">
                    <h1 id="titulo-sucesso" class="h4">Cadastro realizado com sucesso</h1>
                    <hr>
                    <%-- Expressões JSP usam valores sanitizados; out é o JspWriter implícito. --%>
                    <p><strong>Nome:</strong> <%= nomeSeguro %></p>
                    <p><strong>E-mail:</strong> <%= emailSeguro %></p>
                    <p class="mb-0"><strong>Turma:</strong> <%= turma %></p>
                </section>
            <% } else { %>
                <section class="alert alert-danger" aria-labelledby="titulo-erro">
                    <h1 id="titulo-erro" class="h4">Não foi possível realizar o cadastro</h1>
                    <p class="mb-0">Preencha nome, e-mail e turma com valores válidos.</p>
                </section>
            <% } %>

            <div class="d-flex flex-wrap gap-2 mt-3">
                <a href="portal-bootstrap.html" class="btn btn-outline-secondary">Voltar ao portal</a>
                <% if (valido) { %>
                    <a href="turmas.jsp" class="btn btn-success">Ver turmas</a>
                <% } %>
            </div>
        </div>
    </main>
</body>
</html>
