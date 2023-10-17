package com;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserUpdate extends Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("uuserid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String pro = request.getParameter("pro");
		
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		int a = dbcon.userUpdate(userid,password,name,pro,con);
		if(a==1) {
			ConnectionUtility.closeConnection(null,null);
			return "adminlogin.success";
		}
		else {
			return "adminlogin.success";
		}
	}
	
}

