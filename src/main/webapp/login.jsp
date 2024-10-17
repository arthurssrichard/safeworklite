<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>SafeWorkLite</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Bem-vindo</h2>
        <form action="auth" method="POST" class="mx-auto" style="max-width: 400px;">
            <div class="mb-3">
                <label for="empresa" class="form-label">Empresa</label>
                <input type="text" name="empresa" class="form-control" placeholder="Digite sua empresa" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Senha</label>
                <input type="password" name="password" class="form-control" placeholder="Digite sua senha" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Entrar</button>
        </form>
        <div class="text-center mt-3">
            <span>Não tem uma conta ainda? <a href="cadastro">Cadastre-se</a></span>
        </div>
    </div>
    
</body>
</html>
