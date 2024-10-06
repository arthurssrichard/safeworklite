<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Cargo" %>
    <% 
	    Cargo cargo = (Cargo)request.getAttribute("cargo");
	    int id = cargo.getID();
	    String nome = cargo.getNome();
	    String descricao = cargo.getDescricao();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
<h2>Editar cargo: <%=id%></h2>
	<form action="update" method="POST">
		<label for="nome">Nome do cargo</label>
		<input type="text" name="nome" value="<%=nome%>">
		
		<label for="descricao">Descrição</label>
		<textarea name="descricao"><%=descricao%></textarea>
		
		<input type="hidden" name="id" value="<%=id%>">
		<input type="submit" value="Editar">
		
	</form>
</body>
</html>