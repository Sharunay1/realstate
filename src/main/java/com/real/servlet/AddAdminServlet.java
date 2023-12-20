package com.real.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.serviceimpl.AddAdminServiceimpl;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	
	    	String status = "Add admin Failed!";
	    	 String id = request.getParameter("id");
	    	 String auser = request.getParameter("auser");
	        String title = request.getParameter("title");
	        String aimage = request.getParameter("aimage");
	        String content = request.getParameter("content");
	       
	        AddAdminServiceimpl add =new AddAdminServiceimpl();
	        status=add.addadmin(id,auser,title,aimage, content);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("adminlist.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
