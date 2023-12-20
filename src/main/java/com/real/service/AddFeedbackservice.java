package com.real.service;

public interface AddFeedbackservice {

	public String addfeedback(String fid,String name,String email,String fdescription, String status, String date);
	 
	public String deletefeedback(String fid);
	
	public String editfeedback(String fid,String name,String email,String fdescription, String status, String date);

}
