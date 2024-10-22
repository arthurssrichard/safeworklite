<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Exame" %>
<%@ page import="java.util.ArrayList" %>
<%
@ SuppressWarnings ("unchecked")
ArrayList<Exame> lista = (ArrayList<Exame>)request.getAttribute("exames");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeWorkLite - Exames</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<jsp:include page="../utils/header.jsp"/>

<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Exames</h1>
            <a href="cadastrar" class="btn btn-primary">Novo Exame</a>
        </div>

        <% if (lista == null || lista.isEmpty()) { %>
            <div class="alert alert-warning">Sem exames registrados</div>
        <% } else { %>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>	
                        <th>Dado</th>	
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) { %>
                        <tr>
                            <td><%= lista.get(i).getId() %></td>
                            <td title="<%= lista.get(i).getDescricao() %>"><a href="edit?id=<%= lista.get(i).getId() %>" class="text-decoration-none"><%= lista.get(i).getNome() %></a></td>
                            <td><%= lista.get(i).getResultadoNomeDado() %></td>
                            <td>
                                <form action="delete" method="POST" style="display:inline">
                                    <input type="hidden" name="id" value="<%= lista.get(i).getId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir esse exame?')">Excluir</button>
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