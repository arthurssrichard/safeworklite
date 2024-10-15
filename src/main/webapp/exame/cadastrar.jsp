<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<form action="store" method="POST" class="row">
	
		<div class="form-control">
			<label for="nome">Nome</label>
			<input type="text" name="nome" required>
		</div>
		
		<div class="form-control">	
			<label for="descricao">Descrição</label>
			<textarea name="descricao"></textarea>
		</div>
		
		<div class="form-control">
			<label for="nome">Demissão</label>
			<input type="checkbox" name="demissao">
		
			<label for="nome">Retorno ao trabalho</label>
			<input type="checkbox" name="retorno-ao-trabalho">
		</div>
		<hr>
		<h4>Resultado esperado</h4>
		
		<div class="form-control">
			<label for="nome-dado">Nome do dado</label>
			<input type="text" nome="nome-dado" placeholder="Ex: Hemoglobina (g/dL)">
		</div>
		
		<div class="form-control">
			<label for="nome-dado">Tipo do dado</label>
			<select id="tipo-dado" onchange="toggleDado()">
				<option value="numerico">Numérico</option>
				<option value="booleano">Sim/Não</option>
			</select>
		</div>
		
		<div id="valor-numerico">
			<div class="form-control">
				<label>Valor min. esperado</label>
				<input type="number" nome="result-min-esperado" step="0.01" min="0">
			</div>
			
			<div class="form-control">
				<label>Valor max. esperado</label>
				<input type="number" nome="result-max-esperado" step="0.01" min="0">
			</div>
		</div>
		
		<div id="valor-booleano">
			<label for="resultado-booleano-esperado">Resultado esperado</label>
			<select name="resultado-booleano-esperado">
				<option value="S">Sim</option>
				<option value="N">Não</option>
			</select>
		</div>
		
		<input type="submit" value="Cadastrar Exame">
		
	</form>
	<script src="../scripts/scripts.js"></script>
</body>
</html>