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
	<h1>Bem vindo!</h1>
	<%
		if(session != null && session.getAttribute("id") != null){
			out.print("ID: " + session.getAttribute("id"));
		}
	%>
</body>
</html>