package com.admin;

import java.io.IOException;
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

public class Deliveries extends GenericServlet{

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
			ResultSet resultset = stmt.executeQuery("SELECT * FROM Deliveries");
			List<Delivery> deliverlist = new ArrayList<Delivery>();
			 while (resultset.next()) {
	                Delivery deliver = new Delivery();
	                deliver.setFname(resultset.getString("fname"));
	                deliver.setLname(resultset.getString("lname"));
	                deliver.setPickup(resultset.getString("pickup"));
	                deliver.setDroploc(resultset.getString("droploc"));
	                deliver.setWeight(resultset.getString("weight"));
	                deliver.setConparcel(resultset.getString("conparcel"));
	                deliver.setAddress(resultset.getString("address")); 
	                deliver.setEmail(resultset.getString("email")); 
	                deliver.setPhnum(resultset.getString("phnum"));
	                deliver.setAddinfo(resultset.getString("addinfo"));
	                deliver.setPrice(resultset.getString("price"));
	                deliver.setTranstatus(resultset.getString("transtatus"));
	                deliver.setDate_col(resultset.getString("date_col"));
	                deliver.setOrderid(resultset.getInt("orderid"));
	                deliver.setOrdertrack(resultset.getString("ordertrack"));
	                // Add other deliver details here as needed
	                deliverlist.add(deliver);
	            }

	            req.setAttribute("deliverList", deliverlist);
	            RequestDispatcher dispatcher = req.getRequestDispatcher("/Admin/Delivers.jsp");
	            dispatcher.forward(req, res);
	            con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
