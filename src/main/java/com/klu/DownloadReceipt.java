package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadReceipt extends GenericServlet {

  private static final long serialVersionUID = 1L;

  @Override
  public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	  try {
		  int oid = Integer.parseInt(req.getParameter("id"));
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","admin");
	      Statement stmt = con.createStatement();
	      PreparedStatement checkUserStmt = con.prepareStatement("SELECT * FROM Deliveries WHERE orderid = ?");
	      checkUserStmt.setInt(1, oid);
	      ResultSet resultSet = checkUserStmt.executeQuery();
	      if (resultSet.next()) {
	    	    String fname = resultSet.getString("fname");
	    	    String lname = resultSet.getString("lname");
	    	    String pickup = resultSet.getString("pickup");
	    	    String droploc = resultSet.getString("droploc");
	    	    String ordertrack = resultSet.getString("ordertrack");
	    	    String id = resultSet.getString("orderid");
	    	    
	    	    // Generate the content for the receipt file
	    	    String filename = "receipt.txt";
	    	    StringBuilder receipt = new StringBuilder();
	    	    receipt.append("Receipt\n");
	    	    receipt.append("First Name: ").append(fname).append("\n");
	    	    receipt.append("Last Name: ").append(lname).append("\n");
	    	    receipt.append("Order Id: ").append(id).append("\n");
	    	    // Include the rest of the receipt information
	    	    String content = receipt.toString();

	    	    // Set response headers for downloading the file
	    	    HttpServletResponse response = (HttpServletResponse) res;
	    	    response.setContentType("text/plain");
	    	    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

	    	    // Write the content to the response
	    	    PrintWriter out = response.getWriter();
	    	    out.print(content);
	    	    out.flush();
	    	  }
	    } 
	    catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
  
  }
}
