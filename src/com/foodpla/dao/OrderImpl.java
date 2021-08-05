package com.foodpla.dao;
import java.sql.*;
import java.util.*;
import java.util.Date;

import com.foodpla.pojo.Customer;
import com.foodpla.pojo.Order21020;
import com.foodpla.utility.DBUtility;

public class OrderImpl implements OrderDao
{

	
	@Override
	public boolean AddOrder(String email_id) 
	{
	Connection cn = DBUtility.getconnection();
	String query = "select address from Customer where email_id = ?";
	String add = "";
	int tprice = 0 ;
	Order21020 o = new Order21020();
	String datetime = new Date().toString();
	PreparedStatement prp =null;
	try
	{
	prp = cn.prepareStatement(query);
	prp.setString(1,email_id);
	ResultSet r = prp.executeQuery();
	if(r.next())
	{
		add = r.getString(1);
		
	}
	query = "select sum(totalprice) as finalprice from Cart where email_id = ?";
	 prp = cn.prepareStatement(query);
	prp.setString(1,email_id);
	ResultSet r1 = prp.executeQuery();
	if(r1.next())
	{
		tprice = r1.getInt("finalprice");
		
	}
	query = "insert into Order21020(bookingdatetime,address,email_id,ordertotalprice) values(?,?,?,?)";
	 prp = cn.prepareStatement(query);
	prp.setString(1,datetime);
	prp.setString(2,add);
	prp.setString(3,email_id);
	prp.setInt(4,tprice);
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
	public boolean CancelOrder(int orderid) 
	{
		Connection cn = DBUtility.getconnection();
		String query = "delete from Order21020 where orderid = ?";
try
{
		PreparedStatement prp = cn.prepareStatement(query);
        prp.setLong(1,orderid);
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
		public ArrayList<Order21020> ShowAllOrders() 
		{
		Connection cn = DBUtility.getconnection();
		ArrayList<Order21020> l = new ArrayList<Order21020>();
		String query = "select bookingdatetime,address,email_id,ordertotalprice,orderid from Order21020";
		Order21020 o = null;
		try
		{
			PreparedStatement prp = cn.prepareStatement(query);
			ResultSet r = prp.executeQuery();
			while(r.next())
			{
				o = new Order21020();
				o.setBookingdatetime(r.getString(1));
				o.setAddress(r.getString(2));
				o.setEmail_id(r.getString(3));
				o.setTotalprice(r.getInt(4));
				o.setOrderid(r.getLong(5));
				l.add(o);
			}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return l;
	}

	
	@Override
	public ArrayList<Order21020> ShowAllOrders(String email_id) 
	{
		Connection cn = DBUtility.getconnection();
		ArrayList<Order21020> l = new ArrayList<Order21020>();
		String query = "select bookingdatetime,address,email_id,ordertotalprice,orderid from Order21020 where email_id = ?";
		
		Order21020 o = null;
		try
		{
			PreparedStatement prp = cn.prepareStatement(query);
			prp.setString(1,email_id);
			ResultSet r = prp.executeQuery();
			while(r.next())
			{
				o = new Order21020();
				o.setBookingdatetime(r.getString(1));
				o.setAddress(r.getString(2));
				o.setEmail_id(r.getString(3));
				o.setTotalprice(r.getInt(4));
				o.setOrderid(r.getLong(5));
				l.add(o);
			}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return l;
	}


	
	public Order21020 ShowOrder(long orderid) 
	{
		Connection cn = DBUtility.getconnection();
		String query = "select orderid,email_id,address,ordertotalprice from Order21020 where orderid = ?";
		Order21020 o=null;
		
		try
		{
		PreparedStatement prp = cn.prepareStatement(query);
		prp.setLong(1,orderid);
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			o =  new Order21020();
			o.setOrderid(r.getLong(1));
			o.setEmail_id(r.getString(2));
			o.setAddress(r.getString(3));
			o.setTotalprice(r.getInt(4));
			
		}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
		}

		return o;
			}

}
