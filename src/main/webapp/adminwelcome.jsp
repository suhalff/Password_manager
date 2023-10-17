<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.DBCon" %>
    <%@ page import="com.Login" %>
    <%@ page import="java.io.*"%>
    <%
    		// Retrieve the username from the session
    		//HttpSession = request.getSession();
    		String uname = request.getParameter("uname");
    		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}catch(Exception e) {
				e.printStackTrace();														
			}
		    
		    // Establish database connection
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/miniproject", "root", "root");
		    
		    // Execute SQL query to retrieve data
		    Statement stmt = conn.createStatement();
		    ResultSet rs = stmt.executeQuery("select * from login");

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
<style type="text/css">
body {
  background-color: #F9C80E;
  font-family: Arial, sans-serif;
}

h1 {
  color: #2D3047;
  text-align: center;
}

table {
  margin: 0 auto;
  border-collapse: collapse;
  width: 80%;
}

td, th {
  padding: 10px;
  text-align: center;
}

th {
  background-color: #2D3047;
  color: #F9C80E;
}

tr:nth-child(even) {
  background-color: #F6F7EB;
}

tr:hover {
  background-color: #F9C80E;
  cursor: pointer;
}

button {
  background-color: #2D3047;
  color: #F9C80E;
  border: none;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin-top: 20px;
  font-size: 16px;
  border-radius: 5px;
}

button:hover {
  background-color: #F9C80E;
  color: #2D3047;
  cursor: pointer;
}
</style>
</head>
		
<body>
		<h1>Welcome, <%= uname %>!</h1>
		<h1>Users</h1>
    <table border=2>
	  <tr>
	    <th>S. No</th>
	    <th>User Id</th>
	    <th>Password</th>
	    <th>Name</th>
	    <th>Profession</th>
	    <th>Edit</th>
	    <th>Delete</th>
	  </tr>
	  <% int id = 1; %>
	  <% while(rs.next()) { %>
	  <tr>
	      <td><%= id %></td>
	      <td><%= rs.getString("userid") %></td>
	      <td><%= rs.getString("password") %></td>
	      <td><%= rs.getString("name") %></td>
	      <td><%= rs.getString("profession") %></td>
		  <td>
	        <form method="post" action="userupdate.jsp">
	          <input type="hidden" name="uuserid" value="<%= rs.getString("userid") %>">
	          <input type="hidden" name="password" value="<%= rs.getString("password") %>">
	          <input type="hidden" name="name" value="<%= rs.getString("name") %>">
	          <input type="hidden" name="profession" value="<%= rs.getString("profession") %>">
	          <button type="submit">Edit</button>
	        </form>
	      </td>      
	      <td>
	        <form method="post" action="userdelete.jsp">
	          <input type="hidden" name="duserid" value="<%= rs.getString("userid") %>">
	          <input type="hidden" name="password" value="<%= rs.getString("password") %>">
	          <input type="hidden" name="name" value="<%= rs.getString("name") %>">
	          <input type="hidden" name="profession" value="<%= rs.getString("profession") %>">
	          <button type="submit">delete</button>
	        </form>
	      </td>
	    </tr>
	    <% id++; %>
	  <% } %>
	</table>

		<button onclick="window.location.href='index.jsp'">Logout</button>
</body>
</html>