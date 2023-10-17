package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends Action {
	
	@Override
	public String execute (HttpServletRequest request,HttpServletResponse response)	{
		// Get the username from the login form
		String uname = request.getParameter("uname");
		
		// Store the username in a session attribute
		HttpSession session = request.getSession(true);
		session.setAttribute("uname", uname);

		String userid = request.getParameter("uname");
		String password = request.getParameter("upass");
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		boolean valid = dbcon.login(userid,password,con);
		if(valid) {
			session.setAttribute("loggedIn", true);
			return "login.success";
		}
		else {
			return "login.failure";
		}
		
	}
}