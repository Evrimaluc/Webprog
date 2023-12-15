<%-- 
    Document   : onay
    Created on : 3 Ara 2023, 14:01:59
    Author     : USER
--%>

<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<%@page import="proje.vt_baglan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>onay</title>
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
    v.onay_yazdir(sesion.Bugun2, sesion.Bugun_saat2);
%>
<table>
    <caption> Onay Durumu </caption>
    <tr><td>id</td><td>TC</td><td>isim</td><td>E-Mail</td><td>telefon NO</td><td>tarih</td><td>saat</td><td>onaylanmadı</td><td>onaylandı</td></tr>
    <%
        int i;
        for (i = 0; i < v.yazi.size() / 7; i++) {
    %>
    <tr>
        <%
            for (int k = 0; k < 7; k++) {
        %>
        <td><%= v.yazi.get(i * 7 + k)%></td>
        <%
            }
        %>
        <td><button id = <%= 2 * i + 1%>  onclick="onaylama()">onaylanmadı</button></td>
        <td><button id = <%= 2 * i + 2%>  onclick="onayla()">onaylandı</button></td></tr>
        <%
            }
        %>
</table>
<input id = "satır_sayısı" type="hidden" name="satır_sayısı" value=<%=i%>>
    <form action="onay_ara_sayfa.jsp"  method="post" id="onay_form">
        <input id = "onay_index" type="hidden" name="onay_index">
    </form>
    <script>
        for (let i = 0; i < document.getElementById("satır_sayısı").value; i++)
        {
            const clickedButton = document.getElementById(2 * i + 1);
            clickedButton.style.width = "100px";
            clickedButton.style.height = "50px";
            clickedButton.style.fontSize = "15px";
            clickedButton.addEventListener("click", function () {
                var onayKutusu = document.createElement("div");
                onayKutusu.style.position = "absolute";
                onayKutusu.style.top = "50%";
                onayKutusu.style.left = "50%";
                onayKutusu.style.transform = "translate(-50%, -50%)";
                onayKutusu.style.backgroundColor = "white";
                onayKutusu.style.border = "1px solid #ccc";
                onayKutusu.style.padding = "20px";
                onayKutusu.innerHTML = "Randevuyu reddetmek istiyormusun<br><br>";
                var evetButton = document.createElement("button");
                evetButton.innerHTML = "Evet";
                evetButton.onclick = function () {
                    document.getElementById("onay_index").value = clickedButton.id;
                    document.getElementById("onay_form").submit();
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
            });
            const clickedButton2 = document.getElementById(2 * i + 2);
            clickedButton2.style.width = "100px";
            clickedButton2.style.height = "50px";
            clickedButton2.style.fontSize = "15px";
            clickedButton2.addEventListener("click", function () {
                var onayKutusu = document.createElement("div");
                onayKutusu.style.position = "absolute";
                onayKutusu.style.top = "50%";
                onayKutusu.style.left = "50%";
                onayKutusu.style.transform = "translate(-50%, -50%)";
                onayKutusu.style.backgroundColor = "white";
                onayKutusu.style.border = "1px solid #ccc";
                onayKutusu.style.padding = "20px";
                onayKutusu.innerHTML = "Randevuyu onaylamak istiyormusun<br><br>";
                var evetButton = document.createElement("button");
                evetButton.innerHTML = "Evet";
                evetButton.onclick = function () {
                    document.getElementById("onay_index").value = clickedButton2.id;
                    document.getElementById("onay_form").submit();
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
            });
        }
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