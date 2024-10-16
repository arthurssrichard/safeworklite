<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%="Bem vindo"%></h2>
	<form action="auth" method="POST">
		<div>
			<h4>Login:</h4>
			<label for="empresa">Empresa: </label> 
			<input name="empresa" type="text">

			<label for="password">Senha</label> 
			<input name="password" type="password"> 
			
			<input type="submit" value="viado">
		</div>
		<span>Não tem uma conta ainda? <a href="cadastro">Cadastre-se</a></span>
	</form>
</body>
</html>

