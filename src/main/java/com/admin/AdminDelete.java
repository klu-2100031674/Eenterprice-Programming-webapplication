package com.admin;

import java.io.IOException;
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

public class AdminDelete extends GenericServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id =Integer.parseInt(req.getParameter("id"));
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			PreparedStatement checkorderStmt = con.prepareStatement("DELETE FROM Users WHERE id = ?");
			checkorderStmt.setInt(1, id);
			ResultSet resultSet = checkorderStmt.executeQuery();
	            req.setAttribute("order", "successfull updated");
	            RequestDispatcher dispatcher = req.getRequestDispatcher("adminusers");
	            dispatcher.forward(req, res);
	            con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
