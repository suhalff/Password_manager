<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.DBCon" %>
    <%@ page import="com.Login" %>
    <%@ page import="java.io.*"%>
    <%
	    int id = Integer.parseInt(request.getParameter("id"));
	    String website = request.getParameter("website");
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	
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
		  <input type="hidden" name="formid" value="delete">
		  <h2>Password Manager</h2>
		  <input type="hidden" id="id" name="id" value="<%=id %>">
		  <label for="website">Website:</label>
		  <input type="text" id="website" value="<%=website%>" name="website" placeholder="Enter website name" required>
		  <label for="username">Username:</label>
		  <input type="text" id="username" value="<%=username%>" name="username" placeholder="Enter username" required>
		  <label for="password">Password:</label>
		  <input type="text" id="password" value="<%=password%>" name="password" placeholder="Enter password" required>    
		  <input type="submit" value="Delete">   
	</form>

	<a href="welcome.jsp"><button class="my-button">Cancel</button></a>

</body>
</html>
