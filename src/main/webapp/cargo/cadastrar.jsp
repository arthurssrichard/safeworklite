<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
	<form action="store" method="POST">
		<label for="nome">Nome do cargo</label>
		<input type="text" name="nome">
		
		<label for="descricao">Descrição</label>
		<textarea name="descricao"></textarea>
		
		<input type="submit" value="Cadastrar Cargo">
		
	</form>
</body>
</html>