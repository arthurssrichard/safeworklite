<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<% 
    ArrayList<Cargo> cargos = (ArrayList<Cargo>) request.getAttribute("cargos");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SafeWorkLite - Cadastrar Funcionário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>
<body>
    <div class="container mt-5">
    	<a href="/SafeWorkManagerLite/funcionario/">← Voltar</a>
        <h2 class="mb-4">Cadastrar Funcionário</h2>
        <form action="store" method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" name="nome" required>
            </div>

            <div class="mb-3">
                <label for="data-matricula" class="form-label">Data de contratação</label>
                <input type="date" class="form-control" name="data-matricula" required>
            </div>

            <div class="mb-3">
                <label for="id-cargo" class="form-label">Função</label>
                <select name="id-cargo" class="form-select">
                    <% for (int i = 0; i < cargos.size(); i++) { %>
                        <option value="<%= cargos.get(i).getID() %>"><%= cargos.get(i).getNome() %></option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Cadastrar Funcionário</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
