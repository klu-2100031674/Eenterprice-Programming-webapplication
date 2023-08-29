package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Reg extends  GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = req.getParameter("code");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String username = req.getParameter("email");
		String pass = req.getParameter("pass");
		RequestDispatcher dis = null;
		
		try {
			PrintWriter pw = res.getWriter();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			//stmt.execute("CREATE TABLE Users(id INT, Fname VARCHAR(50), Lname VARCHAR(50), username VARCHAR(50), pass VARCHAR(20))");
			boolean userExists = false;
			PreparedStatement checkUserStmt = con.prepareStatement("SELECT * FROM Users WHERE username = ?");
			checkUserStmt.setString(1, username);
			ResultSet resultSet = checkUserStmt.executeQuery();
		  
			if (resultSet.next()) {
			    userExists = true;
			}

			if(userExists)
			{
				req.setAttribute("status","User already exist");
				dis=req.getRequestDispatcher("Register.jsp");
				dis.forward(req, res);
			}
			else {
				String sql = "SELECT MAX(id) FROM Users";
				ResultSet maxid = stmt.executeQuery(sql);
				int ID = 0;

				if (maxid.next()) {
				    Integer maxIdValue = maxid.getInt(1);
				    if (maxIdValue != null) { 
				        ID = maxIdValue+1;
				    }
				}
			PreparedStatement pq = con.prepareStatement("insert into Users values(?,?,?,?,?,?)");
			pq.setInt(1, ID);
			pq.setString(2, fname);
			pq.setString(3, lname);
			pq.setString(4, username);
			pq.setString(5, pass);
			pq.setString(6, "user");
			pq.execute();	
			req.setAttribute("status","succesufully Registered please login");
			dis=req.getRequestDispatcher("login.jsp");
			dis.forward(req, res);
			}
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
