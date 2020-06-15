<%@page import="br.com.rodrigojose.dao.UsuarioDao"%>
<jsp:useBean id="u" class="br.com.rodrigojose.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i= UsuarioDao.update(u);
    response.sendRedirect("viewusers.jsp");
%>