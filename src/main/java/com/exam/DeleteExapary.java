package com.exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class DeleteExapary extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String DATE_OF_EXPIRY = req.getParameter("date");
		RequestDispatcher dis = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			/*String createTableSQL = "CREATE TABLE Stock (" +
				    "ITEM_ID INT PRIMARY KEY, " +
				    "Item_Name VARCHAR(30), " +
				    "Buyer_PRICE NUMBER, " + // Change DOUBLE to NUMBER
				    "SELLER_PRICE NUMBER, " + // Change DOUBLE to NUMBER
				    "DATE_OF_EXPIRY VARCHAR(10), " +
				    "NO_STOCKS INT" +
				")";
			stmt.execute(createTableSQL);*/
			PreparedStatement pq = con.prepareStatement("Delete from Stock WHERE DATE_OF_EXPIRY=?");
			pq.setString(1,DATE_OF_EXPIRY);
			pq.execute();
			req.setAttribute("p","succesufully Deleted");
			dis=req.getRequestDispatcher("Exam.jsp");
			dis.forward(req, res);
			
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
