package com.real.service;

public interface AddUserService {

	public String adduser(String uid,String uname,String uemail, String uphone, String upass, String utype, String uimage);
	 
	public String deleteuser(String uid);
	
	public String edituser(String uid,String uname,String uemail, String uphone, String upass, String utype, String uimage);

	
	
}
