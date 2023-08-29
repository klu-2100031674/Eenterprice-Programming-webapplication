package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends  GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("email");
		String pass = req.getParameter("pass");
		RequestDispatcher dis = null;
		try {
			PrintWriter pw = res.getWriter();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			boolean userExists = false;
			boolean admin=false;
			PreparedStatement checkUserStmt = con.prepareStatement("SELECT * FROM Users WHERE username = ?");
			checkUserStmt.setString(1, username);
			ResultSet resultSet = checkUserStmt.executeQuery();
			if (resultSet.next()) {
			    userExists = true;
			}
			boolean validate = false;
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE username = ? and pass=?");
			ps.setString(1, username);
			ps.setString(2, pass);
			ResultSet success = ps.executeQuery();
			if(success.next()) {
				validate = true;
				String status = success.getString("status");
				if (status != null && status.equals("Admin")) {
				    admin = true;
				}
			}
			if(userExists) {
				if(validate) {
					if(admin) { 	    
					HttpSession session=((HttpServletRequest) req).getSession();  
			        session.setAttribute("loginstatus",username);  
					req.setAttribute("status","sucess");
					dis=req.getRequestDispatcher("AdminHome.jsp");
					dis.forward(req, res);
					}
					else {
					    HttpSession session=((HttpServletRequest) req).getSession();  
				        session.setAttribute("loginstatus",username);  
						req.setAttribute("status","sucess");
						dis=req.getRequestDispatcher("home.jsp");
						dis.forward(req, res);
					}
			
				}
				else {
					req.setAttribute("status","wrong password");
					dis=req.getRequestDispatcher("login.jsp");
					dis.forward(req, res);
				}
			}
			else
			{
				req.setAttribute("status","your are not registered please register");
				dis=req.getRequestDispatcher("login.jsp");
				dis.forward(req, res);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
