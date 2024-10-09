<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Funcionario" %>
<%@ page import="model.Cargo" %>
<%@ page import="java.util.ArrayList" %>
    <% 
	    Funcionario funcionario = (Funcionario)request.getAttribute("funcionario");
    	ArrayList<Cargo> cargos = (ArrayList<Cargo>)request.getAttribute("cargos");
    	
    	String nome = funcionario.getNome();
    	String dataMatricula = funcionario.getDataMatricula();
    	int idCargoFuncionario = funcionario.getCargo().getID();
    	int idFuncionario = funcionario.getID();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
</head>
<body>
	<form action="update" method="POST">
		<label for="nome">Nome</label>
		<input type="text" name="nome" value="<%=nome%>">
		
		<label for="data-matricula">Data de contratação</label>
		<input type="date" name="data-matricula" value="<%=dataMatricula%>">
		
		<label for="id-cargo">Cargo</label>
		<select name="id-cargo">
			<%for(int i = 0; i < cargos.size(); i++){%>
				<option value="<%=cargos.get(i).getID()%>" <%=(cargos.get(i).getID() == idCargoFuncionario) ? "selected" : "" /*descobre se a opção em questão é a escolhida na hora que foi criado*/ %>> 
					<%=cargos.get(i).getNome() %>
				</option>
			<%}%>
		</select>
		<input type="hidden" name="id" value="<%= idFuncionario %>">
		
		<input type="submit" value="Editar">
	</form>
</body>
</html>