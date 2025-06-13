<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<%@include file="base-head.jsp"%>
	<title>Login - Sistema Biblioteca</title>
	<style>
		body {
			background-color: #f8f9fa;
		}
		.login-card {
			max-width: 400px;
			margin: 60px auto;
			padding: 30px;
			border-radius: 10px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
			background-color: white;
		}
	</style>
</head>
<body>

	<%@include file="nav-menu.jsp"%>

	<div class="container">
		<div class="login-card">
			<h3 class="text-center mb-4">Login do Sistema</h3>
			<form action="${pageContext.request.contextPath}/login" method="POST">
				<div class="mb-3">
					<label for="username" class="form-label">Usuário</label>
					<input type="text" class="form-control" id="username" name="user_login" placeholder="Digite seu usuário" required />
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Senha</label>
					<input type="password" class="form-control" id="password" name="user_pw" placeholder="Digite sua senha" required />
				</div>
				<c:if test="${param.erro == 'true'}">
					<div class="alert alert-danger py-2 px-3 small">
						Usuário ou senha inválidos.
					</div>
				</c:if>
				<div class="d-grid">
					<button type="submit" class="btn btn-primary">Entrar</button>
				</div>
			</form>
		</div>
	</div>

	

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>