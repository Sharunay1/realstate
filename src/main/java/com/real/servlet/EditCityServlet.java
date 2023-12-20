package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.Addcity;
import com.real.serviceimpl.AddCityServiceimpl;
			
@WebServlet("/EditCityServlet")
public class EditCityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit city Failed!"; 
        String id= request.getParameter("id");
        String ucity = request.getParameter("ucity");
        String statename = request.getParameter("statename");
       
        Addcity city = new Addcity();
        city.setCid(id);
        city.setCname(ucity);
        city.setSname(statename);
        
        AddCityServiceimpl dao = new AddCityServiceimpl();
   
        String status1 = dao.editcity(id,ucity,statename);

        RequestDispatcher rd = request.getRequestDispatcher("cityedit.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}