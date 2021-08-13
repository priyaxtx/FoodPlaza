package com.foodpla.pojo;

public class Admin 
{
	
private String adminid,adminpassword;

public String getAdminid() {
	return adminid;
}

public void setAdminid(String adminid) {
	this.adminid = adminid;
}

public String getAdminpassword() {
	return adminpassword;
}

public void setAdminpassword(String adminpassword) {
	this.adminpassword = adminpassword;
}

@Override
public String toString() {
	return "Admin [adminid=" + adminid + ", adminpassword=" + adminpassword + "]";
}

}
