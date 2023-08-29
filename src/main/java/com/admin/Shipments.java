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

public class Shipments extends GenericServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		int id =Integer.parseInt( req.getParameter("orderid"));
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			PreparedStatement checkorderStmt = con.prepareStatement("SELECT * FROM Deliveries WHERE orderid = ?");
			checkorderStmt.setInt(1, id);
			ResultSet resultSet = checkorderStmt.executeQuery();
			List<String> li = new ArrayList<String>();
			while(resultSet.next()) {
				String orderid = String.valueOf(id);
				li.add(orderid);
				String name = resultSet.getString("fname");
				li.add(name);
				String status = resultSet.getString("ORDERTRACK");
				li.add(status);
			}

	            req.setAttribute("del", li);
	            RequestDispatcher dispatcher = req.getRequestDispatcher("/Admin/Shipment.jsp");
	            dispatcher.forward(req, res);
	            con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
