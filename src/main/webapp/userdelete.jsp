<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.DBCon" %>
    <%@ page import="com.Login" %>
    <%@ page import="java.io.*"%>
    <%
	    String userid = request.getParameter("duserid");
	    String password = request.getParameter("password");
	    String name = request.getParameter("name");
	    String pro = request.getParameter("profession");
	
	%>
<!DOCTYPE html>
<html>
<head>
	<title>Password Manager</title>
	<style>

		form {
			width: 400px;
			margin: auto;
			padding: 20px;
			border: 1px solid #ccc;
			border-radius: 5px;
		}
		input[type="text"], input[type="password"] {
			width: 100%;
			padding: 10px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			box-sizing: border-box;
		}
		input[type="submit"] {
			background-color: #D21312;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		input[type="submit"]:hover {
			background-color: #FF6D60;
		}
	
		.my-button {
			  position: absolute;
			  top: 51%;
			  left: 50%;
			  transform: translate(-50%, -50%);
		}
		
	</style>
	
</head>
<body>
	<center><h1>Delete</h1></center>
	<form action="delete.do" method="POST" id="add">
		  <input type="hidden" name="formid" value="userdelete">
		  
		  <h2>Password Manager</h2>
		  <input type="hidden" name="duserid" value="<%=userid%>">
		  
		  <label for="password">Password:</label>
		  <input type="text" id="password" value="<%=password%>" name="password" placeholder="Enter website name" required>
		  
		  <label for="name">Name:</label>
		  <input type="text" id="name" value="<%=name%>" name="name" placeholder="Enter username" required>
		  
		  <label for="profession">Profession:</label>
		  <input type="text" id="profession" value="<%=pro%>" name="profession" placeholder="Enter password" required>    
		  
		  <input type="submit" value="Delete">   
	</form>

	<a href="adminwelcome.jsp"><button class="my-button">Cancel</button></a>

</body>
</html>
