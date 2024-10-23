<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Safe Work Lite - Cadastro de Exame</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>
<body>
    <div class="container mt-5">
	    <a href="/SafeWorkManagerLite/exame/">← Voltar</a>
        <h2 class="mb-4">Cadastrar Exame</h2>
        <form action="store" method="POST" class="row g-3">
            <div class="col-12">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" name="nome" required>
            </div>
            
            <div class="col-12">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea name="descricao" class="form-control"></textarea>
            </div>
            
            <div class="col-12">
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="demissao">
                    <label class="form-check-label" for="demissao">Demissão</label>
                </div>
                
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="retorno-ao-trabalho">
                    <label class="form-check-label" for="retorno-ao-trabalho">Retorno ao Trabalho</label>
                </div>
                
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" name="admissao">
                    <label class="form-check-label" for="admissao">Admissão</label>
                </div>
            </div>
            
            <div class="col-12">
                <label for="vezes-por-ano" class="form-label">Quantidade de vezes por ano</label>
                <input type="number" class="form-control" name="vezes-por-ano" step="1">
            </div>
            
            <hr>
            
            <h4>Resultado esperado (considerado bom)</h4>
            
            <div class="row g-3">
                <div class="col-4">
                    <label for="nome-dado" class="form-label">Nome do dado</label>
                    <input type="text" class="form-control" name="nome-dado" placeholder="Ex: Hemoglobina (g/dL)">
                </div>
                
                <div class="col-4">
                    <label for="tipo-dado" class="form-label">Tipo do dado</label>
                    <select id="tipo-dado" name="tipo-dado" class="form-select" onchange="toggleDado()">
                        <option value="numerico">Numérico</option>
                        <option value="booleano">Sim/Não</option>
                    </select>
                </div>
                
                <div id="valor-numerico" class="col-4">
                    <div class="row g-2">
                        <div class="col-6">
                            <label class="form-label">Valor min. esperado</label>
                            <input type="number" class="form-control" name="result-min-esperado" step="0.01" min="0" placeholder="Ex: 13">
                        </div>
                        <div class="col-6">
                            <label class="form-label">Valor max. esperado</label>
                            <input type="number" class="form-control" name="result-max-esperado" step="0.01" min="0" placeholder="Ex: 16">
                        </div>
                    </div>
                </div>
                
                <div id="valor-booleano" class="col-4 d-none">
                    <label for="resultado-booleano-esperado" class="form-label">Resultado esperado</label>
                    <select class="form-select" name="resultado-booleano-esperado">
                        <option value="S">Sim</option>
                        <option value="N">Não</option>
                    </select>
                </div>
            </div>
            
            <div class="col-12">
                <input type="submit" class="btn btn-primary" value="Cadastrar Exame">
            </div>
        </form>
    </div>

    <script>
        function toggleDado() {
            var tipoDado = document.getElementById('tipo-dado').value;
            var valorNumerico = document.getElementById('valor-numerico');
            var valorBooleano = document.getElementById('valor-booleano');
            
            if (tipoDado === 'numerico') {
                valorNumerico.classList.remove('d-none');
                valorBooleano.classList.add('d-none');
            } else {
                valorNumerico.classList.add('d-none');
                valorBooleano.classList.remove('d-none');
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
