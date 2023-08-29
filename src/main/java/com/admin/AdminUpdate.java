package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AdminUpdate extends GenericServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id =Integer.parseInt(req.getParameter("id"));
		String update =req.getParameter("update");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			PreparedStatement checkorderStmt = con.prepareStatement("UPDATE Deliveries SET ORDERTRACK = ? WHERE orderid = ?");
			checkorderStmt.setString(1, update);
			checkorderStmt.setInt(2, id);
			ResultSet resultSet = checkorderStmt.executeQuery();
			
	            req.setAttribute("order", "successfull updated");
	            RequestDispatcher dispatcher = req.getRequestDispatcher("/Admin/status.jsp");
	            dispatcher.forward(req, res);
	            con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
