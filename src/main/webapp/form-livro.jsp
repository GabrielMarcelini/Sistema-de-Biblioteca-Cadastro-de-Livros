<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<%@include file="base-head.jsp"%>
</head>
<body>
	<%@include file="nav-menu.jsp"%>

	<div id="container" class="container-fluid">
		<h3 class="page-header">${not empty livro ? "Editar Livro" : "Cadastrar Livro"}</h3>

		<form action="${pageContext.request.contextPath}/livro/${action}"
			method="POST">
			<input type="hidden" value="${livro.getId()}" name="id">

			<div class="row">
				<div class="form-group col-md-4">
					<label for="titulo">Título</label> <input type="text"
						class="form-control" id="titulo" name="titulo" required
						placeholder="Título do livro"
						oninvalid="this.setCustomValidity('Por favor, informe o título do livro.')"
						oninput="setCustomValidity('')" value="${livro.getTitulo()}">
				</div>

				<div class="form-group col-md-4">
					<label for="autor">Autor</label> <input type="text"
						class="form-control" id="autor" name="autor" required
						placeholder="Autor do livro"
						oninvalid="this.setCustomValidity('Por favor, informe o autor.')"
						oninput="setCustomValidity('')" value="${livro.getAutor()}">
				</div>

				<div class="form-group col-md-4">
					<label for="editora">Editora</label> <input type="text"
						class="form-control" id="editora" name="editora" required
						placeholder="Editora do livro"
						oninvalid="this.setCustomValidity('Por favor, informe a editora.')"
						oninput="setCustomValidity('')" value="${livro.getEditora()}">
				</div>

				<div class="form-group col-md-4">
					<label for="anoPublicacao">Ano de Publicação</label>
					<input type="number" class="form-control" id="anoPublicacao" name="anoPublicacao"
						placeholder="Ex: 2024"
						value="${livro.anoPublicacao}">
				</div>
				
				<div class="form-group col-md-4">
					<label for="quantidade">Quantidade</label>
					<input type="number" class="form-control" id="quantidade" name="quantidade"
						placeholder="Quantidade de exemplares"
						value="${livro.quantidade}">
				</div>

				<div class="form-group col-md-4">
					<label for="company">Empresa</label> <select class="form-control"
						id="company" name="company" required>
						<option value="" disabled selected>Selecione uma empresa</option>
						<c:forEach var="company" items="${companies}">
							<option value="${company.id}"
								<c:if test="${not empty livro && livro.company != null && livro.company.id == company.id}">selected</c:if>>
								${company.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<hr />

			<div id="actions" class="row pull-right">
				<div class="col-md-12">
					<a href="${pageContext.request.contextPath}/livros"
						class="btn btn-default">Cancelar</a>
					<button type="submit" class="btn btn-primary">${not empty livro ? "Alterar Livro" : "Cadastrar Livro"}
					</button>
				</div>
			</div>
		</form>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>