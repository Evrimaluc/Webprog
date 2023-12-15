<%-- 
    Document   : onay_ara_sayfa
    Created on : 3 Ara 2023, 15:11:48
    Author     : USER
--%>

<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="proje.vt_baglan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

    <%
        int onay_index = Integer.parseInt(request.getParameter("onay_index"));
        int index;
        vt_baglan v = new vt_baglan();
        v.onay_yazdir(sesion.Bugun2, sesion.Bugun_saat2);
        Date tarih;
        Time zaman;
        if (onay_index % 2 == 0) {
            index = (onay_index / 2) - 1;
            tarih = Date.valueOf(v.yazi.get(index * 7 + 5));
            String[] arraysaatler = v.yazi.get(index * 7 + 6).split(":");
            int saat = Integer.parseInt(arraysaatler[0]);
            int dakika = Integer.parseInt(arraysaatler[1]);
            zaman = new Time((saat - 2) * 3600 * 1000 + dakika * 60 * 1000);
            v.onay_guncelle(tarih, zaman);
        } else {
            index = onay_index / 2;
            tarih = Date.valueOf(v.yazi.get(index*7 +   5));
            String[] arraysaatler = v.yazi.get(index * 7 + 6).split(":");
            int saat = Integer.parseInt(arraysaatler[0]);
            int dakika = Integer.parseInt(arraysaatler[1]);
            zaman = new Time((saat - 2) * 3600 * 1000 + dakika * 60 * 1000);
            v.randevu_sil(tarih, zaman);
        }
        response.sendRedirect("onay.jsp");
    %>
</body>
</html>