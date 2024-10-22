<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Funcionario" %>
<%@ page import="model.Examinacao" %>
<%@ page import="java.util.ArrayList" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Examinacao> lista = (ArrayList<Examinacao>) request.getAttribute("examinacoes");
    Funcionario funcionario = (Funcionario)request.getAttribute("funcionario");
%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>SFL - Examinações</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>
<body>
    <div class="container mt-5">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
	        <h2>Examinações de <%= funcionario.getNome() %></h2>
            <a href="cadastrar?idFuncionario=<%= funcionario.getID() %>" class="btn btn-primary">Nova examinação</a>
        </div>

        <% if (lista == null || lista.isEmpty()) { %>
            <div class="alert alert-warning" role="alert">
                Sem examinações registradas.
            </div>
        <% } else { %>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Exame</th>
                        <th>Dado</th>
                        <th>Data</th>
                        <th class="text-center">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) { %>
                        <tr>
                            <td><%= lista.get(i).getId() %></td>
                            <td>
                                <a href="/SafeWorkManagerLite/examinacao/edit?id=<%= lista.get(i).getId() %>" class="link-primary">
                                    <%= lista.get(i).getExame().getNome() %>
                                </a>
                            </td>
                            <td><%= lista.get(i).getExame().getResultadoNomeDado() %></td>
                            <td><%= lista.get(i).getDataRealizada() %></td>
                            <td class="text-center">
                                <form action="/SafeWorkManagerLite/examinacao/delete" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="<%= lista.get(i).getId() %>">
                                    <input type="hidden" name="idFuncionario" value="<%= lista.get(i).getFuncionario().getID() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir essa examinação?')">Excluir</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
