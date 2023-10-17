package com;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogin extends Action{
	@Override
	public String execute (HttpServletRequest request,HttpServletResponse response)	{
		String userid = request.getParameter("uname");
		String password = request.getParameter("upass");
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		boolean valid = dbcon.adminLogin(userid,password,con);
		if(valid) {
			return "adminlogin.success";
		}
		else {
			return "login.failure";
		}
		
	}
}	
