package com;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserDelete extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("duserid");

		//String username = request.getParameter("uname");
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		int a = dbcon.userDelete(userid,con);
		if(a==1) {
			ConnectionUtility.closeConnection(null,null);
			return "adminlogin.success";
		}
		else {
			return "adminlogin.success";
		}
	}

}
