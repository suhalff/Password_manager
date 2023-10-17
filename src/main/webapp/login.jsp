<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<style>
    body {
        font-family: Arial, sans-serif;
    }
    h1 {
    color: #333;
    font-size: 2em;
    margin-bottom: 20px;
}

form {
    border: 1px solid #ccc;
    padding: 20px;
    width: 400px;
    margin: 0 auto;
}

label {
    display: block;
    font-size: 1.2em;
    margin-bottom: 10px;
}

input[type="text"],
input[type="password"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    width: 100%;
    margin-bottom: 20px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #555;
}
a{
	text-decoration: none;
	color: #fff;
}
button{
	background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}
button:hover{
	background-color: #555;
}
    </style>
</head>
<body>
		<center><h1>User Login</h1></center>
		<form action="login.do" method="post">
			<input type="hidden" name="formid" value="login">
			<label for="uname">Username</label>
			<input type="text" id="uname" name="uname">
			<label for="upass">Password</label>
			<input type="password" id="upass" name="upass">
			<input type="submit" value="Login..">Don't have an account?
		</form>
		<form action="register.jsp">
			<button><a href="register.jsp">Create an Account!</a></button>
		</form>
</body>
</html>