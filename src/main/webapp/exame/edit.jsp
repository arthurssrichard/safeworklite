<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Exame" %>
    <% 
        Exame exame = (Exame)request.getAttribute("exame");
		int id = exame.getId();
        String nome = exame.getNome();
        String descricao = exame.getDescricao();
        
        boolean demissao = exame.isDemissao();
        boolean admissao = exame.isAdmissao();
        boolean retornoAoTrabalho = exame.isRetornoAoTrabalho();
        int qtdVezesAno = exame.getVezesPorAno();
        String nomeDado = exame.getResultadoNomeDado();
        String tipoDado = exame.getResultadoTipoDado();
        
        Integer valorMin = null;
        Integer valorMax = null;
        if (exame.getResultadoNumericoEsperado() != null) {
            valorMin = exame.getResultadoNumericoEsperado()[0];
            valorMax = exame.getResultadoNumericoEsperado()[1];
        }
        boolean booleanoEsperado = exame.getResultadoBooleanoEsperado();
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Safe Work Lite - Editar Exame</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
	    <a href="/SafeWorkManagerLite/exame">← Voltar</a>
        <h2 class="mb-4">Editar Exame (<%=id %>)</h2>
        <form action="update" method="POST" class="row g-3">
            <div class="col-12">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" name="nome" value="<%=nome%>" required>
            </div>
            
            <div class="col-12">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea name="descricao" class="form-control"><%=descricao%></textarea>
            </div>
            
            <div class="col-12">
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="demissao" <%= demissao ? "checked" : "" %>>
                    <label class="form-check-label" for="demissao">Demissão</label>
                </div>
                
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="retorno-ao-trabalho" <%= retornoAoTrabalho ? "checked" : "" %>>
                    <label class="form-check-label" for="retorno-ao-trabalho">Retorno ao Trabalho</label>
                </div>
                
                <div class="form-check form-check-inline"> 
                    <input type="checkbox" class="form-check-input" name="admissao" <%= admissao ? "checked" : "" %>>
                    <label class="form-check-label" for="admissao">Admissão</label>
                </div>
            </div>
            
            <div class="col-12">
                <label for="vezes-por-ano" class="form-label">Quantidade de vezes por ano</label>
                <input type="number" class="form-control" name="vezes-por-ano" step="1" value="<%=qtdVezesAno%>">
            </div>
            
            <hr>
            
            <h4>Resultado esperado (considerado bom)</h4>
            
            <div class="row g-3">
                <div class="col-4">
                    <label for="nome-dado" class="form-label">Nome do dado</label>
                    <input type="text" class="form-control" name="nome-dado" placeholder="Ex: Hemoglobina (g/dL)" value="<%=nomeDado%>">
                </div>
                
                <div class="col-4">
                    <label for="tipo-dado" class="form-label">Tipo do dado</label>
                    <select id="tipo-dado" name="tipo-dado" class="form-select" onchange="toggleDado()">
                   	
                        <option value="numerico" <%= (tipoDado.equals("numerico")) ? "selected" : "" %>>Numérico</option>
                        <option value="booleano" <%= (tipoDado.equals("booleano")) ? "selected" : "" %>>Sim/Não</option>
                    </select>
                </div>
                
                <div id="valor-numerico" class="col-4">
                    <div class="row g-2">
                        <div class="col-6">
                            <label class="form-label">Valor min. esperado</label>
                            <input type="number" class="form-control" name="result-min-esperado" step="0.01" min="0" placeholder="Ex: 13" value="<%=valorMin%>">
                        </div>
                        <div class="col-6">
                            <label class="form-label">Valor max. esperado</label>
                            <input type="number" class="form-control" name="result-max-esperado" step="0.01" min="0" placeholder="Ex: 16" value="<%=valorMax%>">
                        </div>
                    </div>
                </div>
                
                <div id="valor-booleano" class="col-4">
                    <label for="resultado-booleano-esperado" class="form-label">Resultado esperado</label>
                    <select class="form-select" name="resultado-booleano-esperado">
                        <option value="S" <%= booleanoEsperado ? "selected" : "" %>>Sim</option>
                        <option value="N" <%= (!booleanoEsperado) ? "selected" : "" %>>Não</option>
                    </select>
                </div>
            </div>
            
            <div class="col-12">
            	<input type="hidden" name="id" value="<%=id%>">
                <input type="submit" class="btn btn-primary" value="Editar">
            </div>
        </form>
    </div>

    <script src="../scripts/scripts.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
