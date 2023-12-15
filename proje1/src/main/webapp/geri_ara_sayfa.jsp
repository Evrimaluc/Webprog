<%-- 
    Document   : geri_ara_sayfa
    Created on : 21 Kas 2023, 11:44:34
    Author     : USER2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <%
        if (sesion.getTur().equals("Üye")) {
            response.sendRedirect("kullanici.jsp");
        } else {
            response.sendRedirect("yonetici.jsp");
        }
    %>
</body>
</html>