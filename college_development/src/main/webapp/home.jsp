<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Management System - Home</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial,Helvetica,sans-serif;
    color:#fff;
    background:linear-gradient(135deg,#091225,#101d3d,#182a52);
    line-height:1.7;
}

.navbar{
    width:100%;
    display:flex;
    justify-content:flex-end;
    background:rgba(255,255,255,.08);
    padding:20px 50px;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:30px;
    font-weight:bold;
    transition:.3s;
}

.navbar a:hover,
.active{
    color:#f4c542;
}

.hero{
    text-align:center;
    padding:80px 20px;
}

.hero h1{
    font-size:45px;
    color:#f4c542;
}

.hero p{
    width:80%;
    margin:auto;
    margin-top:20px;
    font-size:18px;
    color:#ddd;
}

.container{
    width:90%;
    margin:auto;
    padding:50px 0;
}

.section-title{
    text-align:center;
    color:#f4c542;
    font-size:35px;
    margin-bottom:30px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.card{
    background:rgba(255,255,255,.07);
    border:1px solid rgba(255,255,255,.15);
    border-radius:10px;
    padding:25px;
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
    background:rgba(255,255,255,.12);
}

.card h3{
    color:#f4c542;
    margin-bottom:10px;
}

.about{
    background:rgba(255,255,255,.06);
    padding:50px;
    border-radius:10px;
    margin-top:50px;
}

.about h2{
    color:#f4c542;
    text-align:center;
    margin-bottom:20px;
}

.about p{
    text-align:justify;
    color:#ddd;
    font-size:17px;
}

.vision{
    margin-top:50px;
    background:rgba(255,255,255,.06);
    padding:40px;
    border-radius:10px;
    text-align:center;
}

.vision h2{
    color:#f4c542;
    margin-bottom:15px;
}

footer{
    margin-top:50px;
    background:#000;
    text-align:center;
    padding:20px;
    color:white;
}
</style>

</head>

<body>

<div class="navbar">
    <a href="welcome.jsp">Welcome</a>
    <a href="home.jsp" class="active">Home</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
    <a href="login.jsp">Login</a>
    <a href="retrieve.jsp">Retrieve</a>
</div>

<div class="hero">
    <h1>Welcome to College Management System</h1>

    <p>
        Our College Management System is an advanced web-based application
        designed to simplify academic administration. It provides students,
        faculty, and administrators with an efficient and secure platform
        for managing all college activities.
    </p>
</div>

<div class="container">

    <h2 class="section-title">Our Services</h2>

    <div class="grid">

        <div class="card">
            <h3>Student Registration</h3>
            <p>Register new students quickly with complete personal and academic details.</p>
        </div>

        <div class="card">
            <h3>Student Records</h3>
            <p>Maintain complete student information securely in one place.</p>
        </div>

        <div class="card">
            <h3>Faculty Management</h3>
            <p>Manage faculty information, departments and responsibilities.</p>
        </div>

        <div class="card">
            <h3>Course Management</h3>
            <p>Create, update and organize courses offered by the college.</p>
        </div>

        <div class="card">
            <h3>Attendance</h3>
            <p>Track and monitor student attendance with accuracy.</p>
        </div>

        <div class="card">
            <h3>Result Management</h3>
            <p>Store and publish examination marks and student results.</p>
        </div>

        <div class="card">
            <h3>Fee Management</h3>
            <p>Maintain fee records and payment status of every student.</p>
        </div>

        <div class="card">
            <h3>Data Retrieval</h3>
            <p>Search and retrieve student records instantly whenever required.</p>
        </div>

    </div>

    <div class="about">

        <h2>About Our College Management System</h2>

        <p>
            The College Management System is developed to automate and
            simplify the day-to-day activities of educational institutions.
            It minimizes paperwork, improves communication between students,
            faculty and administration, and provides a secure environment
            for storing academic records.

            The system enables efficient student registration, faculty
            management, attendance tracking, examination management,
            result generation and fee management while ensuring
            fast access to information whenever needed.
        </p>

    </div>

    <div class="vision">

        <h2>Our Vision</h2>

        <p>
            To provide a modern, secure and efficient digital platform that
            enhances the quality of education through technology and makes
            academic management simple, transparent and accessible.
        </p>

    </div>

</div>

<footer>
    © 2026 GreenView College Management System | All Rights Reserved
</footer>

</body>
</html>