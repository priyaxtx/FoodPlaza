package com.foodpla.dao;
import java.sql.*;
import java.util.ArrayList;

import com.foodpla.utility.DBUtility;

public class LoginImpl implements LoginDao
{

	
	@Override
	public boolean CustomerLogin(String emailid, String password) 
	{
	Connection cn = DBUtility.getconnection();
	String query = "select password from Customer where email_id = ?";
	String pass = "";
	try
	{
	PreparedStatement prp = cn.prepareStatement(query);
	prp.setString(1,emailid);
	ResultSet r = prp.executeQuery();
	if(r.next())
	{
		pass = r.getString(1);
		
	}
	if(pass.equals(password))
	{
		return true;
		
	}
	else
	{
		return false;
		
	}
	}
	catch(SQLException s)
	{
		s.printStackTrace();
		
	}
	return false;
	}

	@Override
	public boolean CustomerChangePassword(String emailid, String password) 
	{
	Connection cn = DBUtility.getconnection();
	String query = "update Customer set password = ? where email_id = ?";
	try
	{
	PreparedStatement prp = cn.prepareStatement(query);
	prp.setString(1,password);
	prp.setString(2,emailid);
	int flag = prp.executeUpdate();
	if(flag>0)
	{
		return true;
		
	}
	else
	{
		return false;
		
	}
	}
	
	catch(SQLException s)
	{
		s.printStackTrace();
		
	}
	return false;
	}

	
	@Override
	public boolean AdminLogin(String adminid, String adminpassword) 
	{
	Connection cn = DBUtility.getconnection();
	String query = "select adminpassword from Admin where adminid = ?";
	String pass = "";
	try
	{
		PreparedStatement prp= cn.prepareStatement(query);
		prp.setString(1,adminid);
		ResultSet r = prp.executeQuery();
		if(r.next())
		{
			
			pass = r.getString(1);
		}
		if(pass.equals(adminpassword))
		{
			return true;
			
		}
		else
		{
			return false;
			
		}
	}
	catch(SQLException s)
	{
		s.printStackTrace();
		
	}
		return false;
	}

	
	@Override
	public boolean AdminChangepassword(String adminid, String adminpassword) 
	{
		Connection cn =  DBUtility.getconnection();
		String query = "update Admin set adminpassword = ? where adminid = ?";
		try
		{
		PreparedStatement prp  = cn.prepareStatement(query);
		prp.setString(1,adminpassword);
		prp.setString(2,adminid);
		int flag = prp.executeUpdate();
		if(flag>0)
		{
			return true;
			
		}
		else
		{
			return false;
			
		}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return false;
	}

}
