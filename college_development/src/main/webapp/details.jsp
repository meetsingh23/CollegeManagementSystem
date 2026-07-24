<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Info</title>
<style>
html,body{
    height:100%;
    width:100%;
    margin:0;
    padding:0;
}
body{
    background-image:url("login.jpeg");
    background-repeat:no-repeat;
    background-position:center;
    background-size:cover;
    background-attachment:fixed;
    font-family:Georgia,serif;
}
.navbar{
    display:flex;
    justify-content:flex-end;
    align-items:center;
    padding:20px 40px;
    background:rgba(0,0,0,.35);
    backdrop-filter:blur(10px);
}
.navbar a{
    color:white;
    text-decoration:none;
    margin-left:30px;
    font-size:16px;
    font-weight:bold;
    transition:.3s;
}
.navbar a:hover{
    color:#E4CD82;
}
.active{
    color:#E4CD82;
}
</style>
</head>
<body>
<div class="navbar">
    <a href="welcome.jsp">Welcome</a>
    <a href="home.jsp">Home</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
    <a href="login.jsp" class="active">Login</a>
    <a href="retrieve.jsp">Retrieve</a>
</div>
<%@ include file="nav.jsp" %>
</body>
</html>