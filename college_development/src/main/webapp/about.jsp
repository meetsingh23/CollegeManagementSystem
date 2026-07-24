<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About - College Management System</title>

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
    margin:auto;
    padding-bottom:60px;
}

.section{
    margin-top:50px;
}

.section h2{
    color:#c99f4e;
    margin-bottom:20px;
    border-left:5px solid #c99f4e;
    padding-left:12px;
}

.section p{
    color:#dddddd;
    line-height:1.8;
    text-align:justify;
}

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
    margin-top:25px;
}

.card{
    background:rgba(255,255,255,.05);
    border:1px solid rgba(201,159,78,.30);
    padding:25px;
    border-radius:8px;
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
    border-color:#c99f4e;
}

.card h3{
    color:#c99f4e;
    margin-bottom:12px;
}

.card p{
    color:#d7d7d7;
}


.values{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin-top:25px;
}

.value-box{
    background:rgba(255,255,255,.05);
    border:1px solid rgba(201,159,78,.30);
    padding:22px;
    border-radius:8px;
}

.value-box h4{
    color:#c99f4e;
    margin-bottom:10px;
}

.value-box p{
    color:#d7d7d7;
}


footer{
    margin-top:60px;
    background:rgba(0,0,0,.30);
    text-align:center;
    padding:25px;
    color:#cccccc;
    letter-spacing:1px;
}

</style>

</head>

<body>


<div class="navbar">
<a href="welcome.jsp">Welcome</a>

<a href="home.jsp">Home</a>

<a href="about.jsp" class="active">About</a>

<a href="contact.jsp">Contact</a>

<a href="login.jsp">Login</a>

<a href="retrieve'jsp.jsp">Retrieve</a>

</div>

<div class="banner">

<h1>About College Management System</h1>

<div class="line"></div>

<p>
The College Management System is a modern web application developed to
simplify academic and administrative activities. It enables students,
faculty members, and administrators to manage records, attendance,
courses, examinations, and other college operations from a single,
secure platform.
</p>

</div>

<div class="container">

<div class="section">

<h2>Who We Are</h2>

<p>
Our College Management System helps educational institutions manage
their daily activities efficiently. It reduces paperwork by maintaining
student records, faculty details, attendance, examination results,
courses, and fee information digitally. The system is secure,
easy to use, and designed to improve communication across the college.
</p>

</div>

<div class="section">

<h2>Our Features</h2>

<div class="cards">

<div class="card">
<h3>Student Management</h3>
<p>
Manage student registration, profiles,
attendance, and academic records efficiently.
</p>
</div>

<div class="card">
<h3>Faculty Management</h3>
<p>
Maintain faculty details, departments,
subjects, and teaching schedules.
</p>
</div>

<div class="card">
<h3>Course Management</h3>
<p>
Manage departments, semesters,
subjects, and examination details.
</p>
</div>

<div class="card">
<h3>Secure Database</h3>
<p>
Store all student and faculty records
securely with quick data retrieval.
</p>
</div>

</div>

</div>

<div class="section">

<h2>Our Core Values</h2>

<div class="values">

<div class="value-box">
<h4>✔ Excellence</h4>
<p>Providing quality education with modern technology.</p>
</div>

<div class="value-box">
<h4>✔ Integrity</h4>
<p>Maintaining transparency and accountability in administration.</p>
</div>

<div class="value-box">
<h4>✔ Innovation</h4>
<p>Using smart digital solutions to improve education.</p>
</div>

<div class="value-box">
<h4>✔ Security</h4>
<p>Protecting all academic information with secure systems.</p>
</div>

</div>

</div>

<div class="section">

<h2>Our Mission</h2>

<p>
Our mission is to provide a secure, reliable, and user-friendly
digital platform where students, teachers, and administrators can
manage college activities efficiently while improving communication,
productivity, and academic excellence.
</p>

</div>

</div>

<footer>

© 2026 College Management System | All Rights Reserved

</footer>

</body>
</html>