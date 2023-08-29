package com.klu;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Logout extends GenericServlet{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	    HttpSession session=((HttpServletRequest) req).getSession();  
        session.invalidate();  
    	RequestDispatcher dis = null;
    	dis=req.getRequestDispatcher("home.jsp");
		dis.forward(req, res);
		
	}

}
