package com.real.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.bean.AddProperty;
import com.real.serviceimpl.AddPropertyServiceimpl;

@WebServlet("/EditPropertyServlet")
public class EditPropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String statusMessage = "Edit property Failed!";
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

       
        AddProperty property = new AddProperty();
        property.setPid(id);
        property.setTitle(title);
        property.setPcontent(content);
        property.setType(ptype);
        property.setStype(stype);
        property.setBhk(bhk);
        property.setBedroom(bed);
        property.setBathroom(bath);
        property.setBalcony(balc);
        property.setKitchen(kitc);
        property.setHall(hall);
        property.setFloor(totalfl);
        property.setSize(asize);
        property.setPrice(price);
        property.setLocation(loc);
        property.setCity(city);
        property.setState(state);
        property.setFeature(feature);
        property.setPimage(aimage);
        property.setPimage1(aimage1);
        property.setPimage2(aimage2);
        property.setPimage3(aimage3);
        property.setPimage4(aimage4);
        property.setUid(uid);
        property.setStatus(status);
        property.setMapimage(fimage);
        property.setTopmapimage(fimage1);
        property.setGroundmapimage(fimage2);
        property.setTotalfloor(totalfloor);
        property.setDate(date);

        AddPropertyServiceimpl editPropertyService = new AddPropertyServiceimpl();
        statusMessage = editPropertyService.editproperty(id,title,content,ptype,stype,bhk,bed,bath,balc,kitc,
        		hall,totalfl,asize,price,loc,city,state,feature,aimage,aimage1,aimage2,aimage3,aimage4,uid,status,fimage,fimage1,fimage2,totalfloor,date);

        RequestDispatcher rd = request.getRequestDispatcher("propertyedit.jsp?message=" + statusMessage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
