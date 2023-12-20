package com.real.service;

public interface AddPropertyservice {
	
	public String addproperty(String pid,String title,String pcontent, String type, String bhk,String stype,String bedroom,
			String bathroom, String balcony, String kitchen,String hall,String floor,String size, String price, String location,String city,
			String state,String feature,String pimage,String pimage1,String pimage2, String pimage3, String pimage4,
			String uid,String status,String mapimage,String topmapimage, String groundmapimage, String totalfloor,String date);
	 
	public String deleteproperty(String pid);
	
	public String editproperty(String pid,String title,String pcontent, String type, String bhk,String stype,String bedroom,
			String bathroom, String balcony, String kitchen,String hall,String floor,String size, String price, String location,String city,
			String state,String feature,String pimage,String pimage1,String pimage2, String pimage3, String pimage4,String uid,String status,
			String mapimage,String topmapimage, String groundmapimage, String totalfloor,String date);

}
