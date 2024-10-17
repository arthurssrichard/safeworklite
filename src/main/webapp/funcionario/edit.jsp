<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Funcionario" %>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<%
    Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
    ArrayList<Cargo> cargos = (ArrayList<Cargo>) request.getAttribute("cargos");

    String nome = funcionario.getNome();
    String dataMatricula = funcionario.getDataMatricula();
    String dataDemissao = funcionario.getDataDemissao();
    int idCargoFuncionario = funcionario.getCargo().getID();
    int idFuncionario = funcionario.getID();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SafeWorkLite - Editar Funcionário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
    	<a href="/SafeWorkManagerLite/funcionario">← Voltar</a>
        <h2 class="mb-4">Editar Funcionário: <%= idFuncionario %></h2>
        <form action="update" method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" name="nome" value="<%= nome %>" required>
            </div>

            <div class="mb-3">
                <label for="data-matricula" class="form-label">Data de contratação</label>
                <input type="date" class="form-control" name="data-matricula" value="<%= dataMatricula %>" required>
            </div>

            <div class="mb-3">
                <label for="data-demissao" class="form-label">Data de demissão</label>
                <input type="date" class="form-control" name="data-demissao" value="<%= dataDemissao %>">
            </div>

            <div class="mb-3">
                <label for="id-cargo" class="form-label">Cargo</label>
                <select name="id-cargo" class="form-select">
                    <% for (int i = 0; i < cargos.size(); i++) { %>
                        <option value="<%= cargos.get(i).getID() %>" <%= (cargos.get(i).getID() == idCargoFuncionario) ? "selected" : "" %>> 
                            <%= cargos.get(i).getNome() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <input type="hidden" name="id" value="<%= idFuncionario %>">
            <button type="submit" class="btn btn-primary">Editar Funcionário</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
