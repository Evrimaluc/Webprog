<%-- 
    Document   : ayarlar
    Created on : 2 Kas 2023, 12:19:53
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
    <title>Ayarlar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>

    <style>
        .form{
            position: absolute;
            left: 388px;
            top: 93px;
            border: 2px solid #333;
            padding: 20px;
            width: 600px;
            height: 500px;
        }
        .ayar_sayfasi1{
            position : absolute;
            left : 20px;
            top : 50px;
            width: 600px;
            height: 250px;
        }
        .isim_yazi{
            position : absolute;
            left : 20px;
            top : 0px;
        }
        .isim{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .telefon_no_yazi{
            position : absolute;
            left : 20px;
            top : 50px;
        }
        .telefon_no{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .posta_yazi{
            position : absolute;
            left : 20px;
            top : 100px;
        }
        .posta{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .kaydet1{
            position : absolute;
            width : 100px;
            height: 40px;
            left : 425px;
            top : 150px;
        }

        .ayar_sayfasi2{
            position : absolute;
            left : 20px;
            top : 280px;
            width: 600px;
            height: 250px;
        }
        .yazi{
            position : fixed;
            left : 630px;
            top : 550px;
            font-size: 20px;
        }
        .yazi2{
            position : fixed;
            left : 620px;
            top : 555px;
            font-size: 20px;
        }
        .yazi3{
            position : fixed;
            left : 620px;
            top : 300px;
            font-size: 20px;
        }
        .eski_sifre_yazi{
            position : absolute;
            left : 20px;
            top : 0px;
        }
        .eski_sifre{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .sifre_yazi{
            position : absolute;
            left : 20px;
            top : 50px;
        }
        .sifre{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .sifre_tekrari_yazi{
            position : absolute;
            left : 20px;
            top : 100px;
        }
        .sifre_tekrar{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 100px;
            top : -10px;
        }
        .kaydet2{
            position : absolute;
            width : 100px;
            height: 40px;
            left : 425px;
            top : 150px;
        }
        .geri{
            position : absolute;
            width : 200px;
            height: 75px;
            left : 25px;
            top : 20px;
            font-size: 20px;
        }
        .sil{
            position : absolute;
            width : 150px;
            height: 40px;
            left : 35px;
            top : 435px;
            font-size: 20px;
        }
    </style>

    <body>
        <%
            vt_baglan v = new vt_baglan();
            String isim = request.getParameter("isim");
            String eski_sifre = request.getParameter("eski_sifre");
            String sifre = request.getParameter("sifre");
            String telefon_no = request.getParameter("telefon_no");
            String posta = request.getParameter("posta");
            if (isim != null) {
                v.guncelle(isim, posta, telefon_no, sesion.getTc());
                sesion.setIsim(isim);
        %>
    <div class = "yazi3" id="yazi3">veriler güncellendi</div>
    <%
        }
        if (eski_sifre != null && sifre != null) {
            v.sifre_kontrol(sesion.getTc());
            if (eski_sifre.equals(v.Sifre)) {
                v.sifre_guncelle(sifre, sesion.getTc());
    %>
    <div class = "yazi" id="yazi">şifre güncellendi</div>
    <%
    } else {
    %>
    <div class = "yazi" id="yazi">şifre hatalı</div>
    <%
            }
        }
    %>
    <%
        String email;
        String telefon;
        v.yaz(sesion.getTc());
        if (v.posta == null) {
            email = "";
        } else {
            email = v.posta;
        }
        if (v.tel == null) {
            telefon = "";
        } else {
            telefon = v.tel;
        }
    %>

    <div class = "form"><form action="ayarlar.jsp" method="post" id = "ayar_sayfasi1" class = "ayar_sayfasi1">
            <div class = "isim_yazi">Kullanıcı Adı: <input type="text" name="isim" id ="isim"  class ="isim" value ="<%= sesion.getIsim()%>" required></div>
            <div class = "telefon_no_yazi">telefon no: <input type="tel" name="telefon_no" id="telefon_no" class = "telefon_no" value ="<%=telefon%>" pattern="^\d{10}$" title ="telefon No formatına uygun olmalıdır ve 0 ile başlamamalıdır" required></div>
            <div class = "posta_yazi">e posta adresi: <input type="email" name="posta" id ="posta" class = "posta" value ="<%=email%>" pattern="^(?i)[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title ="mail formatına uygun olmalıdır"></div>
            <input type="submit" value="Kaydet" class = "kaydet1" onclick="butonaTiklandi1()" >
        </form>
        <form action="ayarlar.jsp" method="post" id = "ayar_sayfasi2" class ="ayar_sayfasi2">
            <div class = "eski_sifre_yazi">eski şifre: <input type="password" name="eski_sifre" id="eski_sifre" class = "eski_sifre" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
            <div class = "sifre_yazi">Şifre: <input type="password" name="sifre" id="sifre" class = "sifre" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
            <div class = "sifre_tekrari_yazi">Şifre Tekrar: <input type="password" name="sifre_tekrar" id ="sifre_tekrar" class = "sifre_tekrar" class ="sifre" pattern=".{6,}" title="en az 6 karakter içermelidir" required></div>
            <input type="submit" value="Kaydet" class = "kaydet2" onclick="butonaTiklandi2()" >
        </form>
        <form action="cikis_ara_sayfa.jsp"  method="post" id="myform2">
            <input id ="silme" type="hidden" name="silme">
        </form>
        <button id ="sil" class ="sil" onclick="sil()">Hesabı Sil</button>
        <div class ="yazi2" id="yazi2"></div></div>
    <button id ="geri" class ="geri" onclick="geri()">geri dön</button>
    <script>
        function sil() {
            var onayKutusu = document.createElement("div");
            onayKutusu.style.position = "absolute";
            onayKutusu.style.top = "525px";
            onayKutusu.style.left = "550px";
            onayKutusu.style.backgroundColor = "white";
            onayKutusu.style.border = "1px solid #ccc";
            onayKutusu.style.padding = "20px";
            onayKutusu.innerHTML = "Hesabı silmek istiyormusun?<br><br>";
            var evetButton = document.createElement("button");
            evetButton.innerHTML = "Evet";
            evetButton.onclick = function () {
                document.getElementById("silme").value = "sil";
                document.getElementById("myform2").submit();
                onayKutusu.remove();
            };
            var hayirButton = document.createElement("button");
            hayirButton.innerHTML = "Hayır";
            hayirButton.onclick = function () {
                onayKutusu.remove();
            };
            onayKutusu.appendChild(evetButton);
            onayKutusu.appendChild(hayirButton);
            document.body.appendChild(onayKutusu);
        }

    </script>
    <script>
        document.getElementById("ayar_sayfasi2").addEventListener("submit", function (event) {
            var sifre = document.getElementById("sifre").value;
            var sifre_tekrar = document.getElementById("sifre_tekrar").value;
            if (sifre != sifre_tekrar) {
                yazi2.textContent = "şifreler uyuşmuyor";
                document.getElementById("ayar_sayfasi2").reset();
                event.preventDefault();
             }
        });
        function geri() {
            window.location.href = "geri_ara_sayfa.jsp";
        }
    </script>
</body>
</html>