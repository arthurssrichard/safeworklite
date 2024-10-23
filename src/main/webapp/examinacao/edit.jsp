<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="model.Exame"%> 
<%@ page import="model.Examinacao"%> 
<%@ page import="model.Funcionario"%> 
<%
    ArrayList<Exame> exames = (ArrayList<Exame>) request.getAttribute("exames");
    Examinacao examinacao = (Examinacao) request.getAttribute("examinacao");
    Funcionario funcionario = examinacao.getFuncionario();
    String tipoDado = examinacao.getTipoDado();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SafeWorkLite - Editar Examinação</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>

<body>
<div class="container mt-5">
    <h2 class="mb-4">Editar Examinação</h2>
    <h5 class="mb-3">Funcionário: <strong><%=funcionario.getNome()%></strong></h5>
    <form action="update" method="POST" class="row g-3">
        <div class="col-md-4">
            <label for="data" class="form-label">Data de realização</label>
            <input type="date" class="form-control" name="data" value="<%= examinacao.getDataRealizada() %>" required>
        </div>

        <div class="col-md-6">
            <label for="exame" class="form-label">Exame</label>
            <select name="exame" id="exameSelect" class="form-select" onchange="updateResultadoNomeDado()" required>
                <% for (Exame exame : exames) { %>
                    <option value="<%= exame.getId() %>" 
                        data-nomedado="<%= exame.getResultadoNomeDado() %>"
                        data-tipodado="<%= exame.getResultadoTipoDado() %>"
                        <%= (exame.getId() == examinacao.getExame().getId()) ? "selected" : "" %>>
                        <%= exame.getNome() %> - ID: (<%= exame.getId() %>)
                    </option>
                <% } %>
            </select>
        </div>

        <div class="container">
            <strong>
                <div class="col-md-6 mt-3">
                    <label id="resultadoNomeDado" class="form-label"><%= examinacao.getExame().getResultadoNomeDado() %></label>
                </div>
            </strong>
            
            <div id="campoResultNumerico" class="col-md-6 mt-3" style="<%= "numerico".equals(tipoDado) ? "display:block;" : "display:none;" %>">
                <label class="form-label">Valor (numérico)</label>
                <input type="number" name="valorNumerico" class="form-control" value="<%= examinacao.getResultadoNumerico() %>">
            </div>

            <div id="campoResultBooleano" class="col-md-6 mt-3" style="<%= "booleano".equals(tipoDado) ? "display:block;" : "display:none;" %>">
                <label for="resultadoBooleano" class="form-label">Condição verdadeira?</label>
                <select name="resultadoBooleano" class="form-select">
                    <option value="S" <%= examinacao.getResultadoBooleano() ? "selected" : "" %>>Sim</option>
                    <option value="N" <%= !examinacao.getResultadoBooleano() ? "selected" : "" %>>Não</option>
                </select>
            </div>
        </div>

        <input type="hidden" name="resultado-tipo-dado" value="<%= tipoDado %>" id="hiddenTipoDado">
        <input type="hidden" name="id-funcionario" value="<%= funcionario.getID() %>">
        <input type="hidden" name="id-examinacao" value="<%= examinacao.getId() %>">

        <div class="col-12 mt-4">
            <button type="submit" class="btn btn-primary">Editar examinação</button>
        </div>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        updateResultadoNomeDado(); // Atualiza quando a página carrega
    });

    function updateResultadoNomeDado() {
        var select = document.getElementById("exameSelect");
        var selectedOption = select.options[select.selectedIndex];
        
        var nomeDado = selectedOption.getAttribute("data-nomedado");
        var tipoDado = selectedOption.getAttribute("data-tipodado");
        
        var campoResultNumerico = document.getElementById("campoResultNumerico");
        var campoResultBooleano = document.getElementById("campoResultBooleano");
        var hiddenTipoDado = document.getElementById("hiddenTipoDado");

        document.getElementById("resultadoNomeDado").textContent = nomeDado;
        hiddenTipoDado.value = tipoDado;

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
