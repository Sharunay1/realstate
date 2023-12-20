package com.real.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.serviceimpl.AddAgentServiceimpl;

@WebServlet("/AddAgentServlet")
public class AddAgentServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	String status = "Add agent Failed!";
	    	 String id = request.getParameter("id");
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String type = request.getParameter("type");
	        String image = request.getParameter("image");
	       
	        AddAgentServiceimpl add =new AddAgentServiceimpl();
	        status=add.addagent(id,username,email, phone,type,image);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("useragent.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
