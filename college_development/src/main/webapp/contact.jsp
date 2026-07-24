<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact - College Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial, Helvetica, sans-serif;
    background:
    radial-gradient(circle at top right, rgba(255,255,255,0.06), transparent 35%),
    radial-gradient(circle at bottom left, rgba(255,170,100,0.08), transparent 30%),
    linear-gradient(135deg,#091225,#101d3d,#182a52);
    color:white;
    min-height:100vh;
}

body::before{
    content:"";
    position:fixed;
    top:15px;
    left:15px;
    right:15px;
    bottom:15px;
    border:1px solid rgba(201,159,78,.35);
    pointer-events:none;
}

.navbar{
    display:flex;
    justify-content:flex-end;
    align-items:center;
    padding:22px 55px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
    border-bottom:1px solid rgba(255,255,255,.15);
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:35px;
    font-size:17px;
    font-weight:bold;
    transition:.3s;
}

.navbar a:hover{
    color:#c99f4e;
}

.active{
    color:#c99f4e !important;
}

.banner{
    text-align:center;
    padding:70px 30px 40px;
}

.banner h1{
    font-size:46px;
    margin-bottom:20px;
}

.line{
    width:90px;
    height:3px;
    background:#c99f4e;
    margin:20px auto;
}

.banner p{
    max-width:850px;
    margin:auto;
    color:#dddddd;
    line-height:1.8;
    font-size:17px;
}

.container{
    width:85%;
    max-width:1000px;
    margin:auto;
    padding-bottom:60px;
}

.contact-wrap{
    display:grid;
    grid-template-columns:1.2fr 1fr;
    gap:30px;
    margin-top:20px;
}

.card{
    background:rgba(255,255,255,.05);
    border:1px solid rgba(201,159,78,.30);
    padding:30px;
    border-radius:8px;
    transition:.3s;
}

.card:hover{
    border-color:#c99f4e;
}

.card h2{
    color:#c99f4e;
    margin-bottom:20px;
    border-left:5px solid #c99f4e;
    padding-left:12px;
}

.input-box{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid rgba(201,159,78,.30);
    border-radius:5px;
    font-size:15px;
    box-sizing:border-box;
    background:rgba(255,255,255,.06);
    color:white;
}

.input-box::placeholder,
textarea::placeholder{
    color:#bbbbbb;
}

textarea{
    width:100%;
    height:120px;
    padding:12px;
    margin:10px 0;
    border:1px solid rgba(201,159,78,.30);
    border-radius:5px;
    resize:none;
    font-size:15px;
    box-sizing:border-box;
    background:rgba(255,255,255,.06);
    color:white;
    font-family:inherit;
}

.input-box:focus,
textarea:focus{
    outline:none;
    border-color:#c99f4e;
}

.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:5px;
    background:#c99f4e;
    color:#101d3d;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
    margin-top:6px;
}

.btn:hover{
    background:#e4cd82;
}

.info p{
    color:#d7d7d7;
    line-height:2.1;
    font-size:15.5px;
}

.info b{
    color:#c99f4e;
}

.note{
    margin-top:22px;
    padding:12px;
    background:rgba(255,255,255,0.08);
    border-radius:5px;
    color:#FFD966;
    font-size:13.5px;
    line-height:1.6;
    border:1px solid rgba(201,159,78,.25);
}

footer{
    margin-top:60px;
    background:rgba(0,0,0,.30);
    text-align:center;
    padding:25px;
    color:#cccccc;
    letter-spacing:1px;
}

@media (max-width:800px){
    .contact-wrap{
        grid-template-columns:1fr;
    }
}

</style>

</head>

<body>

<div class="navbar">
<a href="welcome.jsp">Welcome</a>
<a href="home.jsp">Home</a>
<a href="about.jsp">About</a>
<a href="contact.jsp" class="active">Contact</a>
<a href="login.jsp">Login</a>
<a href="retrieve'jsp.jsp">Retrieve</a>
</div>

<div class="banner">
<h1>Contact Us</h1>
<div class="line"></div>
<p>
Have a question or need assistance? Reach out to us using the form below,
or use the details provided alongside it. Our team will get back to you
as soon as possible.
</p>
</div>

<div class="container">

<div class="contact-wrap">

<div class="card">
<h2>Send a Message</h2>
<form action="#" method="post">
    <input type="text" class="input-box" name="name" placeholder="Enter Your Name" required>
    <input type="email" class="input-box" name="email" placeholder="Enter Your Email" required>
    <input type="text" class="input-box" name="subject" placeholder="Enter Subject" required>
    <textarea name="message" placeholder="Enter Your Message" required></textarea>
    <button type="submit" class="btn">Send Message</button>
</form>
</div>

<div class="card">
<h2>Reach Us</h2>
<div class="info">
    <p><b>College :</b> BBD College</p>
    <p><b>Address :</b> Faizabad Road, Lucknow, Uttar Pradesh - 226028</p>
    <p><b>Email :</b> info@bbdcollege.com</p>
    <p><b>Phone :</b> +91-522-3911100</p>
    <p><b>Website :</b> www.bbdcollege.com</p>
</div>
<div class="note">
    Note: The contact information shown above (address, email, phone, and website)
    is for demonstration purposes only in this academic project and does not
    represent the official contact details of BBD College.
</div>
</div>

</div>

</div>

<footer>
© 2026 College Management System | All Rights Reserved
</footer>

</body>
</html>