package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.real.bean.AddState;
import com.real.serviceimpl.AddStateServiceimpl;
			
@WebServlet("/EditStateServlet")
public class EditStateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit state Failed!"; 
        String id = request.getParameter("id");
        String ustate = request.getParameter("ustate");
       
        

        AddState state = new AddState();
        state.setSid(id);
        state.setSname(ustate);
       

        AddStateServiceimpl dao = new AddStateServiceimpl();
        String status1 = dao.editstate(id,ustate);

        RequestDispatcher rd = request.getRequestDispatcher("stateedit.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}