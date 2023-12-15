<%-- 
    Document   : giris1
    Created on : 27 Eki 2023, 13:58:05
    Author     : USER2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="proje.vt_baglan" %>
<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giriş</title>
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
        width: 600px;
        height: 260px;
    }
    .tc_yazi{
        position : absolute;
        left : 60px;
        top : 40px;
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
        top : 90px;
    }
    .isim{
        position : absolute;
        width : 400px;
        height: 30px;
        left : 120px;
        top : 0px;
    }
    .sifre_yazi{
        position : absolute;
        left : 60px;
        top : 140px;
    }
    .sifre{
        position : absolute;
        width : 400px;
        height: 30px;
        left : 120px;
        top : 0px;
    }
    .giris{
        position : absolute;
        width : 100px;
        height: 40px;
        left : 480px;
        top : 185px;
    }
    .isaret_yazi{
        position : absolute;
        left : 80px;
        top : 200px;
    }
    .isaret{
        position : absolute;
        left : -30px;
        top : 3px;
        width : 20px;
        height: 20px;
    }
    .yazi1{
        position : absolute;
        left : 205px;
        top : 225px;
        font-size: 20px;
    }
    .yazi2{
        position : absolute;
        left : 570px;
        top : 390px;
        font-size: 20px;
    }

</style>

<body>
    <%
        Cookie[] cookies = null;
        cookies = request.getCookies();
        String tc2 = null;
        String isim2 = null;
        String tur = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("Tc")) {
                    tc2 = cookie.getValue();
                } else if (cookie.getName().equals("Isim")) {
                    isim2 = cookie.getValue();
                } else if (cookie.getName().equals("Tur")) {
                    tur = cookie.getValue();
                }
            }
            sesion.setTc(tc2);
            sesion.setIsim(isim2);
            sesion.setTur(tur);
            if (tc2 != null) {
                if (sesion.getTur().equals("Üye")) {
                    response.sendRedirect("kullanici.jsp");
                } else {
                    response.sendRedirect("yonetici.jsp");
                }
            }
        }
    %>
<div class = "form"><form action="giris.jsp"  method="post">
        <div class = "tc_yazi">TC Kimlik NO:  <input type="text" name="TC" class ="tc" pattern="^\d{11}$" title ="TC kimlik formatına uygun olmalıdır" required></div>
        <div class = "isim_yazi">Kullanıcı Adı: <input type="text" name="isim" class ="isim" required></div>
        <div class ="sifre_yazi">Şifre: <input type="password" name="sifre" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
        <div class = "isaret_yazi"> <input type ="checkbox" name ="isaret" id="isaret" class ="isaret" value="hatirla"> beni hatırla</div>
        <input type="submit" value="Giris yap" class = "giris" name = "Giris">
    </form>
    <div class = "yazi1">Hesabınız yok mu? <a href = "kayit.jsp">kayıt ol</a></div></div>

<%    String tc = request.getParameter("TC");
    String isim = request.getParameter("isim");
    String sifre = request.getParameter("sifre");
    String isaretler = request.getParameter("isaret");
    vt_baglan v = new vt_baglan();
    v.giris_yap(tc, isim, sifre);
    v.uye_tur(tc);
    cookies = request.getCookies();
    if (isim != null) {
        if (v.kontrol.equals("1")) {
            v.yaz(tc);
            if ("hatirla".equals(isaretler)) {
                Cookie Tc = new Cookie("Tc", tc);
                Tc.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(Tc);
                Cookie Isim = new Cookie("Isim", isim);
                Isim.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(Isim);
                Cookie Tur = new Cookie("Tur", v.Tur);
                Tur.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(Tur);
            }
            sesion.setTc(tc);
            sesion.setIsim(isim);
            sesion.setTur(v.Tur);
            if (tc2 == null) {
                if (sesion.getTur().equals("Üye")) {
                    response.sendRedirect("kullanici.jsp");
                } else {
                    response.sendRedirect("yonetici.jsp");
    }
            }
        } else {
%>
<div class = "yazi2">böyle bir kayıt bulunamadı</div>
<%
        }
    }
%> 
</body>
</html>