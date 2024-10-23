<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Cargo" %>
    <% 
        Cargo cargo = (Cargo)request.getAttribute("cargo");
        int id = cargo.getID();
        String nome = cargo.getNome();
        String descricao = cargo.getDescricao();
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SafeWorkLite - Editar Cargo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<jsp:include page="../utils/header.jsp"/>
<body>
    <div class="container mt-5">
    	<a href="/SafeWorkManagerLite/cargo/">← Voltar</a>
        <h2 class="mb-4">Editar Cargo: <%=id%></h2>
        <form action="update" method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome do Cargo</label>
                <input type="text" class="form-control" name="nome" id="nome" value="<%=nome%>" required>
            </div>
            
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea name="descricao" class="form-control" id="descricao"><%=descricao%></textarea>
            </div>
            
            <input type="hidden" name="id" value="<%=id%>">
            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+e/tGWL77Dwhf4LIhNmOYqF7CXvN/" crossorigin="anonymous"></script>
</body>
</html>
