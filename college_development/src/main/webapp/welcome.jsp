<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Management</title>
<style>
html, body{
    height:100%;
    width:100%;
    margin:0;
    padding:0;
    font-family:Georgia, "Times New Roman", serif;
}
body{
    background-image:url("bbd_image.jpg");
    background-repeat:no-repeat;
    background-position:center center;
    background-size:cover;
    background-attachment:fixed;
}
.overlay{
    min-height:100vh;
    background:linear-gradient(
        180deg,
        rgba(11,20,40,0.75) 0%,
        rgba(11,20,40,0.35) 35%,
        rgba(11,20,40,0.75) 100%
    );
}
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 40px;
    background:rgba(255,255,255,0.1);
    backdrop-filter:blur(10px);
    -webkit-backdrop-filter:blur(10px);
    border-bottom:1px solid rgba(255,255,255,0.2);
}
.clock{
    font-family:"Courier New", monospace;
    font-size:13px;
    color:rgba(255,255,255,0.8);
    letter-spacing:1px;
}
.links a{
    color:white;
    text-decoration:none;
    margin-left:32px;
    font-size:15px;
    font-weight:bold;
    padding-bottom:4px;
    border-bottom:1px solid transparent;
    transition:.3s;
}
.links a:hover{
    color:#E4CD82;
    border-bottom:1px solid #C9A227;
}
.hero-title{
    text-align:center;
    margin-top:90px;
}
.hero-title h1{
    color:white;
    font-size:46px;
    margin:0;
    text-shadow:0 4px 18px rgba(0,0,0,0.5);
}
.rule{
    width:80px;
    height:2px;
    background:#C9A227;
    margin:18px auto;
}
</style>
</head>
<body>
<div class="overlay">
    <div class="navbar">
        <span class="clock" id="clock"></span>
        <div class="links">
            <a href="home.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp">Contact</a>
            <a href="login.jsp">Login</a>
            <a href="retrieve.jsp">Retrieve</a>
        </div>
    </div>
    <div class="hero-title">
        <h1>College Management</h1>
        <div class="rule"></div>
    </div>
</div>
<script>
function updateClock(){
    var now = new Date();
    var days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
    var months = ["Jan","Feb","Mar","Apr","May","Jun",
                  "Jul","Aug","Sep","Oct","Nov","Dec"];
    var day = days[now.getDay()];
    var date = String(now.getDate()).padStart(2,'0');
    var month = months[now.getMonth()];
    var year = now.getFullYear();
    var hour = now.getHours();
    var ampm = hour >= 12 ? "PM" : "AM";
    hour = hour % 12;
    if(hour == 0){
        hour = 12;
    }
    var minute = String(now.getMinutes()).padStart(2,'0');
    var second = String(now.getSeconds()).padStart(2,'0');
    var time =
        day + " " +
        date + " " +
        month + " " +
        year + "  " +
        hour + ":" +
        minute + ":" +
        second + " " +
        ampm;
    document.getElementById("clock").innerHTML = time;
}
updateClock();
setInterval(updateClock,1000);
</script>
</body>
</html>