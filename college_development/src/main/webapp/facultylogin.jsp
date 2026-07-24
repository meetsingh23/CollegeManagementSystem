<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Login</title>
<style>
  html, body { height:100%; width:100%; margin:0; padding:0; }
  body {
    background-image: url('facultylogin.jpg');
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
<h1>Faculty Login</h1>
<form action="facultylogin" method="get">
<center>
<b>User ID</b>
<input type="text" name="a">
<br><br>
<b>Password</b>
<input type="password" name="b">
<br><br>
<div style="display:flex; gap:14px; justify-content:center;">
  <input type="submit" value="Submit">
  <input type="reset" value="Cancel">
</div>
<br><br>
<a href="faculty.jsp"><font color="white">SignUP</font></a>
</center>
</form>
</body>
</html>