package com.real.service;

public interface AddBuilderservice {

	public String addbuild(String bid,String bname,String bemail, String bphone, String btype,String bimage);
	 
	public String deletebuild(String bid);
	
	public String editbuild(String bid,String bname,String bemail, String bphone, String btype,String bimage);

}
