<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Funcionario" %>
<%@ page import="model.Examinacao" %>
<%@ page import="java.util.ArrayList" %>
<%
	@ SuppressWarnings ("unchecked")
	ArrayList<Examinacao> lista = (ArrayList<Examinacao>) request.getAttribute("examinacoes");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>SFL - Fulano: Examinações</title>
</head>
<jsp:include page="../utils/header.jsp"/>
<body>
	        <% if (lista == null || lista.isEmpty()) { %>
            <div class="alert alert-warning" role="alert">
                Sem examinações registradas.
            </div>
        <% } else { %>
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Exame</th>
                        <th>Dado</th>
                        <th>Data</th>
                        <th>Ações</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) { %>
                        <tr>
                            <td><%= lista.get(i).getId() %></td>
                            <td><a href="/SafeWorkManagerLite/examinacao/edit?id=<%= lista.get(i).getId() %>" class="link-primary"><%= lista.get(i).getExame().getNome() %></a></td>
                            <td><%= lista.get(i).getExame().getResultadoNomeDado() %></td>
                            <td><%= lista.get(i).getDataRealizada() %></td>
							<td>
							    <form action="/SafeWorkManagerLite/examinacao/delete" method="POST" class="d-inline">
							        <input type="hidden" name="id" value="<%= lista.get(i).getId() %>">
							        <input type="hidden" name="idFuncionario" value="<%= lista.get(i).getFuncionario().getID() %>">
							        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja excluir essa examinação?')">Excluir</button>
							    </form>
							</td>
                            <td></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html>