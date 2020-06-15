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

                <div class="alert alert-success" role="alert">
                    Um registro foi salvo com sucesso!
                </div>
            </div>

        </main>
    </div>
</div>

<jsp:include page="../template/scripts.jsp"/>

</body>
</html>


</body>
</html>