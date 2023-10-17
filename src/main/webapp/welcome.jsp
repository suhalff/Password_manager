<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.DBCon" %>
    <%@ page import="com.Login" %>
    <%@ page import="java.io.*"%>
    <%
    		// Retrieve the username from the session
    		session = request.getSession();
    		String uname = (String) session.getAttribute("uname");
    		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}catch(Exception e) {
				e.printStackTrace();														
			}
		    
		    // Establish database connection
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/miniproject", "root", "root");
		    
		    // Execute SQL query to retrieve data
		    Statement stmt = conn.createStatement();
		    ResultSet rs = stmt.executeQuery("select * from "+uname+";");

	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>	
	function copy() {
		  var password = event.target.parentNode.parentNode.cells[3].textContent;
		  navigator.clipboard.writeText(password)
		    .then(() => {
		      console.log('Copied to clipboard: ' + password);
		      alert('Copied to clipboard: ' + password);
		    })
		    .catch(err => {
		      console.error('Failed to copy: ', err);
		    });
		}
</script>
<style>
		body {
			font-family: Arial, sans-serif;
		}
		h1 {
			font-size: 24px;
		}
		table {
			border-collapse: collapse;
			margin-top: 20px;
			width: 100%;
		}
		th, td {
			padding: 10px;
			text-align: left;
			border: 1px solid #ddd;
		}
		th {
			background-color: #4CAF50;
			color: white;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		.button {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
		}
		.button:hover {
			background-color: #3e8e41;
		}
		.edit-button {
			background-color: #008CBA;
		}
		.edit-button:hover {
			background-color: #006b87;
		}
		.copy-button {
			background-color: #f44336;
		}
		.copy-button:hover {
			background-color: #d32f2f;
		}
		.delete-button {
			background-color: #555555;
		}
		.delete-button:hover {
			background-color: #424242;
		}
	</style>
</head>
		
<body>
		<h1>Welcome, <%= uname %>!</h1>
		<h1>My Passwords</h1>
    <table border=2>
		  <tr>
		    <th>S. No</th>
		    <th>Website</th>
		    <th>Username</th>
		    <th>Password</th>
		    <th>Edit</th>
		    <th>Copy</th>
		    <th>Delete</th>
		  </tr>
		  <% int id = 1; %>
		  <% while(rs.next()) { %>
		    <tr>
		      <td><%= id %></td>
		      <td><%= rs.getString("website") %></td>
		      <td><%= rs.getString("username") %></td>
		      <td><%= rs.getString("password") %></td>
			  <td>
		        <form method="post" action="update.jsp">
		          <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
		          <input type="hidden" name="website" value="<%= rs.getString("website") %>">
		          <input type="hidden" name="username" value="<%= rs.getString("username") %>">
		          <input type="hidden" name="password" value="<%= rs.getString("password") %>">
		          <button type="submit">Edit</button>
		        </form>
		      </td>      
		      <td><button onclick="copy()">Copy</button></td>
		      <td>
		        <form method="post" action="delete.jsp">
		          <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
		          <input type="hidden" name="website" value="<%= rs.getString("website") %>">
		          <input type="hidden" name="username" value="<%= rs.getString("username") %>">
		          <input type="hidden" name="password" value="<%= rs.getString("password") %>">
		          <button type="submit">delete</button>
		        </form>
		      </td>
		    </tr>
		    <% id++; %>
		  <% } %>
</table>

		<button onclick="window.location.href='add.jsp'">Add Password</button><br><br>
		<button onclick="window.location.href='index.jsp'">Logout</button>
</body>
</html>