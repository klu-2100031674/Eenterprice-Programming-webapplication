package com.exam;

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

public class Exam extends GenericServlet{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				int ITEM_ID = Integer.parseInt(req.getParameter("itemid"));
				String Item_Name = req.getParameter("itemname");
				double BuyER_PRICE = Double.parseDouble(req.getParameter("buyerprice"));
				double SELLER_PRICE = Double.parseDouble(req.getParameter("sellerprice"));
				String DATE_OF_EXPIRY = req.getParameter("expiry");
				int NO_STOCKS = Integer.parseInt(req.getParameter("nostock"));
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
					PreparedStatement pq = con.prepareStatement("insert into Stock values(?,?,?,?,?,?)");
					pq.setInt(1,ITEM_ID);
					pq.setString(2,Item_Name);
					pq.setDouble(3,BuyER_PRICE );
					pq.setDouble(4,SELLER_PRICE);
					pq.setString(5,DATE_OF_EXPIRY);
					pq.setInt(6, NO_STOCKS);
					pq.execute();
					req.setAttribute("p","succesufully added");
					dis=req.getRequestDispatcher("Exam.jsp");
					dis.forward(req, res);
					
				}
				 catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}

}
