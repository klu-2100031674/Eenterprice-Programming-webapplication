package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ServeltExample4 extends  GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = req.getParameter("fname");

		int id = Integer.parseInt(req.getParameter("id"));
		
		
		try {
			PrintWriter pw = res.getWriter();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
			Statement stmt = con.createStatement();
			//stmt.execute("CREATE TABLE Servlet (id INT, name VARCHAR(50))");
			PreparedStatement ps = con.prepareStatement("insert into Servlet values(?,?)");
			ps.setInt(1, id);
			ps.setString(2, fname);
			ps.execute();
			pw.write("<html>Succefully inserted </html>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
