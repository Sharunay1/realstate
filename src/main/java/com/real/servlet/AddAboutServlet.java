package com.real.servlet;
import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.serviceimpl.AddAboutServiceImpl;

@WebServlet("/AddAboutServlet")
public class AddAboutServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

//	        HttpSession session = request.getSession();
//	        String userType = (String) session.getAttribute("usertype");
//	        String userName = (String) session.getAttribute("username");
//	        String password = (String) session.getAttribute("password");
	//
//	        if (userType == null || !userType.equals("admin")) {
//	            response.sendRedirect("login.jsp?message=Access Denied!");
//	        } else if (userName == null || password == null) {
//	            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//	        }
	    	String status = "Add about Failed!";
	    	 String id = request.getParameter("id");
	        String title = request.getParameter("title");
	        String aimage = request.getParameter("aimage");
	        String content = request.getParameter("content");
	       
	        AddAboutServiceImpl add =new AddAboutServiceImpl();
	        status=add.addabout(id,title,aimage, content);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("aboutadd.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
