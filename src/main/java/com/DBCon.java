package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;



public class DBCon {
	public DBCon() {
		
	}
	
	public boolean login(String uname, String upass,Connection con) {
		try {			
			PreparedStatement ps = con.prepareStatement("select * from login where userid=? and password=?");
			ps.setString(1, uname);
			ps.setString(2, upass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				
				return true;
			}
			else {
				return false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean checkuser(String uname, Connection con) {
		try {
			
			PreparedStatement ps = con.prepareStatement("select * from login where userid=?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public int register(String uid,String upass,String name,String pro, Connection con) {
		try {
			
			PreparedStatement ps = con.prepareStatement("insert into login values(?,?,?,?)");
			ps.setString(1, uid);
			ps.setString(2, upass);
			ps.setString(3,name);
			ps.setString(4,pro);
			int i = ps.executeUpdate();
			Statement stmt = con.createStatement();
			String sql = "create table "+uid+" (id numeric(4), website varchar(20),username varchar(20), password varchar(20))";
			int a = stmt.executeUpdate(sql);
			
			if(i==1&&a==1) {
				return 0;
			}
			else {
				return 1;
			}
			
		}catch(Exception e) {
				e.printStackTrace();
				return 0;
		}
	}
	public int addPassCode(String website,String username,String password,String uname,Connection con) {
		try {
			int flag=1;
			int lastId=1;
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM "+uname);
			//pstmt.setInt(1, 1); // set the parameter value for the placeholder '?'
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    String websitee = rs.getString("website");
			    String usernamee = rs.getString("username");
			    String passwordd = rs.getString("password");
			    // process the retrieved data
			    lastId = rs.getInt(1);
		        lastId++;
			    if(websitee.equals(website)&&usernamee.equals(username)&&passwordd.equals(password)) {
			    	flag=0;
			    }
			}
			if(flag==1) {
				PreparedStatement ps = con.prepareStatement("insert into "+uname+" values(?,?,?,?)");
				ps.setInt(1,lastId);
				ps.setString(2, website);
				ps.setString(3, username);
				ps.setString(4, password);
				int i = ps.executeUpdate();
				if(i==1) {
					System.out.println("Added Successfully");			
					return i;
				}
				else {
					System.out.println("Add Failure");
					return 0;
				}
			}
			else {
				return 0;
			}
			
		}catch(Exception e) {
				e.printStackTrace();
				return 0;
		}
		//return 0;
	}
	
	public int update(String website, String username, String password,String uname,int id,Connection con) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("update "+uname+" set website=?,username=?,password=? where id=?");
			ps.setString(1, website);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setInt(4, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				System.out.println("Edited Successfully");
				return i;
			}
			else {
				System.out.println("Edit Failure");
				return 0;
			}
			
			
		}catch(Exception e) {
				e.printStackTrace();
				return 0;
		}
	}
	public int delete(String uname,int id,Connection con) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("delete from "+uname+" where id=?");		
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				System.out.println("Deleted Successfully");
				return i;
			}
			else {
				System.out.println("Delete Failure");
				return 0;
			}
			
			
		}catch(Exception e) {
				e.printStackTrace();
				return 0;
		}
	}
	public ResultSet getPasswords(String username,Connection con){
		try {
			PreparedStatement stmt = con.prepareStatement("select * from "+username);
			ResultSet rs = stmt.executeQuery();
			return rs;
		}catch(Exception e) {
			return null;
		}
	}

	public static void main(String[] args) throws Exception{
		Connection con = ConnectionUtility.getConnection();
		DBCon dbcon = new DBCon();
		ResultSet rs = dbcon.getPasswords("suhalf",con);
		while(rs.next()) {
			System.out.print(rs.getString("website"));
			System.out.print(rs.getString("username"));
			System.out.print(rs.getString("password"));
			System.out.println();
		}	
		
	}
	public boolean adminLogin(String uname, String upass,Connection con) {
		try {			
			PreparedStatement ps = con.prepareStatement("select * from admin where userid=? and password=?");
			ps.setString(1, uname);
			ps.setString(2, upass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
public int userUpdate(String userid, String password, String name,String pro,Connection con) {
		
		try {
			
			PreparedStatement ps = con.prepareStatement("update login set password=?,name=?,profession=? where userid=?");
			ps.setString(1, password);
			ps.setString(2, name);
			ps.setString(3, pro);
			ps.setString(4, userid);
			
			int i = ps.executeUpdate();
			if(i==1) {
				System.out.println("Updated Successfully");
				return i;
			}
			else {
				System.out.println("Update Failure");
				return 0;
			}
			
			
		}catch(Exception e) {
				e.printStackTrace();
				return 0;
		}
	}
public int userDelete(String userid,Connection con) {
	
	try {
		
		PreparedStatement ps = con.prepareStatement("delete from login where userid=?");		
		ps.setString(1, userid);
		PreparedStatement ps2 = con.prepareStatement("drop table "+userid);	
		ps2.execute();
		ps.setString(1, userid);
		
		int i = ps.executeUpdate();
		return i;
		
	}catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
	}
}
}
