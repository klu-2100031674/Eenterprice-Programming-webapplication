package com.klu;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Track extends GenericServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        String orderid = req.getParameter("orderid");
        RequestDispatcher dis = null;
        try {
            PrintWriter pw = res.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
            Statement stmt = con.createStatement();

            PreparedStatement checkUserStmt = con.prepareStatement("SELECT * FROM Deliveries WHERE orderid = ?");
            checkUserStmt.setString(1, orderid);
            ResultSet resultSet = checkUserStmt.executeQuery();
            List<String> data = new ArrayList<>();
            while (resultSet.next()) {
                // Assuming there's a column named "column_name" in the Deliveries table
                String fname = resultSet.getString("fname");
                data.add(fname);
                String lname = resultSet.getString("lname");
                data.add(lname);
                String pickup = resultSet.getString("pickup");
                data.add(pickup);
                String droploc = resultSet.getString("droploc");
                data.add(droploc);
                String ordertrack = resultSet.getString("ordertrack");
                data.add(ordertrack);
                String id = resultSet.getString("orderid");
                data.add(id);
            }
    
                req.setAttribute("data", data);
                dis = req.getRequestDispatcher("Trackorder.jsp");
                dis.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
