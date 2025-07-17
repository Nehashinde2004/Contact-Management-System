<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            background: #f3f4f6;
            font-family: 'Inter', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .login-container {
            background: #fff;
            max-width: 350px;
            margin: 80px auto 0 auto;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px 28px 24px 28px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h2 {
            color: #2563eb;
            margin-bottom: 24px;
            font-weight: 700;
        }
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
        input[type="text"], input[type="password"] {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            font-size: 1rem;
            background: #f3f4f6;
            outline: none;
            transition: border 0.2s;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border: 1.5px solid #2563eb;
        }
        input[type="submit"] {
            background: #2563eb;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.2s;
        }
        input[type="submit"]:hover {
            background: #1d4ed8;
        }
        a {
            color: #2563eb;
            text-decoration: none;
            font-size: 0.98rem;
            margin-top: 18px;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: #ef4444;
            margin-top: 10px;
            font-size: 0.98rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
        <a href="register.jsp">Don't have an account? Register</a>
        <% String error = (String) request.getAttribute("error"); if (error != null) { out.print("<div class='error'>" + error + "</div>"); } %>
    </div>
</body>
</html> 