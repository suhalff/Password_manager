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
		.popup {
			width: 250px;
			height: 20px;
			background-color: #ccc;
			margin: 0 auto; /* Center the div horizontally */
		}
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
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
		.container {
			  position: center;
			  width: 80%;
			  margin: 0 auto;
			  height: 250px;	  
		}
			
		.my-button {
			  position: absolute;
			  top: 51%;
			  left: 50%;
			  transform: translate(-50%, -50%);
		}
		
	</style>
	<script>
	function openPopup() {
		  var popup = document.getElementById("popup");
		  popup.style.display = "block";
		}

		function generatePassword() {
		  var password = document.getElementById("password");
		  var length = document.getElementById("length").value;
		  var numbers = document.getElementById("numbers").checked;
		  var letters = document.getElementById("letters").checked;
		  var symbols = document.getElementById("symbols").checked;
		  
		  if (numbers && letters && symbols) {
		    password.value = allThree(length);
		  } else if (numbers && letters) {
		    password.value = lettersNumbers(length);
		  } else if (numbers && symbols) {
		    password.value = numbersSymbols(length);
		  } else if (letters && symbols) {
		    password.value = lettersSymbols(length);
		  } else if (numbers) {
		    password.value = onlyNumbers(length);
		  } else if (letters) {
		    password.value = onlyLetters(length);
		  } else if (symbols) {
		    password.value = onlySymbols(length);
		  } else {
		    password.value = "";
		  }
		}

		function onlyLetters(length) {
			var password = "";
			var dummy = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 52));
				password += pass;
			}
			return password;
		}
		
		function onlyNumbers(length) {
			var password = "";
			var dummy = "1234567890";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 10));
				password += pass;
			}
			return password;
		}
		
		function lettersNumbers(length) {
			var password = "";
			var dummy = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz1234567890";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 62));
				password += pass;
			}
			return password;
		}
		
		function lettersSymbols(length) {
			var password = "";
			var dummy = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz!@#$%^&*()-_=+|[]{};:,<.>/?`~";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 84));
				password += pass;
			}
			return password;
		}
		
		function numbersSymbols(length) {
			var password = "";
			var dummy = "1234567890!@#$%^&*()-_=+|[]{};:,<'\"\\.>/?`~";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 42));
				password += pass;
			}
			return password;
		}
		
		function allThree(length) {
			var password = "";
			var dummy = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz1234567890!@#$%^&*()-_=+|[]{};:,<.>/?`~";
			for(var i = 0; i < length; i++) {
				var pass = dummy.charAt(Math.floor(Math.random() * 94));
				password += pass;
			}
			return password;
		}
		
	</script>
</head>
<body>
	<center><h1>Edit</h1></center>
	<form action="update.do" method="POST" id="add">
		  <input type="hidden" name="formid" value="update">
		  <h2>Password Manager</h2>
		  <input type="hidden" id="id" name="id" value="<%=id %>">
		  <label for="website">Website:</label>
		  <input type="text" id="website" value="<%=website%>" name="website" placeholder="Enter website name" required>
		  <label for="username">Username:</label>
		  <input type="text" id="username" value="<%=username%>" name="username" placeholder="Enter username" required>
		  <label for="password">Password:</label>
		  <input type="text" id="password" value="<%=password%>" name="password" placeholder="Enter password" required>    
		  <input type="submit" value="Edit">   
	</form>

	<button onclick="openPopup()" class="my-button">Generate Password</button>

	<div id="popup" class="popup" style="display: none;">
		
  			<input type="checkbox" id="numbers" onchange="generatePassword()" />Numbers
  			<input type="checkbox" id="letters" onchange="generatePassword()" />Letters
  			<input type="checkbox" id="symbols" onchange="generatePassword()" />Symbols
  			<br />
  			Length:
  			
  			<input type="range" id="length" min="8" max="20" onchange="generatePassword()" />
  			<br />
  			
		</div>
</body>
</html>
