<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.FuncionarioComCargo" %>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<%
@ SuppressWarnings ("unchecked")
ArrayList<FuncionarioComCargo> lista = (ArrayList<FuncionarioComCargo>)request.getAttribute("funcionarios");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
	<h1>Funcionários</h1>
	<a href="cadastrar">Novo funcionario</a>
	<br>
	<% if(lista == null){
		out.println("Sem funcionarios registrados");
	}else{%>
			<table>
				<thead>
					<tr>
						<th>ID</th><th>Nome</th><th>Cargo</th><th></th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i< lista.size(); i++){%>
						<tr>
							<td><%=lista.get(i).getId()%></td>
							<td><a href="edit?id=<%=lista.get(i).getId()%>"><%=lista.get(i).getNome()%></a></td>
							<td><%=lista.get(i).getCargoNome()%></td>
							<td>
								<form action="delete" method="POST" style="display:inline">
									<input type="hidden" name="id" value="<%=lista.get(i).getId()%>">
									<button type="submit" onclick="return confirm('Tem certeza que deseja excluir esse funcionário?')">Excluir</button>
								</form>
							</td>
						</tr>
					<%}%>
				</tbody>
			</table>
	<%}%><!-- <- Esse } é o final do if else la de cima -->
	
</body>
</html>