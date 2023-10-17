package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Savepoint;

public class ConnectionUtility {
	
	static {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static ThreadLocal<Connection> clockRoom = new ThreadLocal<>();
	public static Connection getConnection() {
		try {
			Connection con = clockRoom.get();
			if(con==null) {
				con=DriverManager.getConnection("jdbc:mysql://localhost/miniproject","root","root");
				con.setAutoCommit(false);
				clockRoom.set(con);
				return con;
			}
			else {
				return con;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void closeConnection(Exception e, Savepoint sp) {
		try {
			Connection con = clockRoom.get();
			if(con!=null) {
				if(e==null) {
					con.commit();
				}
				else {
					if(sp==null) {
						con.rollback();
					}
					else {
						con.rollback(sp);
						con.commit();
					}
				}
			}
			con.close();
			clockRoom.remove();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
