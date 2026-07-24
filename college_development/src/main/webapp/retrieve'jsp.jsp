<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Data</title>
<style>
  html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    font-family: Georgia, 'Times New Roman', serif;
  }
  body {
    background-image: url('retrieve.jpg');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    background-attachment: fixed;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  form {
    display: flex;
    flex-direction: column;
    gap: 18px;
    padding: 40px 50px;
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    border: 1px solid rgba(255,255,255,0.3);
    border-radius: 14px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.35);
  }
  button {
    padding: 13px 40px;
    border: none;
    border-radius: 6px;
    background: #C9A227;
    color: #14213D;
    font-size: 15px;
    font-weight: bold;
    letter-spacing: .5px;
    cursor: pointer;
    transition: background .2s ease, transform .2s ease;
  }
  button:hover {
    background: #E4CD82;
    transform: translateY(-1px);
  }
</style>
</head>
<body>
<form action="retrieve" method="get">
  <button type="submit" name="table" value="sign">Student Display</button>
  <button type="submit" name="table" value="faculty">Faculty Display</button>
  <button type="submit" name="table" value="management">Management Display</button>
</form>
</body>
</html>