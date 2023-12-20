package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddFeedbackservice;

public class AddFeedbackServiceimpl  implements AddFeedbackservice {
	
		@Override
		public String addfeedback(String fid, String name, String email, String fdescription, String status, String date) {
			String sta = "feedback Adding Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		    	ps = con.prepareStatement("INSERT INTO feedback (fid,name,email,fdescription,status,date) VALUES (?,?,?,?,?,?)");
		        ps.setString(1, fid);
		        ps.setString(2, name);
		        ps.setString(3, email);
		        ps.setString(4, fdescription);
		        ps.setString(5, status);
		        ps.setString(6, date);
		     

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "feedback Added Successfully!";
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

		
		@Override
		public String editfeedback(String fid, String name, String email, String fdescription, String status, String date) {
			String sta = "feedback Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE feedback SET name=?,email, fdescription =?, status =?,date=?  WHERE fid=?");  
		   
		        ps.setString(1, name);
		        ps.setString(2, email);
		        ps.setString(3, fdescription);
		        ps.setString(4, status);
		        ps.setString(5, date);
		        ps.setString(6, fid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "feedback Updated Successfully!";
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}

	@Override
	public String deletefeedback(String fid) {
		String status = "feedback Removal Failed!";
	
	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;
	
	    try {
	        ps = con.prepareStatement("DELETE FROM feedback WHERE fid = ?");
	        ps.setString(1, fid);
	
	        int k = ps.executeUpdate();
	
	        if (k > 0) {
	            status = "feedback Removed Successfully!";
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
}