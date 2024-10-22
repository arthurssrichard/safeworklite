<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="model.Exame"%> 
<%@ page import="model.Funcionario"%> 
<%
	Funcionario funcionario = (Funcionario) request.getAttribute("funcionario");
	ArrayList<Exame> exames = (ArrayList<Exame>) request.getAttribute("exames");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeWorkLite - Nova Examinação</title>
</head>
<jsp:include page="../utils/header.jsp"/>

<body>
<h1>Cadastrar examinacão</h1>
<h3>Funcionário: <%=funcionario.getNome()%></h3>
	<form action="store" method="POST">
		<label for="data">Data de realização: </label>
		<input type="date" name="data">
		
		<label for="exame">Exame</label>
		<select name="exame" id="exameSelect" onchange="updateResultadoNomeDado()">
			<%for(int i = 0; i < exames.size(); i++){ %>
				<option value="<%=exames.get(i).getId()%>" 
				data-nomedado="<%=exames.get(i).getResultadoNomeDado()%>"
				data-tipodado="<%=exames.get(i).getResultadoTipoDado()%>"
				>
					<%= exames.get(i).getNome() %> ID: (<%=exames.get(i).getId()%>)
				</option>
			<%}%>
		</select>
		
		<label id="resultadoNomeDado">Resultado Nome dado</label>
		
		<div id="campoResultNumerico" style="display:none;">
			<label>Valor:</label>
			<input type="number" name="valorNumerico">
		</div>
		
		<div id="campoResultBooleano" style="display:none;">
			<label>Condição verdadeira?</label>
			<select name="resultadoBooleano">
				<option value="S">Sim</option>
				<option value="N">Não</option>
			</select>
		</div>
		<input type="hidden" name="resultado-tipo-dado" value="0" id="hiddenTipoDado">
		<input type="hidden" name="id-funcionario" value="<%=funcionario.getID()%>" >
		<input type="submit" value="Cadastrar examinação">
	</form>
	<script>
		document.addEventListener("DOMContentLoaded", (event) => {
			updateResultadoNomeDado(); // Atualiza quando a página carrega
		});

		// Função que atualiza o conteúdo do <h4> e exibe os campos corretos
		function updateResultadoNomeDado() {
		    var select = document.getElementById("exameSelect");
		    var selectedOption = select.options[select.selectedIndex];
		    
		    var nomeDado = selectedOption.getAttribute("data-nomedado");
		    var tipoDado = selectedOption.getAttribute("data-tipodado");
		    
		    var campoResultNumerico = document.getElementById("campoResultNumerico");
		    var campoResultBooleano = document.getElementById("campoResultBooleano");
		    var hiddenTipoDado = document.getElementById("hiddenTipoDado");

		    // Atualiza o nome do dado no label
		    document.getElementById("resultadoNomeDado").textContent = nomeDado;
		    
		    hiddenTipoDado.value = tipoDado;
		    
		    // Exibe ou esconde os campos conforme o tipo de dado
		    if(tipoDado === "numerico"){
		    	campoResultNumerico.style.display = "block";
		    	campoResultBooleano.style.display = "none";
		    } else if(tipoDado === "booleano"){
		    	campoResultNumerico.style.display = "none";
		    	campoResultBooleano.style.display = "block";
		    }
		}
	</script>
</body>
</html>