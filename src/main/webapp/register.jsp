<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<style>
		body {
			
    		background-size: cover;
			font-family: Arial, sans-serif;
			font-size: 16px;
			margin: 0;
			padding: 0;
			
		}
		
		h1 {
			font-size: 36px;
			margin-bottom: 20px;
			text-align: center;
			text-transform: uppercase;
		}
		form {
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin: 50px auto;
			max-width: 500px;
			padding: 30px;
		}
		label {
			display: block;
			font-size: 18px;
			margin-bottom: 10px;
		}
		input[type="text"],
		input[type="password"],
		select {
			background-color: #f5f5f5;
			border: none;
			border-radius: 5px;
			box-sizing: border-box;
			color: #333;
			font-size: 16px;
			margin-bottom: 20px;
			padding: 10px;
			width: 100%;
		}
		select {
			appearance: none;
			-webkit-appearance: none;
			-moz-appearance: none;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M1.41,2.84L4,5.42l2.59-2.58L8,4.25l-4,4L0,4.25z' fill='%23333'/%3E%3C/svg%3E");
			background-position: right 10px center;
			background-repeat: no-repeat;
			background-size: 10px;
			padding-right: 40px;
		}
		input[type="submit"] {
			background-color: #333;
			border: none;
			border-radius: 5px;
			color: #fff;
			cursor: pointer;
			font-size: 18px;
			padding: 10px;
			text-transform: uppercase;
			width: 100%;
		}
		input[type="submit"]:hover {
			background-color: #555;
		}
		button{
			background-color: #333;
			border: none;
			border-radius: 5px;
			color: #fff;
			cursor: pointer;
			font-size: 18px;
			padding: 10px;
			text-transform: uppercase;
			width: 100%;
		}
		button:hover{
			background-color: #555;
		}
		a{
			color: #fff;
			text-decoration:none;
		}
	</style>
</head>
<body>
		<h1>Register</h1>
	<form action="register.do" method="post">
		<input type="hidden" name="formid" value="register">
		
		<label for="name">Name</label> 
		<input type="text" name="name" id="name">
		
		<label for="pro">Profession</label>
		<select id="pro" name="pro">
			<option value="student">Student</option>
			<option value="teacher">Teacher</option>
		</select>
		
		<label for="uname">Username</label>
		<input type="text" name="uname" id="uname">
		
		<label for="upass">Password</label>
		<input type="password" name="upass" id="upass">
		
		<input type="submit" name="submit" value="Register" />
		<br>
		<p><center>Already have an Account?</center><p>
		
		</form>
		
		<form action="login.jsp">
			<input type="submit" value="login">
		</form>
</body>
</html>