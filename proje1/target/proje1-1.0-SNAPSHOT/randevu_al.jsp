<%-- 
    Document   : randevu_al
    Created on : 4 Ara 2023, 14:41:16
    Author     : USER
--%>

<jsp:useBean id="sesion" class="proje.sesion" scope="session"/>
<%@page import="proje.sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            height: 310px;
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
        .telefon_no_yazi{
            position : absolute;
            left : 60px;
            top : 140px;
        }
        .telefon_no{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .posta_yazi{
            position : absolute;
            left : 60px;
            top : 190px;
        }
        .posta{
            position : absolute;
            width : 400px;
            height: 30px;
            left : 120px;
            top : 0px;
        }
        .randevu{
            position : absolute;
            width : 100px;
            height: 40px;
            left : 480px;
            top : 235px;
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
        .geri{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 40px;
            top : 100px;
            font-size: 20px;
        }
        .yeni{
            position : absolute;
            width : 150px;
            height: 50px;
            left : 40px;
            top : 180px;
            font-size: 20px;
        }
    </style>
    <body>
        <button id ="ayarlar" class ="ayarlar" onclick="ayarlar()">ayarlar</button>
        <button id ="cikis" class ="cikis" onclick="cik()">çıkış yap</button>
        <button id ="geri" class ="geri" onclick="geri()">geri dön</button>
        <button id ="yeni" class ="yeni" onclick="ileri()">vazgeç</button>
    <div class = "yaz"><%= sesion.getIsim()%></div>

    <div class = "form"><form action="randavu_ara_sayfa.jsp"  method="post">
            <div class = "tc_yazi">TC Kimlik NO:  <input type="text" name="tc" class ="tc" pattern="^\d{11}$" title ="TC kimlik formatına uygun olmalıdır" required></div>
            <div class = "isim_yazi">Kullanıcı Adı: <input type="text" name="isim" class ="isim" required></div>
            <div class = "telefon_no_yazi">telefon no: <input type="tel" name="telefon_no" id="telefon_no" class = "telefon_no"  pattern="^\d{10}$" title ="telefon No formatına uygun olmalıdır ve 0 ile başlamamalıdır" required></div>
            <div class = "posta_yazi">e posta adresi: <input type="email" name="posta" id ="posta" class = "posta" pattern="^(?i)[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title ="mail formatına uygun olmalıdır"></div>
            <input id ="saatler2" type="hidden" name="saatler2" value = <%=request.getParameter("saatler3")%>>
                <input id ="secim2" type="hidden" name="secim2" value = "<%=request.getParameter("secim3")%>">
                    <input type="submit" value="Randevu al" class = "randevu" name = "Giris">
                        </form></div>
                        <script>
                            function ayarlar() {
                                window.location.href = "ayarlar.jsp";
                            }
                            function cik() {
                                window.location.href = "cikis_ara_sayfa.jsp";
                            }
                            function geri() {
                                window.location.href = "kullanici.jsp";
                            }
                            function ileri() {
                                window.location.href = "yonetici.jsp";
                            }
                        </script>
                        </body>
                        </html>
