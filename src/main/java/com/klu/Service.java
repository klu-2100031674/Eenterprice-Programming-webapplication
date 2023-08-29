package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
public class Service extends GenericServlet
{

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  @Override
  public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException 
  {
    // TODO Auto-generated method stub
    
    String fname = req.getParameter("fname");
    String lname = req.getParameter("lname");
    String pick = req.getParameter("pickup");
    String droploc = req.getParameter("droploc");
    String coparcel = req.getParameter("coparcel");
    String address = req.getParameter("address");
    String email = req.getParameter("email");
    String addinfo = req.getParameter("addinfo");
    String transtatus = "not paid";
    String weight = req.getParameter("weight");
    String phnum = req.getParameter("phnum");
    int p = (Integer.parseInt(weight)*50);
    String price=String.valueOf(p);
    
    
    java.util.Date currentDate = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
    String s= sqlDate.toString();
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
      Statement stmt = con.createStatement();
      String sql = "SELECT MAX(orderid) FROM Deliveries";
      ResultSet resultSet = stmt.executeQuery(sql);
      int maxOrderID=0;
      if (resultSet.next()) {
    	    maxOrderID = resultSet.getInt(1);
    	    
    	}
      maxOrderID+=1;
      //stmt.execute("CREATE TABLE DeliveriesIds(orderid int, username VARCHAR(50))");
     //stmt.execute("CREATE TABLE Deliveries(fname VARCHAR(50), lname VARCHAR(50), pickup VARCHAR(50), droploc VARCHAR(50), weight VARCHAR(50), conparcel VARCHAR(50), address VARCHAR(50), email VARCHAR(50), phnum VARCHAR(50), addinfo VARCHAR(50), price VARCHAR(50), transtatus VARCHAR(50), date_col varchar(50))");
      PreparedStatement ps = con.prepareStatement("INSERT INTO Deliveries values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      PreparedStatement pq = con.prepareStatement("INSERT INTO DeliveriesIds values (?, ?)");
      pq.setInt(1, maxOrderID);
      pq.setString(2, email);
      pq.execute();
      ps.setString(1, fname);
      ps.setString(2, lname );
      ps.setString(3, pick);
      ps.setString(4, droploc);
      ps.setString(5, weight);
      ps.setString(6, coparcel );
      ps.setString(7, address );
      ps.setString(8, email);
      ps.setString(9, phnum);
      ps.setString(10, addinfo);
      ps.setString(11, price);
      ps.setString(12, transtatus);
      ps.setString(13, s);
      ps.setInt(14,maxOrderID);
      ps.setString(15, "placed");
      ps.execute();
      
      req.setAttribute("oid", maxOrderID);

      // Redirect to the receipt.jsp page
      req.getRequestDispatcher("receipt.jsp").forward(req, res);
    } 
    catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
  }
  
}