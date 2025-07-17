<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Management System - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            min-height: 100vh;
            width: 100vw;
            overflow-x: hidden;
        }
        .hero-bg {
            background: linear-gradient(rgba(40,40,40,0.65), rgba(40,40,40,0.65)), url('images/bg.jpg') no-repeat center center/cover;
            min-height: 100vh;
            width: 100vw;
            display: flex;
            flex-direction: column;
        }
        .topbar {
            width: 100%;
            background: rgba(60, 60, 60, 0.85);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 48px;
            height: 72px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
        }
        .brand {
            color: #fff;
            font-size: 2.4rem;
            font-weight: bold;
            letter-spacing: 4px;
            text-shadow: 2px 2px 8px #222;
            text-transform: uppercase;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .nav-links a {
            color: #fff;
            font-size: 1.18rem;
            margin-left: 36px;
            text-decoration: none;
            font-weight: 400;
            transition: color 0.2s;
            vertical-align: middle;
        }
        .nav-links a:hover {
            color: #e0e0e0;
        }
        .center-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .main-title {
            color: #fff;
            font-size: 3.3rem;
            font-weight: bold;
            text-shadow: 3px 3px 12px #222;
            margin-bottom: 12px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .subtitle {
            color: #fff;
            font-size: 1.25rem;
            text-shadow: 2px 2px 8px #222;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin-bottom: 0;
        }
        @media (max-width: 600px) {
            .brand { font-size: 1.2rem; letter-spacing: 2px; }
            .main-title { font-size: 1.3rem; letter-spacing: 1px; }
            .subtitle { font-size: 0.95rem; }
            .topbar { padding: 0 8px; height: 52px; }
            .nav-links a { margin-left: 12px; font-size: 0.95rem; }
        }
    </style>
</head>
<body>
    <div class="hero-bg">
        <div class="topbar">
            <div class="brand">CONTACT MS</div>
            <div class="nav-links">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </div>
        <div class="center-content" style="padding-top: 72px;">
            <div class="main-title">CONTACT MANAGEMENT SYSTEM</div>
            <div class="subtitle">Start Collecting your contacts in a very smarter way. We provide very efficient and smarter way to handle contacts.</div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
