package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.real.utility.DBUtil;
import com.real.service.AddCityservice;
import com.real.bean.Addcity;


public class AddCityServiceimpl {

    public String addCity(String cid, String cname, String sid,String sname) {
        String status = "Add city Failed!";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "INSERT INTO city (cid, cname, sid,sname) VALUES (?, ?, ? ,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cid);
            preparedStatement.setString(2, cname);
            preparedStatement.setString(3, sid);
            preparedStatement.setString(4, sname);

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                status = "City added successfully!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return status;
    }

    
    
		public String deletecity(String cid) {
			String status = "city Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM city WHERE cid = ?");
		        ps.setString(1, cid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "city Removed Successfully!";
		        }
		    } catch (SQLException e) {
		        status = "Error: " + e.getMessage();
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}
		
		
		public String editcity(String cid, String cname,String sname) {
			String status = "city Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE city SET cname =?,  sname =? WHERE cid=?");  
		   
		        ps.setString(1, cname);
		        
		        ps.setString(2, sname);
		        ps.setString(3, cid);
		       

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "city Updated Successfully!";
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}
			
}