package com.foodpla.dao;

public interface LoginDao 
{
	boolean CustomerLogin(String emailid,String password);
boolean CustomerChangePassword(String emailid,String password);
boolean AdminLogin(String adminid,String adminpassword);
boolean AdminChangepassword(String adminid,String adminpassword);
}
