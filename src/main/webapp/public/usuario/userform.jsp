<!doctype html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <jsp:include page="../template/head.jsp"/>
</head>
<body>
<jsp:include page="../template/nav.jsp"/>

<div class="container-fluid">

    <div class="row">
        <jsp:include page="../template/menu.jsp"/>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Adicionando Novo Usuário</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <%--                    <a href="viewusers.jsp">View All Records</a><br/>--%>
                </div>

                <c:if test="${param.erro != null}">
                    <div class="alert alert-danger" role="alert">
                        <c:out value="${param.erro}"/>
                    </div>
                </c:if>

                <form action="adduser.jsp" method="post" class="needs-validation" novalidate>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input
                                id="login"
                                name="login"
                                type="name"
                                class="form-control"
                                required>
                        <div class="invalid-feedback">
                            Por favor digite um login
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nome">Nome</label>
                        <input
                                id="nome"
                                name="nome"
                                type="name"
                                class="form-control"
                                required>
                        <div class="invalid-feedback">
                            Por favor digite um nome.
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input
                                id="senha"
                                name="senha"
                                type="password"
                                class="form-control"
                                required>
                        <div class="invalid-feedback">
                            Por favor digite uma senha.
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input
                                id="email"
                                name="email"
                                type="email"
                                class="form-control"
                                required>
                        <div class="invalid-feedback">
                            Por favor digite um email válido.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="perfil">Perfil</label>
                        <select
                                id="perfil"
                                name="perfil"
                                class="form-control"
                                required>
                            <option value="1">Administrador</option>
                            <option value="2">Operador</option>
                        </select>
                    </div>

                    <button class="btn btn-primary" type="submit">Adicionar Usuário</button>
                </form>

            </div>

        </main>
    </div>
</div>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

<jsp:include page="../template/scripts.jsp"/>

</body>
</html>




