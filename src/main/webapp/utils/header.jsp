<header class="bg-light p-3 shadow-sm">
    <div class="container d-flex justify-content-between align-items-center">
        <!-- Logo e T�tulo -->
        <div class="d-flex align-items-center">
            <img alt="Safeworklite logo" src="/SafeWorkManagerLite/images/logo.png" class="img-fluid me-3" style="max-height: 50px;">
            <h2 class="mb-0">Sistema de Gest�o</h2> <!-- T�tulo ao lado da logo -->
        </div>
        
        <!-- Navega��o -->
        <nav>
            <ul class="nav">
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/login" class="nav-link text-dark">Login</a>
                </li>
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/cargo" class="nav-link text-dark">Cargos</a>
                </li>
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/funcionario" class="nav-link text-dark">Funcion�rios</a>
                </li>
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/exame" class="nav-link text-dark">Exames</a>
                </li>
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/examinacao" class="nav-link text-dark">Examina��es</a>
                </li>
                <li class="nav-item">
                    <a href="/SafeWorkManagerLite/dashboard" class="nav-link text-dark">Dashboard</a>
                </li>
            </ul>
        </nav>
    </div>
</header>

<style>
    .nav-link {
        transition: color 0.3s, transform 0.3s; /* Efeito de transi��o suave */
    }

    .nav-link:hover {
        color: #007bff; /* Mudar a cor do texto ao passar o mouse */
        transform: scale(1.1); /* Aumentar um pouco o tamanho do texto ao passar o mouse */
    }
</style>
