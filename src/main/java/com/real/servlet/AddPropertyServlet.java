package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.serviceimpl.AddPropertyServiceimpl;

@WebServlet("/AddPropertyServlet")
public class AddPropertyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status1 = "Add property Failed!";

        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String ptype = request.getParameter("ptype");
        String stype = request.getParameter("stype");
        String bhk = request.getParameter("bhk");
        String bed = request.getParameter("bed");
        String bath = request.getParameter("bath");
        String balc = request.getParameter("balc");
        String kitc = request.getParameter("kitc");
        String hall = request.getParameter("hall");
        String totalfl = request.getParameter("totalfl");
        String asize = request.getParameter("asize");
        String price = request.getParameter("price");
        String loc = request.getParameter("loc");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String feature = request.getParameter("feature");
        String aimage = request.getParameter("aimage");
        String aimage1 = request.getParameter("aimage1");
        String aimage2 = request.getParameter("aimage2");
        String aimage3 = request.getParameter("aimage3");
        String aimage4 = request.getParameter("aimage4");
        String uid = request.getParameter("uid");
        String status = request.getParameter("status");
        String fimage = request.getParameter("fimage");
        String fimage1 = request.getParameter("fimage1");
        String fimage2 = request.getParameter("fimage2");
        String totalfloor = request.getParameter("totalfloor");
        String date = request.getParameter("date");

        AddPropertyServiceimpl addPropertyService = new AddPropertyServiceimpl();
        status = addPropertyService.addproperty(id, title, content, ptype,  stype,bhk, bed, bath, balc,
        		kitc, hall, totalfl, asize, price, loc, city, state, feature, aimage, aimage1, aimage2, aimage3,
        		aimage4, uid, status, fimage, fimage1, fimage2, totalfloor, date);

        RequestDispatcher rd = request.getRequestDispatcher("propertyadd.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
