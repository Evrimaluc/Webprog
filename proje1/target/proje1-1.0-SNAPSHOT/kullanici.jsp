<%-- 
    Document   : mehmet
    Created on : 20 Eki 2023, 11:10:18
    Author     : USER2
--%>

<%@page import="java.sql.Time"%>
<%@page import="proje.vt_baglan"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.sql.Time"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Üye</title>
    </head>
    <style>
        #azalt{
            position : absolute;
            left : 280px;
            top : 40px;
            width : 100px;
            height: 50px;
            font-size: 20px;
        }
        #arttir{
            position : absolute;
            left : 900px;
            top : 40px;
            width : 100px;
            height: 50px;
            font-size: 20px;
        }
        #takvim{
            position : absolute;
            left : 400px;
            top : 40px;
            width : 480px;
            height: 50px;
            text-align: center;
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
        <%
            String[] ayadlari = {"Ocak", "Şubat", "Mart", "Nisan",
                "Mayıs", "Haziran", "Temmuz",
                "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"};
            String[] gunadlari = {"Pazar", "Pazartesi", "Salı", "Çarşamba",
                "Perşembe", "Cuma", "Cumartesi"};
            vt_baglan v = new vt_baglan();
            v.getir(sesion.getBirgun());
            String renk;
            Time Time = new Time(7 * 3600 * 1000 + 0 * 60 * 1000);
            Time Times = new Time(15 * 3600 * 1000 + 30 * 60 * 1000);
            Time Time2 = new Time(11 * 3600 * 1000 + 0 * 60 * 1000);
            if (sesion.Bugun.isEqual(sesion.getBirgun().toLocalDate())) {
                renk = "O";
            } else {
                renk = "W";
            }
            for (int i = 0; i < v.saatler.size(); i++) {
                if (Time.equals(Time2)) {
                    Time = new Time(Time.getTime() + 60 * 60 * 1000);
                }
                if (v.saatler.get(i).equals(Time)) {
                    if (v.TCler.get(i).equals(sesion.getTc())) {
                        if (v.Onaylar.get(i).equals("onaylandı")) {
                            renk = renk + ",P";
                        } else {
                            renk = renk + ",Y";
                        }
                    } else {
                        if (v.Onaylar.get(i).equals("onaylandı")) {
                            renk = renk + ",B";
                        } else {
                            renk = renk + ",R";
                        }
                    }
                } else {
                    renk = renk + ",G";
                    i = i - 1;
                }
                Time = new Time(Time.getTime() + 30 * 60 * 1000);
            }
            Time = new Time(Time.getTime() - 30 * 60 * 1000);
            while (!Times.equals(Time)) {
                if (Time.equals(Time2)) {
                    Time = new Time(Time.getTime() + 60 * 60 * 1000);
                }
                renk = renk + ",G";
                Time = new Time(Time.getTime() + 30 * 60 * 1000);
            }
            if (sesion.getBirgun().getDay() == 0) {
                sesion.setBirgun(new Date(sesion.getBirgun().getTime() + 24 * 60 * 60 * 1000));
            }
        %>
        <h1 id="takvim"><%=sesion.getBirgun().getDate() + " " + ayadlari[sesion.getBirgun().getMonth()] + " " + (sesion.getBirgun().getYear() + 1900) + " " + gunadlari[sesion.getBirgun().getDay()]%></h1>
        <button id ="azalt" onclick="azalt()">geri</button>
        <button id ="arttir" onclick="arttir()">ileri</button>
        <button id ="ayarlar" class ="ayarlar" onclick="ayarlar()">ayarlar</button>
        <button id ="cikis" class ="cikis" onclick="cik()">çıkış yap</button>
    <div class = "yaz"><%= sesion.getIsim()%></div>
    <form action="randavu_ara_sayfa.jsp"  method="post" id="myform">
        <input id ="saatler" type="hidden" name="saatler">
            <input id ="secim" type="hidden" name="secim">
                </form>
                <form action="randevu_al.jsp"  method="post" id="myform3">
                    <input id ="saatler3" type="hidden" name="saatler3">
                        <input id ="secim3" type="hidden" name="secim3">
                            </form>
                            <form action="git_ara_sayfa.jsp"  method="post" id="myform2">
                                <input id = "git" type="hidden" name="git">
                            </form>
                            <input id = "renk" type="hidden" name="renk" value = <%=renk%>>
                                <h1 id = "x"></h1>
                                <input id = "tarih" type="hidden" name="tarih" value = <%=sesion.getBirgun()%>>
                                    <input id = "tur" type="hidden" name="tur" value = <%=sesion.getTur()%>>
                                        <script>
                                            var renk = document.getElementById("renk").value;
                                            var renkler = renk.split(",");
                                            var tarih = document.getElementById("tarih").value;
                                            var tur = document.getElementById("tur").value;
                                            const simdi = new Date();
                                            function azalt() {
                                                document.getElementById("git").value = "azalt";
                                                document.getElementById("myform2").submit();
                                            }
                                            function arttir() {
                                                document.getElementById("git").value = "arttır";
                                                document.getElementById("myform2").submit();
                                            }
                                            const zaman = new Date();
                                            zaman.setHours(09);
                                            zaman.setMinutes(00);
                                            k = 0;
                                            if (renkler[0] === "O")
                                            {
                                                document.getElementById("takvim").style.backgroundColor = "orange";
                                            }
                                            for (let i = 0; i < 16; i++)
                                            {
                                                var ilerlemiszaman = new Date();
                                                ilerlemiszaman.setHours(zaman.getHours());
                                                ilerlemiszaman.setMinutes(zaman.getMinutes() + k);
                                                if (ilerlemiszaman.getHours() == 13)
                                                {
                                                    var ilerlemiszaman = new Date();
                                                    k = k + 60;
                                                    ilerlemiszaman.setHours(zaman.getHours());
                                                    ilerlemiszaman.setMinutes(zaman.getMinutes() + k);
                                                }
                                                const Mybutton = document.createElement("button");
                                                var saat = ilerlemiszaman.getHours();
                                                var dakika = ilerlemiszaman.getMinutes();
                                                if (saat < 10)
                                                {
                                                    saat = "0" + saat;
                                                }
                                                if (dakika < 10)
                                                {
                                                    dakika = "0" + dakika;
                                                }
                                                Mybutton.id = "button" + i;
                                                Mybutton.textContent = saat + ":" + dakika;
                                                var yan = i % 4;
                                                var alt = Math.floor(i / 4);
                                                Mybutton.style.width = "100px";
                                                Mybutton.style.height = "40px";
                                                document.body.appendChild(Mybutton);
                                                Mybutton.addEventListener("click", function () {
                                                    const hedefZaman = new Date(tarih + "T" + Mybutton.textContent + ":" + "00");
                                                    if (simdi < hedefZaman)
                                                    {
                                                        if (Mybutton.style.backgroundColor === "red" || Mybutton.style.backgroundColor === "blue")
                                                        {
                                                            alert("bu saate randavu zaten alındı");
                                                        } else
                                                        {
                                                            var onayKutusu = document.createElement("div");
                                                            onayKutusu.style.position = "absolute";
                                                            onayKutusu.style.top = "50%";
                                                            onayKutusu.style.left = "50%";
                                                            onayKutusu.style.transform = "translate(-50%, -50%)";
                                                            onayKutusu.style.backgroundColor = "white";
                                                            onayKutusu.style.border = "1px solid #ccc";
                                                            onayKutusu.style.padding = "20px";
                                                            if (Mybutton.style.backgroundColor === "green")
                                                            {
                                                                onayKutusu.innerHTML = "Randavu almak istiyormusun?<br><br>";
                                                            } else
                                                            {
                                                                onayKutusu.innerHTML = "Randavuyu silmek istiyormusun?<br><br>";
                                                            }
                                                            var evetButton = document.createElement("button");
                                                            evetButton.innerHTML = "Evet";
                                                            evetButton.onclick = function () {
                                                                if (tur === "Yönetici")
                                                                {
                                                                    document.getElementById("saatler3").value = document.getElementById(Mybutton.id).textContent;
                                                                    document.getElementById("secim3").value = Mybutton.style.backgroundColor;
                                                                    document.getElementById("myform3").submit();
                                                                } else
                                                                {
                                                                    document.getElementById("saatler").value = document.getElementById(Mybutton.id).textContent;
                                                                    document.getElementById("secim").value = Mybutton.style.backgroundColor;
                                                                    document.getElementById("myform").submit();
                                                                }
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
                                                    }
                                                });
                                                k = k + 30;
                                                const clickedButton = document.getElementById(Mybutton.id);
                                                if (clickedButton) {
                                                    clickedButton.style.backgroundColor = "green";
                                                    clickedButton.style.color = "white";
                                                    clickedButton.style.position = "absolute";
                                                    clickedButton.style.left = (290 + 200 * yan).toString() + "px";
                                                    clickedButton.style.top = (150 + 100 * alt).toString() + "px";
                                                    clickedButton.style.fontSize = "20px";
                                                    if (renkler[i + 1] === "R")
                                                    {
                                                        clickedButton.style.backgroundColor = "red";
                                                    }
                                                    if (renkler[i + 1] === "Y")
                                                    {
                                                        clickedButton.style.backgroundColor = "yellow";
                                                    }
                                                    if (renkler[i + 1] === "B")
                                                    {
                                                        clickedButton.style.backgroundColor = "blue";
                                                    }
                                                    if (renkler[i + 1] === "P")
                                                    {
                                                        clickedButton.style.backgroundColor = "pink";
                                                    }
                                                        }
                                            }
                                            function ayarlar() {
                                                window.location.href = "ayarlar.jsp";
                                            }
                                            function cik() {
                                                window.location.href = "cikis_ara_sayfa.jsp";
                                            }
                                        </script>
                                        <%
                                            if (sesion.getTur().equals("Yönetici")) {
                                        %>
                                        <button id ="yeni" class ="yeni" onclick="ileri()">geri dön</button>
                                        <%
                                            }
                                        %>
                                        <script>
                                            function ileri() {
                                                window.location.href = "yonetici.jsp";
                                            }
                                        </script>
                                        </body>
                                        </html>