package com.real.serviceimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.real.utility.DBUtil;
import com.real.service.AddPropertyservice;

public class AddPropertyServiceimpl  implements AddPropertyservice {

		@Override
		public String addproperty(String pid, String title, String pcontent, String type, String bhk, String stype,
				String bedroom, String bathroom, String balcony, String kitchen, String hall, String floor, String size,
				String price, String location, String city, String state, String feature, String pimage, String pimage1,
				String pimage2, String pimage3, String pimage4, String uid, String status, String mapimage,
				String topmapimage, String groundmapimage, String totalfloor, String date) {
			String sta = "property Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO property (pid,title,pcontent,type,bhk,stype,bedroom,bathroom,balcony,kitchen,hall,floor"
	        			+ ",size,price,location,city,state,feature,pimage,pimage1,pimage2,pimage3,pimage4,uid,status,mapimage,topmapimage,groundmapimage"
	        			+ ",totalfloor,date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	            ps.setString(1, pid);
	            ps.setString(2, title);
	            ps.setString(3, pcontent);
	            ps.setString(4, type);
	            ps.setString(5, bhk);
	            ps.setString(6, stype);
	            ps.setString(7, bedroom);
	            ps.setString(8, bathroom);
	            ps.setString(9, balcony);
	            ps.setString(10, kitchen);
	            ps.setString(11, hall);
	            ps.setString(12, floor);
	            ps.setString(13, size);
	            ps.setString(14, price);
	            ps.setString(15, location);
	            ps.setString(16, city);
	            ps.setString(17, state);
	            ps.setString(18, feature);
	            ps.setString(19, pimage);
	            ps.setString(20, pimage1);
	            ps.setString(21, pimage2);
	            ps.setString(22, pimage3);
	            ps.setString(23, pimage4);
	            ps.setString(24, uid);
	            ps.setString(25, status);
	            ps.setString(26, mapimage);
	            ps.setString(27, topmapimage);
	            ps.setString(28, groundmapimage);
	            ps.setString(29, totalfloor);
	            ps.setString(30, date);
	           
	       
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "property Added Successfully!";
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
		public String deleteproperty(String pid) {
			String status = "property Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM property WHERE pid = ?");
		        ps.setString(1, pid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "property Removed Successfully!";
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
		public String editproperty(String pid, String title, String pcontent, String type, String bhk, String stype,
				String bedroom, String bathroom, String balcony, String kitchen, String hall, String floor, String size,
				String price, String location, String city, String state, String feature, String pimage, String pimage1,
				String pimage2, String pimage3, String pimage4, String uid, String status, String mapimage,
				String topmapimage, String groundmapimage, String totalfloor, String date) {
			String sta = "property Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE property SET title =?, pcontent =?, type =?,bhk=? ,stype =?,bedroom =?,bathroom =?,balcony =?,kitchen =?,hall =?,"
		        		+ "floor =?,size =?,price =?,location=?,city =?,state =?,feature =?,pimage =?,pimage1 =?,pimage2 =?,pimage3 =?,pimage4 =?,uid=?,"
		        		+ "status=?,mapimage=?,topmapimage=?,groundmapimage =?,totalfloor =?,date =? WHERE pid=?");  
		   
		        ps.setString(1, title);
		        ps.setString(2, pcontent);
		        ps.setString(3, type);
		        ps.setString(4, bhk);
		        ps.setString(5, stype);
		        ps.setString(6, bedroom);
		        ps.setString(7, bathroom);
		        ps.setString(8, balcony);
		        ps.setString(9, kitchen);
		        ps.setString(10, hall);
		        ps.setString(11, floor);
		        ps.setString(12, size);
		        ps.setString(13, price);
		        ps.setString(14, location);
		        ps.setString(15, city);
		        ps.setString(16, state);
		        ps.setString(17, feature);
		        ps.setString(18, pimage);
		        ps.setString(19, pimage1);
		        ps.setString(20, pimage2);
		        ps.setString(21, pimage3);
		        ps.setString(22, pimage4);
		        ps.setString(23, uid);
		        ps.setString(24, status);
		        ps.setString(25, mapimage);
		        ps.setString(26, topmapimage);
		        ps.setString(27, groundmapimage);
		        ps.setString(28, totalfloor);
		        ps.setString(29, date);
		        ps.setString(30, pid);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "property Updated Successfully!";
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

			