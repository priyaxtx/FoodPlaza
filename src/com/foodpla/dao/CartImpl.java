package com.foodpla.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.foodpla.pojo.Cart;
import com.foodpla.utility.DBUtility;

public class CartImpl implements CartDao 
{
	@Override
	public boolean AddCart(Cart ct) 
	{
		Connection cn = DBUtility.getconnection();
		
		
		String fname = "";
		int fprice = 0,totalPrice1 = 0,fid = 0;
		PreparedStatement prp = null;
		String query ="select foodname,price,foodid from Food where foodid = ? ";
		try
		{
		prp = cn.prepareStatement(query);
		prp.setLong(1,ct.getFoodid());
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			fname = r.getString(1);
			fprice = r.getInt(2);
			fid = r.getInt(3);
		}
		totalPrice1 = fprice*ct.getQuantity();
		query = "insert into Cart(email_id,foodname,addons,quantity,totalprice,foodid) values(?,?,?,?,?,?)";
		prp = cn.prepareStatement(query);
		prp.setString(1,ct.getEmail_id());
		prp.setString(2,fname);
		prp.setString(3,ct.getAddons());
		prp.setInt(4,ct.getQuantity());
		prp.setInt(5,totalPrice1);
		prp.setInt(6,fid);
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
public boolean ClearCart(String email_id) 
{
Connection cn = DBUtility.getconnection();
String query = "delete from Cart where email_id = ?";
try
{
PreparedStatement prp = cn.prepareStatement(query);
prp.setString(1,email_id);
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
public ArrayList<Cart> ShowAllCart() 
{
	Connection cn = DBUtility.getconnection();
	ArrayList<Cart> l = new ArrayList<Cart>();
	String query = "select email_id, foodname,addons,cartid,quantity,totalprice,foodid from Cart ";
	 Cart c=null;
	try
	{
		PreparedStatement prp = cn.prepareStatement(query);
	 ResultSet r = prp.executeQuery();
	 while(r.next())
	 {
		c = new Cart();
		c.setEmail_id(r.getString(1));
		 c.setFoodname(r.getString(2));
		 c.setAddons(r.getString(3));
		 c.setCartid(r.getInt(4));
		 c.setQuantity(r.getInt(5));
		 c.setTotalprice(r.getInt(6));
		 c.setFoodid(r.getInt(7));
		 l.add(c);
	 }
	}
	catch(SQLException s)
	{
		s.printStackTrace();
		
	}
	return l;
}


public ArrayList<Cart> Showcart(String email_id) 
{
Connection cn = DBUtility.getconnection();
ArrayList<Cart> l = new ArrayList<Cart>();
String query = "select foodid ,foodname,addons,quantity,totalprice,cartid,email_id from Cart where email_id = ?";
Cart c = null;
try
{
PreparedStatement prp = cn.prepareStatement(query);
prp.setString(1,email_id);
ResultSet r = prp.executeQuery();
while(r.next())
{
	c = new Cart();
	 c.setFoodname(r.getString(2));
	 c.setAddons(r.getString(3));
	 c.setQuantity(r.getInt(4));
	 c.setTotalprice(r.getInt(5));
	 c.setCartid(r.getInt(6));
	 c.setFoodid(r.getInt(1));
	 c.setEmail_id(r.getString(7));
	 l.add(c);
}
}
catch(SQLException s)
{
s.printStackTrace();	
}
	return l;
}



public boolean DeleteCart(int cartid) 
{
	
	Connection cn = DBUtility.getconnection();
	String query = "delete from Cart where cartid = ?";
	try
	{
	PreparedStatement prp = cn.prepareStatement(query);
	prp.setInt(1,cartid);
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

