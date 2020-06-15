<%@page import="br.com.rodrigojose.dao.UsuarioDao,
                br.com.rodrigojose.controller.UsuarioController" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.String" %>
<jsp:useBean id="u" class="br.com.rodrigojose.bean.Usuario"/>
<jsp:setProperty property="*" name="u"/>

<%
    java.lang.String erro = UsuarioController.validar(u);

    if (erro != null) {
        response.sendRedirect("adduser-error.jsp?erro=" + erro);
    }else{
        int i = UsuarioDao.save(u);
        if (i > 0) {
            response.sendRedirect("adduser-success.jsp");
        } else {
            response.sendRedirect("adduser-error.jsp");
        }
    }
%>