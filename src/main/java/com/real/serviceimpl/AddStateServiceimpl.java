package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddStateservice;

public class AddStateServiceimpl  implements AddStateservice {
	
		@Override
		public String addstate(String sid, String sname) {
			String status = "state Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO state (sid,sname) VALUES (?,?)");
	            ps.setString(1, sid);
	            ps.setString(2, sname);
	           
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "state Added Successfully!";
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
		public String deletestate(String sid) {
			String status = "state Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM state WHERE sid = ?");
		        ps.setString(1, sid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "state Removed Successfully!";
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
		public String editstate(String sid, String sname) {
			String status = "state Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE state SET sname =?, sid =? WHERE sid=?");  
		   
		        ps.setString(1, sname);
		        ps.setString(2, sid);
		        

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "state Updated Successfully!";
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