package com;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DatabaseAccess {
    public static List<PasswordDTO> getUsers(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<PasswordDTO> users = new ArrayList<>();

        // Connect to database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/miniproject","root","root");

        // Create statement
        Statement stmt = conn.createStatement();
        
        HttpSession session = request.getSession(false);
        String username = (String)session.getAttribute("uname");
        // Execute query
        ResultSet rs = 	stmt.executeQuery("SELECT * FROM "+username+";");

        // Iterate through result set and add to list
        while (rs.next()) {
            String website = rs.getString("website");
            String usernamee = rs.getString("username");
            String password = rs.getString("password");

            PasswordDTO user = new PasswordDTO(website,usernamee,password);
            users.add(user);
        }

        // Close connections
        rs.close();
        stmt.close();
        conn.close();

        return users;
    }
}
