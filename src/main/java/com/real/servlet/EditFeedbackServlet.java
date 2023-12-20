package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.bean.AddFeedback;
import com.real.serviceimpl.AddFeedbackServiceimpl;
			
@WebServlet("/EditFeedbackServlet")
public class EditFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status1 = "Edit feedback Failed!"; 
        String id= request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String description = request.getParameter("description");
        String status= request.getParameter("status");
        String date = request.getParameter("date");
       
        

        AddFeedback feedback = new AddFeedback();
        feedback.setFid(id);
        feedback.setName(name);
        feedback.setEmail(email);
        feedback.setFdescription(description);
        feedback.setStatus(status);
        feedback.setDate(date);
       
        AddFeedbackServiceimpl dao = new AddFeedbackServiceimpl();
   
        String status2 = dao.editfeedback(id,name,email,description,status,date);

        RequestDispatcher rd = request.getRequestDispatcher("feedbackedit.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}