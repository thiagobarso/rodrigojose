<%@page import="br.com.rodrigojose.dao.UsuarioDao,
                br.com.rodrigojose.controller.UsuarioController" %>
<%
    Boolean valorB = Boolean.parseBoolean(request.getParameter("valor"));
    int idB = Integer.parseInt(request.getParameter("id"));

    int i = UsuarioDao.ativarUsuario(idB,valorB);
    java.lang.String msg = new java.lang.String();
    java.lang.String role = new java.lang.String();
    if (i > 0) {
        role = "alert-success";
        if(valorB == true){
            msg = "O usuario foi desativado com sucesso!";
        }else{
            msg = "O usuario foi ativado com sucesso!";
        }
    } else {
        msg = "Ops. Algo de errado ocorreu!";
        role = "alert-warning";
    }

    response.sendRedirect("viewusers.jsp?msg=" + msg + "&role=" + role);

%>