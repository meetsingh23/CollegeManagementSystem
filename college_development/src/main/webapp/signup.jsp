<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUP Application</title>
<style>
  html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
  }
  body {
    background-image: url('signup.jpeg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    background-attachment: fixed;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: Georgia, serif;
  }
  input[type="submit"], input[type="reset"] {
    padding: 11px 32px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: bold;
    letter-spacing: .5px;
    cursor: pointer;
    transition: background .2s ease, transform .2s ease;
  }
  input[type="submit"] {
    border: none;
    background: #C9A227;
    color: #14213D;
  }
  input[type="submit"]:hover {
    background: #E4CD82;
    transform: translateY(-1px);
  }
  input[type="reset"] {
    border: 1px solid rgba(255,255,255,0.4);
    background: rgba(255,255,255,0.08);
    color: white;
  }
  input[type="reset"]:hover {
    background: rgba(255,255,255,0.18);
    transform: translateY(-1px);
  }
</style>
</head>
<body>
<div style="
  width:fit-content;
  border:1px solid rgba(255,255,255,0.3);
  padding:30px;
  text-align:center;
  background:rgba(255,255,255,0.12);
  backdrop-filter:blur(12px);
  -webkit-backdrop-filter:blur(12px);
  border-radius:12px;
  color:white;
">
  <h1>SignUP Application</h1>
  <br><br>
  <form action="studentsignapplication" method="get">
    <b>First Name</b>
    <input type="text" name="a">
    <br><br>
    <b>Last Name</b>
    <input type="text" name="b">
    <br><br>
    <b>New Email ID</b>
    <input type="email" name="c">
    <br><br>
    <b>Password</b>
    <input type="password" name="d">
    <br><br>
    <b>Date of Birth</b>
    <input type="date" name="dob">
    <br><br>
    <div style="display:flex; gap:14px; justify-content:center;">
      <input type="submit" value="Submit">
      <input type="reset" value="Cancel">
    </div>
  </form>
</div>
</body>
</html>