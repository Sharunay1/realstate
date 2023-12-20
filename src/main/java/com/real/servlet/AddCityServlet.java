package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.serviceimpl.AddCityServiceimpl;

@WebServlet("/AddCityServlet")
public class AddCityServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Add city Failed!";
        
        String id = request.getParameter("id");
        String cityname = request.getParameter("cityname");
        String stateid = request.getParameter("stateid");
        String statename = request.getParameter("statename");

        AddCityServiceimpl city = new AddCityServiceimpl();
        status = city.addCity(id, cityname, stateid,statename);

        // Assuming you have a JSP page named "addcity.jsp" to display the result
        RequestDispatcher rd = request.getRequestDispatcher("cityadd.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
