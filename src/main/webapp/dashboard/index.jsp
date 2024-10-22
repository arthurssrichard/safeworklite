<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Funcionario" %>
<%
    List<Map<String, Object>> topFuncionarios = (List<Map<String, Object>>)request.getAttribute("topFuncionarios");
    Map<String, Integer> splash = (Map<String, Integer>) request.getAttribute("splash");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Safe Work Lite - Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/SafeWorkManagerLite/css/styles.css">
</head>
<body>
    <jsp:include page="../utils/header.jsp"/>
    <div class="container mt-4">
        <section id="welcome">
            <h1 class="mb-4">Bem-vindo<%
                if(session != null && session.getAttribute("id") != null){
                    out.print(", "+(String) session.getAttribute("nomeEmpresa"));
                }
            %>!</h1>
        </section>
        
        <section id="total-registros" class="text-center mb-4">
            <h2>Sistema de Gestão</h2>
            <h3>Total de Registros Existentes</h3>
            <div class="registro-sistema border rounded p-3">
                <div class="row">
                    <div class="col-md-6">1 - Setores: <strong><%= splash.get("empresas_setor") %></strong></div>
                    <div class="col-md-6">2 - Cargos: <strong><%= splash.get("cargos") %></strong></div>
                    <div class="col-md-6">3 - Funcionários: <strong><%= splash.get("funcionarios") %></strong></div>
                    <div class="col-md-6">4 - Exames: <strong><%= splash.get("exames") %></strong></div>
                    <div class="col-md-6">5 - Examinacões: <strong><%= splash.get("examinacoes") %></strong></div>
                </div>
            </div>
        </section>

        <section id="criadores" class="text-center mt-4">
            <div class="criadores">
                <h4>Criado por:</h4>
                <p>Arthur Salles Soares Richard</p>
                <p>Matheus Andrade Rangel</p>
                <p>Willian Alves Freitas Foca</p>
            </div>
            <div class="disciplina mt-3">
                <h4>Disciplina: Banco de Dados</h4>
                <p>2024/2</p>
                <p>Professor: Howard Roatti</p>
            </div>
        </section>
        
        <section id="grafico" class="mb-5">
            <canvas id="myChart" width="400" height="200"></canvas>
        </section>
        
        <section id="top-funcionarios" class="table-responsive">
            <h3 class="mb-3">Top 5 Funcionários Fora do Padrão</h3>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Exames Fora do Padrão</th>
                        <th>Matrícula</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (topFuncionarios != null) {
                            for (Map<String, Object> item : topFuncionarios) {
                                Funcionario funcionario = (Funcionario) item.get("funcionario");
                                int quantExamesForaDoPadrao = (Integer) item.get("quantExamesForaDoPadrao");
                    %>
                        <tr>
                            <td><%= funcionario.getID() %></td>
                            <td><a href="/SafeWorkManagerLite/funcionario/examinacoes?id-funcionario=<%= funcionario.getID() %>"><%= funcionario.getNome() %></a></td>
                            <td><%= quantExamesForaDoPadrao %></td>
                            <td><%= funcionario.getDataMatricula() %></td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="4">Nenhum dado encontrado.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Faz a requisição dos dados via AJAX
    fetch('/SafeWorkManagerLite/dashboard/quantExamesInadequadosCargo')
        .then(response => response.json())
        .then(data => {
            // Cria arrays para os dados do gráfico
            const labels = data.map(item => item.cargo);
            const quantities = data.map(item => item.quantidade_inadequada);

            // Configura o Chart.js
            const ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Quantidade de Examinacoes Inadequadas',
                        data: quantities,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Erro ao buscar dados:', error));
</script>
</html>
