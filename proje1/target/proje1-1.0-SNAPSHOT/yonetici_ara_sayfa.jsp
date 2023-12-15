<%-- 
    Document   : yonetici_ara_sayfa
    Created on : 5 Ara 2023, 10:34:09
    Author     : USER
--%>

<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<%@page import="proje.vt_baglan"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        int yonetici_index = Integer.parseInt(request.getParameter("yonetici_index"));
        vt_baglan v = new vt_baglan();
        v.yazdir(sesion.Bugun2, sesion.Bugun_saat2);
        Date tarih;
        Time zaman;
        tarih = Date.valueOf(v.yazi.get(yonetici_index * 7 + 5));
        String[] arraysaatler = v.yazi.get(yonetici_index * 7 + 6).split(":");
        int saat = Integer.parseInt(arraysaatler[0]);
        int dakika = Integer.parseInt(arraysaatler[1]);
        zaman = new Time((saat - 2) * 3600 * 1000 + dakika * 60 * 1000);
        v.randevu_sil(tarih, zaman);
        response.sendRedirect("yonetici.jsp");
    %>
</body>
</html>