<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Funcionario" %>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<%
@ SuppressWarnings ("unchecked")
ArrayList<Funcionario> lista = (ArrayList<Funcionario>) request.getAttribute("funcionarios");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Safe Work Lite - Funcionários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Funcionários</h1>
        <a href="cadastrar" class="btn btn-primary mb-3">Novo Funcionário</a>
        
        <% if (lista == null || lista.isEmpty()) { %>
            <div class="alert alert-warning" role="alert">
                Sem funcionários registrados.
            </div>
        <% } else { %>
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Cargo</th>
                        <th>Ações</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) { %>
                        <tr>
                            <td><%= lista.get(i).getID() %></td>
                            <td><a href="edit?id=<%= lista.get(i).getID() %>" class="link-primary"><%= lista.get(i).getNome() %></a></td>
                            <td><%= lista.get(i).getCargo().getNome() %></td>
                            <td>
                                <form action="delete" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="<%= lista.get(i).getID() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir esse funcionário?')">Excluir</button>
                                </form>
                            </td>
                            <td>
                            	<a href="/SafeWorkManagerLite/examinacao/cadastrar?idFuncionario=<%=lista.get(i).getID()%>">Realizar Exame</a>
                            	<a href="/SafeWorkManagerLite/funcionario/examinacoes?id-funcionario=<%=lista.get(i).getID()%>">Ver exames</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
