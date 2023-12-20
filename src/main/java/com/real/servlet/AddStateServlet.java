package com.real.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.real.service.AddStateservice;

import com.real.serviceimpl.AddStateServiceimpl;

@WebServlet("/AddStateServlet")
public class AddStateServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	String status = "Add about Failed!";
	    	 String id = request.getParameter("id");
	        String state = request.getParameter("state");
	       
	       
	        AddStateServiceimpl add =new AddStateServiceimpl();
	        status=add.addstate(id,state);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("stateadd.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
