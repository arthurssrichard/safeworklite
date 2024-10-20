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
</head>
<body>
    <h1>Editar examinacão</h1>
    <h3>Funcionário: <%=funcionario.getNome()%></h3>
    <form action="update" method="POST">
        <label for="data">Data de realização: </label>
        <input type="date" name="data" value="<%=examinacao.getDataRealizada()%>">
        
        <label for="exame">Exame</label>
        <select name="exame" id="exameSelect" onchange="updateResultadoNomeDado()">
            <%for (Exame exame : exames) { %>
                <option value="<%=exame.getId()%>" 
                data-nomedado="<%=exame.getResultadoNomeDado()%>"
                data-tipodado="<%=exame.getResultadoTipoDado()%>"
                <%= (exame.getId() == examinacao.getExame().getId()) ? "selected" : "" %>>
                    <%= exame.getNome() %> ID: (<%= exame.getId() %>)
                </option>
            <% } %>
        </select>
        
        <label id="resultadoNomeDado"><%= examinacao.getExame().getResultadoNomeDado() %></label>
        
        <!-- Campo para resultado numérico -->
        <div id="campoResultNumerico" style="<%= "numerico".equals(tipoDado) ? "display:block;" : "display:none;" %>">
            <label>Valor:</label>
            <input type="number" name="valorNumerico" value="<%= examinacao.getResultadoNumerico() %>">
        </div>
        
        <!-- Campo para resultado booleano -->
        <div id="campoResultBooleano" style="<%= "booleano".equals(tipoDado) ? "display:block;" : "display:none;" %>">
            <label>Condição verdadeira?</label>
            <select name="resultadoBooleano">
                <option value="S" <%= examinacao.getResultadoBooleano() ? "selected" : "" %>>Sim</option>
                <option value="N" <%= !examinacao.getResultadoBooleano() ? "selected" : "" %>>Não</option>
            </select>
        </div>
        
        <input type="hidden" name="resultado-tipo-dado" value="<%= tipoDado %>" id="hiddenTipoDado">
        <input type="hidden" name="id-funcionario" value="<%= funcionario.getID() %>">
        <input type="hidden" name="id-examinacao" value="<%= examinacao.getId() %>">
        <input type="submit" value="Editar examinação">
    </form>
    
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
