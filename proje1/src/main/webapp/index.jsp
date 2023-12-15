<%-- 
    Document   : newjsp
    Created on : 19 Eki 2023, 11:42:18
    Author     : USER2
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <title>Giriş ve Kayıt</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
    .kayit{
        position : absolute;
        width : 200px;
        height: 80px;
        left : 620px;
        top : 250px;
        font-size: 30px;
    }
    .giris{
        position : absolute;
        width : 200px;
        height: 80px;
        left : 620px;
        top : 400px;
        font-size: 30px;
    }
</style>
<body>
    <button class ="giris" id ="giris" onclick="giris()">giriş yap</button>
    <button class ="kayit" id ="kayit" onclick="kayit()">kayit ol</button>
<script>
    function giris() {
        window.location.href = "giris.jsp";
    }
    function kayit() {
        window.location.href = "kayit.jsp";
    }
</script>
</body>
</html>