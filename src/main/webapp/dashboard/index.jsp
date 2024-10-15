<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite - Dashboard</title>
</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="/SafeWorkManagerLite/login">Login</a>
				<li><a href="/SafeWorkManagerLite/cargo">Cargos</a>
				<li><a href="/SafeWorkManagerLite/funcionario">Funcionários</a>
				<li><a href="/SafeWorkManagerLite/exame">Exames</a>
				<li><a href="/dashboard/"> </a>
			</ul>
		</nav>
	</header>
	<h1>Bem vindo!</h1>
	<%
		if(session != null && session.getAttribute("id") != null){
			out.print("Nome: " + (String) session.getAttribute("nomeEmpresa"));
		}
	%>
</body>
</html>