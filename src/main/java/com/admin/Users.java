package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Users extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			ResultSet resultset = stmt.executeQuery("SELECT * FROM Users");
			List<User> userlist = new ArrayList<User>();
			 while (resultset.next()) {
	                User user = new User();
	                user.setId(resultset.getInt("id"));
	                user.setFname(resultset.getString("fname"));
	                user.setLname(resultset.getString("lname"));
	                user.setUsername(resultset.getString("username"));
	                user.setPass(resultset.getString("pass"));
	                user.setStatus(resultset.getString("status"));
	                // Add other user details here as needed
	                userlist.add(user);
	            }

	            req.setAttribute("userList", userlist);
	            RequestDispatcher dispatcher = req.getRequestDispatcher("/Admin/Users.jsp");
	            dispatcher.forward(req, res);
	            con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
