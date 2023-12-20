package com.real.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.real.serviceimpl.OTPGenerator;


@WebServlet("/PasswordResetServlet")
public class PasswordResetServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String toEmail = request.getParameter("email"); 

        String otp = OTPGenerator.sendOTPEmail(toEmail);
        
        request.getSession().setAttribute("otp", otp);

        
        response.sendRedirect("EnterOtp.jsp"); 
    }
}
