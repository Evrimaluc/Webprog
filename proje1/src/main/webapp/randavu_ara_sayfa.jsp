<%-- 
    Document   : randavu_ara_sayfa
    Created on : 26 Kas 2023, 11:28:13
    Author     : USER2
--%>

<%@page import="java.time.Year"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Time"%>
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
            String tc = request.getParameter("tc");
            String isim = request.getParameter("isim");
            String telefon_no = request.getParameter("telefon_no");
            String posta = request.getParameter("posta");
            String onay;
            String secim;
            String[] arraysaatler;
            if (sesion.getTur().equals("Yönetici")) {
                secim = request.getParameter("secim2");
                arraysaatler = request.getParameter("saatler2").split(":");
            } else {
                secim = request.getParameter("secim");
                arraysaatler = request.getParameter("saatler").split(":");
            }

            int saat = Integer.parseInt(arraysaatler[0]);
            int dakika = Integer.parseInt(arraysaatler[1]);
            Time Time = new Time((saat - 2) * 3600 * 1000 + dakika * 60 * 1000);
            vt_baglan v = new vt_baglan();
            if (sesion.Bugun2.before(sesion.getBirgun()) || (sesion.Bugun2.equals(sesion.getBirgun()) && sesion.Bugun_saat2.before(Time))) {
                if (secim.equals("green")) {
                    v.randevu_kontrol(sesion.getBirgun(), Time);
                    if (v.kontrol.equals("0")) {
                        if (sesion.getTur().equals("Yönetici")) {
                            onay = "onaylandı";
                            v.kontrol_et(tc);
                            if (tc != null) {
                                if (v.kontrol.equals("0")) {
                                    v.kayit_yap(tc, isim, null, posta, telefon_no);
                                } else {
                                    v.sifre_kontrol(tc);
                                    if (v.Sifre == null) {
                                        v.guncelle(isim, posta, telefon_no, tc);
                                    }
                                }
                            }
                            v.randevu_kayit_yap(tc, sesion.getBirgun(), Time, onay);
                        } else {
                            onay = "onaylanmadi";
                            v.randevu_kayit_yap(sesion.getTc(), sesion.getBirgun(), Time, onay);
                        }
                    }
                } else {
                    v.randevu_sil(sesion.getBirgun(), Time);
                }
            }
            if (sesion.getTur().equals("Yönetici")) {
                response.sendRedirect("yonetici.jsp");
            } else {
                response.sendRedirect("kullanici.jsp");
            }
        %>
    </body>
</html>