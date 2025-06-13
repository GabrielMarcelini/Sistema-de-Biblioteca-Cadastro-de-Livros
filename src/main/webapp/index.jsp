<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@ include file="base-head.jsp" %>
    <title>Início - Sistema de Livros</title>
    <style>
        .banner {
            background: url('images/livros-banner.jpg') no-repeat center center;
            background-size: cover;
            height: 350px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .banner h1 {
            font-size: 3rem;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.6);
        }

        .features {
            margin-top: 40px;
        }

        .card-icon {
            font-size: 48px;
            color: #007bff;
        }
    </style>
    <!-- Ícones Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <%@ include file="nav-menu.jsp" %>

    <!-- Banner com imagem -->
    <div class="banner">
        <div>
            <h1>Bem-vindo ao Sistema de Gestão de Livros</h1>
            <p>Organize, cadastre e mantenha controle total da sua biblioteca empresarial.</p>
        </div>
    </div>

    <!-- Destaques / Ações principais -->
    <div class="container features">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <div class="card-icon mb-2"><i class="bi bi-book"></i></div>
                        <h5 class="card-title">Listar Livros</h5>
                        <p class="card-text">Veja todos os livros cadastrados no sistema com suas respectivas informações.</p>
                        <a href="${pageContext.request.contextPath}/livros" class="btn btn-primary">Acessar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <div class="card-icon mb-2"><i class="bi bi-journal-plus"></i></div>
                        <h5 class="card-title">Cadastrar Livro</h5>
                        <p class="card-text">Adicione novos livros informando título, autor, editora, ano, Biblioteca e mais.</p>
                        <a href="${pageContext.request.contextPath}/livro/form" class="btn btn-primary">Cadastrar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <div class="card-icon mb-2"><i class="bi bi-building"></i></div>
                        <h5 class="card-title">Bibliotecas</h5>
                        <p class="card-text">Gerencie Bibliotecas associadas aos livros.</p>
                        <a href="${pageContext.request.contextPath}/companies" class="btn btn-primary">Bibliotecas</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>