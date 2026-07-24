<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<style>
  html, body { height:100%; width:100%; margin:0; padding:0; }
  body {
    background-image: url('studentlogin.jpeg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    background-attachment: fixed;
    text-align: center;
    color: white;
    font-family: Georgia, serif;
  }
</style>
</head>
<body>
<%@include file="nav.jsp" %>
<h1>Student Login</h1>
<form action="studentlogin" method="get">
<center>
<b>User ID</b>
<input type="text" name="a">
<br><br>
<b>Password</b>
<input type="password" name="b">
<br><br>
<input type="submit" name="Login">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="Cancel">&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<a href="signup.jsp"><font color="white">SignUP</font></a>
</center>
</form>
</body>
</html>