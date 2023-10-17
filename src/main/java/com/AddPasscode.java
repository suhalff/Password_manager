package com;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Login;

public class AddPasscode extends Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String website = request.getParameter("website");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// Get the username from the session attribute
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("uname");

		// Display a welcome message with the username
		//out.println("Welcome, " + username + "!");

		//String username = request.getParameter("uname");
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		int a = dbcon.addPassCode(website,username,password,uname,con);
		if(a==1) {
			ConnectionUtility.closeConnection(null,null);
			return "login.success";
		}
		else {
			return "login.success";
		}
	}
	
}
