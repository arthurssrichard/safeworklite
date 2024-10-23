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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>

<body>
<div class="container mt-5">
    <h2 class="mb-4">Cadastrar Examinação</h2>
    <h5 class="mb-3">Funcionário: <strong><%=funcionario.getNome()%></strong></h5>
    <form action="store" method="POST" class="row g-3">
        <div class="col-md-4">
            <label for="data" class="form-label">Data de realização</label>
            <input type="date" class="form-control" name="data" required>
        </div>

        <div class="col-md-6">
            <label for="exame" class="form-label">Exame</label>
            <select name="exame" id="exameSelect" class="form-select" onchange="updateResultadoNomeDado()" required>
                <%for (int i = 0; i < exames.size(); i++) { %>
                    <option value="<%= exames.get(i).getId() %>" 
                        data-nomedado="<%= exames.get(i).getResultadoNomeDado() %>"
                        data-tipodado="<%= exames.get(i).getResultadoTipoDado() %>">
                        <%= exames.get(i).getNome() %> - ID: (<%= exames.get(i).getId() %>)
                    </option>
                <% } %>
            </select>
        </div>
        
		<div class="container">
		<strong>
	        <div class="col-md-6 mt-3">
	            <label id="resultadoNomeDado" class="form-label">Resultado Nome dado</label>
	        </div>
		</strong>
	        <div id="campoResultNumerico" class="col-md-6" style="display:none;">
	            <label class="form-label">Valor (numérico)</label>
	            <input type="number" name="valorNumerico" class="form-control">
	        </div>
	
	        <div id="campoResultBooleano" class="col-md-6" style="display:none;">
	            <label for="resultadoBooleano" class="form-label">Condição verdadeira?</label>
	            <select name="resultadoBooleano" class="form-select">
	                <option value="S">Sim</option>
	                <option value="N">Não</option>
	            </select>
	        </div>
		</div>
		
        <input type="hidden" name="resultado-tipo-dado" value="0" id="hiddenTipoDado">
        <input type="hidden" name="id-funcionario" value="<%= funcionario.getID() %>">

        <div class="col-12 mt-4">
            <button type="submit" class="btn btn-primary">Cadastrar examinação</button>
        </div>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        updateResultadoNomeDado(); // Atualiza quando a página carrega
    });

    // Função que atualiza o conteúdo do label e exibe os campos corretos
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
        if (tipoDado === "numerico") {
            campoResultNumerico.style.display = "block";
            campoResultBooleano.style.display = "none";
        } else if (tipoDado === "booleano") {
            campoResultNumerico.style.display = "none";
            campoResultBooleano.style.display = "block";
        }
    }
</script>
</body>
</html>
