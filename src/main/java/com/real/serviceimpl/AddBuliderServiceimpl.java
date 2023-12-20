package com.real.serviceimpl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddBuilderservice;

public class AddBuliderServiceimpl  implements AddBuilderservice {
	

		@Override
		public String addbuild(String bid, String bname, String bemail, String bphone, String btype, String bimage) {
			String status = "builder Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO builder (bid,bname,bemail,bphone,btype,bimage) VALUES (?,?,?,?,?,?)");
	            ps.setString(1, bid);
	            ps.setString(2, bname);
	            ps.setString(3, bemail);
	            ps.setString(4, bphone);
	            ps.setString(5, btype);
	            ps.setString(5, bimage);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "builder Added Successfully!";
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
		public String deletebuild(String bid) {
			String status = "builder Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM builder WHERE bid = ?");
		        ps.setString(1, bid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "builder Removed Successfully!";
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
		public String editbuild(String bid, String bname, String bemail, String bphone, String btype, String bimage) {
			String status = "builder Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE builder SET bname =?, bemail =?, bphone =?,btype=? ,bimage =? WHERE bid=?");  
		   
		        ps.setString(1, bname);
		        ps.setString(2, bemail);
		        ps.setString(3, bphone);
		        ps.setString(4, btype);
		        ps.setString(5, bimage);
		        ps.setString(6, bid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "builder Updated Successfully!";
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