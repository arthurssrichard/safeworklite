<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
	<form action="insertCargo">
		<label for="nome-empresa">Nome do cargo</label>
		<input type="text" name="nome-cargo">
		
		<label for="nome-setor">Nome do setor</label>
		<input type="text" name="nome-setor">
		
		<label for="senha">Senha</label>
		<input type="password" name="senha">
		
		<label for="repete-senha">Repetir senha</label>
		<input type="password" name="repete-senha">
		
		<input type="submit" value="viado">
		
	</form>
</body>
</html>