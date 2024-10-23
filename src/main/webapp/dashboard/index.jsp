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

        <section id="total-registros" class="text-start mb-4 mt-5">
            <h2>Total de Registros Existentes</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Tabelas</th>
                        <th>Registros</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="table-light">
                        <td>Setores</td>
                        <td><strong><%= splash.get("empresas_setor") %></strong></td>
                    </tr>
                    <tr class="table-secondary">
                        <td>Cargos</td>
                        <td><strong><%= splash.get("cargos") %></strong></td>
                    </tr>
                    <tr class="table-light">
                        <td>Funcionários</td>
                        <td><strong><%= splash.get("funcionarios") %></strong></td>
                    </tr>
                    <tr class="table-secondary">
                        <td>Exames</td>
                        <td><strong><%= splash.get("exames") %></strong></td>
                    </tr>
                    <tr class="table-light">
                        <td>Examinacões</td>
                        <td><strong><%= splash.get("examinacoes") %></strong></td>
                    </tr>
                </tbody>
            </table>
        </section>
        
        <hr>

        <section id="grafico" class="mb-5 mt-5">
            <h3>Examinacões inadequadas por cargo</h3>
            <canvas id="myChart" width="400" height="200"></canvas>
        </section>

        <hr>

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
                        if (topFuncionarios != null && !topFuncionarios.isEmpty()) {
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

<footer class="bg-light text-center text-lg-start mt-5">
    <div class="container p-4 d-flex justify-content-between">
        <div class="text-left">
            <h4>Criado por:</h4>
            <p>Arthur Salles Soares Richard</p>
            <p>Matheus Andrade Rangel</p>
            <p>Willian Alves Freitas Foca</p>
        </div>
        <div class="text-right">
            <h4>Disciplina: Banco de Dados</h4>
            <p>2024/2</p>
            <p>Professor: Howard Roatti</p>
        </div>
    </div>
</footer>


    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Faz a requisição dos dados via AJAX para o gráfico de examinacões inadequadas
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
                            label: 'Quantidade de Examinacões Inadequadas',
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
</body>
</html>
