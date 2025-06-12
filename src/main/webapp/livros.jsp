<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <%@include file="base-head.jsp"%>
</head>
<body>
    <%@include file="modal.html"%>
    <%@include file="nav-menu.jsp"%>

    <div id="container" class="container-fluid">
        <div id="alert" style="${not empty message ? 'display: block;' : 'display: none;'}" 
             class="alert alert-dismissable ${alertType eq 1 ? 'alert-success' : 'alert-danger'}">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${message}
        </div>

        <div id="top" class="row">
            <div class="col-md-3">
                <h3>Livros</h3>
            </div>

            <div class="col-md-6">
                <div class="input-group h2">
                    <input class="form-control" id="search" type="text" placeholder="Pesquisar livros">
                    <span class="input-group-btn">
                        <button class="btn btn-danger" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/livro/form" class="btn btn-danger pull-right h2">
                    <span class="glyphicon glyphicon-plus"></span> Adicionar Livro
                </a>
            </div>
        </div>

        <hr />

        <div id="list" class="row">
            <div class="table-responsive col-md-12">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Editora</th>
                            <th>Ano</th>
							<th>Quantidade</th>
                            <th>Empresa</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="livro" items="${livros}">
                            <tr>
                                <td>${livro.getTitulo()}</td>
                                <td>${livro.getAutor()}</td>
                                <td>${livro.getEditora()}</td>
                                <td>${livro.getAnoPublicacao()}</td>
								<td>${livro.getQuantidade()}</td>
                                <td>${livro.getCompany().getName()}</td>
                                <td>
                                    <a class="btn btn-info btn-xs" 
                                       href="${pageContext.request.contextPath}/livro/update?id=${livro.getId()}">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </a>
                                </td>
                                <td>
                                    <a class="btn btn-danger btn-xs modal-remove"
                                       livro-id="${livro.getId()}" 
                                       livro-titulo="${livro.getTitulo()}"
                                       data-toggle="modal" 
                                       data-target="#delete-modal" 
                                       href="#">
                                       <span class="glyphicon glyphicon-trash"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div id="bottom" class="row">
            <div class="col-md-12">
                <ul class="pagination">
                    <li class="disabled"><a>&lt; Anterior</a></li>
                    <li class="active"><a>1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
                </ul>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            setTimeout(function () {
                $("#alert").slideUp(500);
            }, 3000);

            $(".modal-remove").click(function () {
                var titulo = $(this).attr('livro-titulo');
                var id = $(this).attr('livro-id');
                $(".modal-body #hiddenValue").text("o livro '" + titulo + "'");
                $("#id").val(id);
                $("#form").attr("action", "livro/delete");
            });
        });
    </script>
</body>
</html>