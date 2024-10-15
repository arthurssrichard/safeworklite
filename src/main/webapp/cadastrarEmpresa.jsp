<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faça seu cadastro</title>
</head>
<body>
	<form action="insertEmpresa" method="POST">
		<label for="nome-empresa">Nome da empresa</label>
		<input type="text" name="nome-empresa">
		
		<label for="nome-setor">Nome do setor</label>
		<input type="text" name="nome-setor">
		
		<label for="senha">Senha</label>
		<input type="password" name="senha">
		
		<label for="repete-senha">Repetir senha</label>
		<input type="password" name="repete-senha">
		
		<input type="submit" value="Cadastrar">
		
	</form>
</body>
</html>