<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Signin Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
    <link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
    <meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="<c:url value='/bootstrap/css/signin.css'/>" rel="stylesheet">
</head>

<body class="text-center">
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
        <c:url var="addUsuario" value="public/usuario/userform.jsp">
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


</body>

</html>