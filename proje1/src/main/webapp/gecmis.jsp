<%-- 
    Document   : gecmis
    Created on : 28 Kas 2023, 21:16:26
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
    <title>Geçmiş</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <style>
        table{
            position : absolute;
            width : 800px;
            height:300px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 20px;
            overflow-x: hidden;
            overflow-y: scroll;
            text-align: center;
            border-collapse: collapse;
        }
        table,th,td{
            border: 1px solid black;
        }
        caption{
            position : relative;
            top: -480px;
            left: 50%;
            font-size: 25px;
        }
        .cikis{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 1100px;
            top : 20px;
            font-size: 20px;
        }
        .ayarlar{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 1100px;
            top : 100px;
            font-size: 20px;
        }
        .yaz{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 80px;
            top : 20px;
            font-size: 35px;
        }
        .yeni{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 40px;
            top : 100px;
            font-size: 20px;
        }
    </style>
    <body>
        <button id ="ayarlar" class ="ayarlar" onclick="ayarlar()">ayarlar</button>
        <button id ="cikis" class ="cikis" onclick="cik()">çıkış yap</button>
        <button id ="yeni" class ="yeni" onclick="ileri()">geri dön</button>
    <div class = "yaz"><%= sesion.getIsim()%></div>
    <%
        vt_baglan v = new vt_baglan();
        v.eski_yazdir(sesion.Bugun2, sesion.Bugun_saat2);
    %>
    <table>
        <caption> Geçmiş Randevular </caption>
        <tr><td>id</td><td>TC</td><td>isim</td><td>E-Mail</td><td>telefon NO</td><td>tarih</td><td>saat</td></tr>
        <%
            for (int i = 0; i < v.yazi.size() / 7; i++) {
        %>
        <tr>
            <%
                for (int k = 0; k < 7; k++) {
            %>
            <td><%= v.yazi.get(i * 7 + k)%></td>
            <%
                }
            %>
        </tr>
        <%
            }
        %>
    </table>
    <script>
        function ayarlar() {
            window.location.href = "ayarlar.jsp";
        }
        function cik() {
            window.location.href = "cikis_ara_sayfa.jsp";
        }
        function ileri() {
            window.location.href = "yonetici.jsp";
        }
    </script>
</body>
</html>