<%-- 
    Document   : cikis_ara_sayfa
    Created on : 7 Kas 2023, 10:25:13
    Author     : USER2
--%>

<%@page import="proje.vt_baglan"%>
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
            try {
                String sil = request.getParameter("silme");
                if (sil.equals("sil")) {
                    vt_baglan v = new vt_baglan();
                    v.sifre_guncelle(null, sesion.getTc());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("giris.jsp");
        %>
    </body>
</html>