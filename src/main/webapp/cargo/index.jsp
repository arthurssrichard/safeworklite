<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<%
@ SuppressWarnings ("unchecked")
ArrayList<Cargo> lista = (ArrayList<Cargo>)request.getAttribute("cargos");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SafeWorkLite - Cargos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Cargos</h1>
            <a href="cadastrar" class="btn btn-primary">Novo Cargo</a>
        </div>

        <% if (lista == null || lista.isEmpty()) { %>
            <div class="alert alert-warning">Sem cargos registrados</div>
        <% } else { %>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) { %>
                        <tr>
                            <td><%= lista.get(i).getID() %></td>
                            <td><a href="edit?id=<%= lista.get(i).getID() %>" class="text-decoration-none"><%= lista.get(i).getNome() %></a></td>
                            <td><%= lista.get(i).getDescricao() %></td>
                            <td>
                                <form action="delete" method="POST" style="display:inline">
                                    <input type="hidden" name="id" value="<%= lista.get(i).getID() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir esse cargo?')">Excluir</button>
                                </form>
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
