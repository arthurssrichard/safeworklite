<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
<% 
	ArrayList<Cargo> cargos = (ArrayList<Cargo>)request.getAttribute("cargos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
	<form action="store" method="POST">
		<label for="nome">Nome</label>
		<input type="text" name="nome" required>
		
		<label for="nome-setor">Data de contratação</label>
		<input type="date" name="data-matricula" required>
		
		<select name="id-cargo">
			<%for(int i = 0; i < cargos.size(); i++){%>
				<option value="<%=cargos.get(i).getID()%>"><%=cargos.get(i).getNome() %></option>
			<%}%>
		</select>
		
		<input type="submit" value="Cadastrar Funcionário">
	</form>
</body>
</html>