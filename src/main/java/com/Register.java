package com;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ConnectionUtility;
import com.Login;

public class Register extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String usedid = request.getParameter("uname");
		String password = request.getParameter("upass");
		String name = request.getParameter("name");
		String pro = request.getParameter("pro");
		
		DBCon dbcon = new DBCon();
		Connection con = ConnectionUtility.getConnection();
		boolean b = dbcon.checkuser(usedid,con);
		int a;
		if(b==false) {
			a = dbcon.register(usedid,password,name,pro,con);
			
			if(a==1) {
				ConnectionUtility.closeConnection(null,null);
				return "register.success";			
			}
			else {
				return "register.failure";
			}
		}
		else {
			return "username";
		}
		
	}
	
}
