<%-- 
    Document   : git
    Created on : 27 Kas 2023, 16:08:46
    Author     : USER2
--%>

<%@page import="proje.sesion"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <%
        String yazi = request.getParameter("git");
        if (yazi.equals("azalt")) {
            sesion.setBirgun(new Date(sesion.getBirgun().getTime() - 24 * 60 * 60 * 1000));
            if (sesion.getBirgun().getDay() == 0) {
                sesion.setBirgun(new Date(sesion.getBirgun().getTime() - 24 * 60 * 60 * 1000));
            }
        } else {
            sesion.setBirgun(new Date(sesion.getBirgun().getTime() + 24 * 60 * 60 * 1000));
            if (sesion.getBirgun().getDay() == 0) {
                sesion.setBirgun(new Date(sesion.getBirgun().getTime() + 24 * 60 * 60 * 1000));
            }
        }
        response.sendRedirect("kullanici.jsp");
    %>
</body>
</html>