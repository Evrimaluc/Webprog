<%-- 
    Document   : kayit1,
    Created on : 27 Eki 2023, 13:57:44
    Author     : USER2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="proje.vt_baglan" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kayıt</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <style>
        .form{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 2px solid #333;
            padding: 20px;
            width: 610px;
            height: 390px;
        }
        .tc_yazi{
            position : absolute;
            left : 60px;
            top : 50px;
        }
        .tc{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .isim_yazi{
            position : absolute;
            left : 60px;
            top : 100px;
        }
        .isim{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .telefon_no_yazi{
            position : absolute;
            left : 60px;
            top : 150px;
        }
        .telefon_no{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .sifre_yazi{
            position : absolute;
            left : 60px;
            top : 200px;
        }
        .sifre{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .sifre_tekrari_yazi{
            position : absolute;
            left : 60px;
            top : 250px;
        }
        .sifre_tekrari{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .kayit{
            position : absolute;
            width : 100px;
            height: 40px;
            left : 480px;
            top : 300px;
        }
        .yazi1{
            position : absolute;
            left : 180px;
            top : 340px;
            font-size: 20px;
        }
        .yazi2{
            position : absolute;
            left : 580px;
            top : 435px;
            font-size: 20px;
        }
    </style>
    <body>
    <div class = "form"><form action="kayit.jsp" method="post" id = "kayit_sayfasi">
            <div class = "tc_yazi">TC Kimlik NO: <input type="text" name="tc" id ="TC"  class = "tc" pattern="^\d{11}$" title ="TC kimlik formatına uygun olmalıdır" required></div>
            <div class = "isim_yazi">Kullanıcı Adı: <input type="text" name="isim" id ="isim" class ="isim" required></div>
            <div class = "telefon_no_yazi">telefon no: <input type="tel" name="telefon_no" id="telefon_no" class = "telefon_no"  pattern="^\d{10}$" title ="telefon No formatına uygun olmalıdır ve 0 ile başlamamalıdır" required></div>
            <div class = "sifre_yazi">Şifre: <input type="password" name="sifre" id="sifre" class = "sifre" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
            <div class = "sifre_tekrari_yazi">Şifre Tekrar: <input type="password" name="sifre_tekrari" id ="sifre_tekrari" class = "sifre_tekrari" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
            <input type="submit" value="Kayıt Ol" class = "kayit">
        </form>
        <div class = "yazi1">Zaten hesabınız var mı? <a href = "giris.jsp">giriş yap</a></div></div>

    <%
        String tc = request.getParameter("tc");
        String isim = request.getParameter("isim");
        String telefon_no = request.getParameter("telefon_no");
        String sifre = request.getParameter("sifre");
        String sifre_tekrari = request.getParameter("sifre_tekrari");
        vt_baglan v = new vt_baglan();
        v.kontrol_et(tc);
        if (tc != null) {
            if (v.kontrol.equals("0")) {
                if (sifre.equals(sifre_tekrari)) {
                    v.kayit_yap(tc, isim, sifre, null, telefon_no);
                    response.sendRedirect("giris.jsp");
                } else {
    %>
    <div class ="yazi2" id="yazi2">Şifreler uyuşmuyor</div>
    <%
        }
    } else {
        if (sifre.equals(sifre_tekrari)) {
            v.sifre_kontrol(tc);
            if (v.Sifre == null) {
                v.yaz(tc);
                v.guncelle(isim, v.posta, telefon_no, tc);
                v.sifre_guncelle(sifre, tc);
                response.sendRedirect("giris.jsp");
            } else {
    %>
    <div class ="yazi2" id="yazi2">böyle bir kayıt zaten var</div>
    <%
        }
    } else {

    %>
    <div class ="yazi2" id="yazi2">Şifreler uyuşmuyor</div>
    <%            }
            }
        }
    %>
</body>
</html>