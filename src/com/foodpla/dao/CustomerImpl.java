package com.foodpla.dao;

import java.sql.*;
import java.util.ArrayList;

import com.foodpla.pojo.Customer;
import com.foodpla.utility.DBUtility;

public class CustomerImpl implements CustomerDao 
{
@Override
public boolean RegisterCustomer(Customer c)
{
	Connection cn = DBUtility.getconnection();
	String query = "insert into Customer(name,password,email_id,address,contact)values(?,?,?,?,?)";
	try
	{
	PreparedStatement prp= cn.prepareStatement(query);
	prp.setString(1,c.getName());
	prp.setString(2,c.getPassword());
	prp.setString(3,c.getEmail_id());
	prp.setString(4,c.getAddress());
    prp.setInt(5,c.getContact());
	int f = prp.executeUpdate();
	if(f>0)
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
public boolean UpdateCustomer(Customer c) 
{
	Connection cn = DBUtility.getconnection();
	String query = "update Customer set name = ?,password = ?,address = ?,contact = ? where email_id = ?";
	try
	{
	PreparedStatement prp = cn.prepareStatement(query);
	prp.setString(1,c.getName());
	prp.setString(2,c.getPassword());
	prp.setString(5, c.getEmail_id());
	prp.setString(3,c.getAddress());
	prp.setInt(4,c.getContact());
	int f = prp.executeUpdate();
	if(f>0)
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
public boolean DeleteCustomer(String email_id) 
{
Connection cn = DBUtility.getconnection();
String query = "delete from Customer where email_id = ?";
try
{
PreparedStatement prp = cn.prepareStatement(query);
prp.setString(1, email_id);
int f = prp.executeUpdate();
if(f>0)
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
public ArrayList<Customer> ShowAllCustomer() 
{
	Connection cn = DBUtility.getconnection();
	ArrayList<Customer>l = new ArrayList<Customer>();
	String query = "select name,password,email_id,address,contact from Customer";
try
{
	PreparedStatement prp = cn.prepareStatement(query);
ResultSet r = prp.executeQuery();

while(r.next())
{
Customer c = new Customer();
c.setName(r.getString(1));
c.setPassword(r.getString(2));
c.setEmail_id(r.getString(3));
c.setAddress(r.getString(4));
c.setContact(r.getInt(5));
l.add(c);
}
}
catch(SQLException s)
{
s.printStackTrace();	
}

	return l;
	
}

@Override
public Customer ShowProfile(String email_id) 
{
Connection cn = DBUtility.getconnection();
String query = "select name,password,email_id,address,contact from Customer where email_id = ?";
Customer c =null;
try
{
PreparedStatement prp = cn.prepareStatement(query);
prp.setString(1,email_id);
ResultSet r = prp.executeQuery();
while(r.next())
{
	c =  new Customer();
	c.setName(r.getString(1));
	c.setPassword(r.getString(2));
	c.setEmail_id(r.getString(3));
	c.setAddress(r.getString(4));
	c.setContact(r.getInt(5));
}
}
catch(SQLException s)
{
	s.printStackTrace();
}

return c;
}
}
