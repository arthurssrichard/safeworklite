<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>SafeWorkLite - Cadastro</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Faça seu cadastro</h2>
        <form action="insertEmpresa" method="POST" class="mx-auto" style="max-width: 400px;">
            <div class="mb-3">
                <label for="nome-empresa" class="form-label">Nome da empresa</label>
                <input type="text" class="form-control" name="nome-empresa" placeholder="Digite o nome da empresa" required>
            </div>
            <div class="mb-3">
                <label for="nome-setor" class="form-label">Nome do setor</label>
                <input type="text" class="form-control" name="nome-setor" placeholder="Digite o nome do setor" required>
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label">Senha</label>
                <input type="password" class="form-control" name="senha" placeholder="Digite sua senha" required>
            </div>
            <div class="mb-3">
                <label for="repete-senha" class="form-label">Repetir senha</label>
                <input type="password" class="form-control" name="repete-senha" placeholder="Repita sua senha" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Cadastrar</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
