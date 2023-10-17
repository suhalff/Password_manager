<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style>
		body {
			background-color: #f5f5f5;
			font-family: Arial, sans-serif;
		}
		h2 {
			margin-top: 100px;
			font-size: 3em;
			color: #333333;
			text-align: center;
			text-shadow: 1px 1px #cccccc;
		}
		a {
			display: block;
			margin: 20px auto;
			padding: 15px 30px;
			border: 1px solid #cccccc;
			border-radius: 25px;
			background-color: #ffffff;
			color: #333333;
			font-size: 1.5em;
			text-align: center;
			text-decoration: none;
			text-shadow: 1px 1px #f5f5f5;
			box-shadow: 2px 2px 5px #cccccc;
			transition: all 0.3s ease-in-out;
		}
		a:hover {
			background-color: #333333;
			color: #ffffff;
			text-shadow: none;
			box-shadow: none;
		}
	</style>
</head>
<body>
	<h2>Suhail's Password Manager</h2>
	<p><a href="admin.jsp">Admin login</a></p>
	<a href="login.jsp">User Login</a>
	<a href="register.jsp">Register</a>
</body>
</html>