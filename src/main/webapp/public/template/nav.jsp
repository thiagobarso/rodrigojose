<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Sys Rodrigo</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Launch demo modal
            </button>
        </li>
    </ul>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-signin" method=post action="j_security_check">

                    <h1 class="h3 mb-3 font-weight-normal">
                        Por favor logue
                    </h1>
                    <label
                            for="inputEmail"
                            class="sr-only">
                        Usuário
                    </label>
                    <input
                            id="inputEmail"
                            name="j_username"
                            type="text"
                            class="form-control"
                            placeholder="Usuario"
                            required=""
                            autofocus="">
                    <label
                            for="inputPassword"
                            class="sr-only">
                        Senha
                    </label>
                    <input
                            id="inputPassword"
                            name="j_password"
                            type="password"
                            class="form-control"
                            placeholder="Senha"
                            required="">
                    <div class="checkbox mb-3">
                        <c:url var="addUsuario" value="/public/usuario/userform.jsp">
                            <%--        <c:param name="iq" value="${homer.iq}"/>--%>
                            <%--        <c:param name="checkAgainst" value="marge simpson"/>--%>
                        </c:url>
                        <a href="<c:out value='${addUsuario}'/>">Cadastre-se</a>
                    </div>
                    <button
                            class="btn btn-lg btn-primary btn-block"
                            type="submit">
                        Entrar
                    </button>
                    <p class="mt-5 mb-3 text-muted">2020</p>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>