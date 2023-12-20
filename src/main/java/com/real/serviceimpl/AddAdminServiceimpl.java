package com.real.serviceimpl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddAdminservice;

public class AddAdminServiceimpl  implements AddAdminservice {
	
		@Override
		public String addadmin(String aid, String auser, String aemail, String apass, String aphone) {
			String status = "admin Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO admin (aid,auser,aemail,apass,aphone) VALUES (?,?,?,?,?)");
	            ps.setString(1, aid);
	            ps.setString(2, auser);
	            ps.setString(3, aemail);
	            ps.setString(4, apass);
	            ps.setString(5, aphone);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "admin Added Successfully!";
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
		public String deleteadmin(String aid) {
			String status = "admin Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM admin WHERE aid = ?");
		        ps.setString(1, aid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "admin Removed Successfully!";
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