package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddAgentservice;

public class AddAgentServiceimpl  implements AddAgentservice {
	
		@Override
		public String addagent(String agentid, String agentname, String agentemail, String agentphone, String agenttype,
				String agentimage) {
			String status = "agent Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO agent (agentid,agentname,agentemail,agentphone,agenttype,agentimage) VALUES (?,?,?,?,?,?)");
	            ps.setString(1, agentid);
	            ps.setString(2, agentname);
	            ps.setString(3, agentemail);
	            ps.setString(4, agentphone);
	            ps.setString(5, agenttype);
	            ps.setString(6, agentimage);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "agent Added Successfully!";
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
		public String deleteagent(String agentid) {
			String status = "agent Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM agent WHERE agentid = ?");
		        ps.setString(1, agentid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "agent Removed Successfully!";
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