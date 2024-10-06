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
<title>Safe Work Lite</title>
</head>
<body>
	<h1>Cargos</h1>
	<a href="cadastrar">Novo cargo</a>
	<br>
	<% if(lista == null){
		out.println("Sem cargos registrados");
	}else{%>
			<table>
				<thead>
					<tr>
						<th>ID</th><th>Nome</th><th>Descrição</th><th></th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i< lista.size(); i++){%>
						<tr>
							<td><%=lista.get(i).getID()%></td>
							<td><a href="edit?id=<%=lista.get(i).getID()%>"><%=lista.get(i).getNome()%></a></td>
							<td><%=lista.get(i).getDescricao()%></td>
							<td>
								<form action="delete" method="POST" style="display:inline">
									<input type="hidden" name="id" value="<%=lista.get(i).getID()%>">
									<button type="submit" onclick="return confirm('Tem certeza que deseja excluir esse cargo?')">Excluir</button>
								</form>
							</td>
						</tr>
					<%}%>
				</tbody>
			</table>
	<%}%><!-- <- Esse } é o final do if else la de cima -->
	
</body>
</html>