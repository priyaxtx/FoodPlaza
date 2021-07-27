package com.foodpla.dao;
import java.sql.*;
import java.util.ArrayList;

import com.foodpla.pojo.Food;
import com.foodpla.utility.DBUtility;

public class FoodImpl implements FoodDao
{

	
	@Override
	public boolean AddFood(Food fd) 
	{
Connection cn = DBUtility.getconnection();
String query = "insert into Food(foodname,type,category,description,price) values(?,?,?,?,?)";
try
{
PreparedStatement prp = cn.prepareStatement(query);
prp.setString(1,fd.getFoodname());
prp.setString(2,fd.getType());
prp.setString(3,fd.getCategory());
prp.setString(4,fd.getDescription());
prp.setInt(5,fd.getPrice());
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
	public boolean UpdateFood(Food fd) 
	{
	Connection cn = DBUtility.getconnection();
	String query = "update Food set foodname = ?,type = ?,category = ?,description = ?,price = ? where foodid = ?";
	try
	{
		PreparedStatement prp = cn.prepareStatement(query);
		prp.setString(1,fd.getFoodname());
		prp.setString(2,fd.getType());
		prp.setString(3,fd.getCategory());
		prp.setString(4,fd.getDescription());
		prp.setInt(5,fd.getPrice());
		prp.setLong(6,fd.getFoodid());
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
	public boolean DeleteFood(int foodid) 
	{
		Connection cn = DBUtility.getconnection();
		String query = "delete from Food where foodid = ?";
		try
		{
			PreparedStatement prp = cn.prepareStatement(query);
			prp.setLong(1,foodid);
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
	public ArrayList<Food> ShowAllFood() 
	{
		Connection cn = DBUtility.getconnection();
		ArrayList<Food>l = new ArrayList<Food>();
		String query = "select foodname,type,category,description,price,foodid from Food ";
		
		try
		{
		PreparedStatement prp = cn.prepareStatement(query);
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			Food f = new Food();
			f.setFoodname(r.getString(1));
			f.setType(r.getString(2));
			f.setCategory(r.getString(3));
			f.setDescription(r.getString(4));
			f.setPrice(r.getInt(5));
			f.setFoodid(r.getLong(6));
			l.add(f);
		}
		
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return l;
	}

	@Override
	public ArrayList<Food> SearchFoodByTypes(String type) 
	{
		Connection cn= DBUtility.getconnection();
		ArrayList<Food>l = new ArrayList<Food>();
		String query = "select foodname,category,description,price,foodid,type from Food where type = ?";
		
		try
		{
		PreparedStatement prp = cn.prepareStatement(query);
		prp.setString(1,type);
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			Food f= new Food();
			
			f.setFoodname(r.getString(1));
			f.setFoodid(r.getLong(5));
			f.setCategory(r.getString(2));
			f.setDescription(r.getString(3));
			f.setPrice(r.getInt(4));
			f.setType(r.getString(6));
			l.add(f);
		}
		}
		
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return l;
	}

	@Override
	public Food searchByFoodId(int foodid) 
	{
		Connection cn = DBUtility.getconnection();
		String query = "select foodname,type,category,description,price,foodid from Food where foodid = ?";
		Food f =null;
		try
		{
		PreparedStatement prp = cn.prepareStatement(query);
		prp.setInt(1,foodid);
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			f = new Food();
			f.setFoodname(r.getString(1));
			f.setType(r.getString(2));
			f.setFoodid(r.getLong(6));
			f.setCategory(r.getString(3));
			f.setDescription(r.getString(4));
			f.setPrice(r.getInt(5));
		}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return f;
	}

	
	@Override
	public ArrayList<Food> SearchFoodByCategory(String category) 
	{
		Connection cn = DBUtility.getconnection();
		ArrayList<Food>l = new ArrayList<Food>();
		String query = "select foodname,type,description,category,price,foodid from Food where category = ?";
		
		try
		{
		PreparedStatement prp = cn.prepareStatement(query);
		prp.setString(1,category);
		ResultSet r = prp.executeQuery();
		while(r.next())
		{
			Food f = new Food();
			f.setType(r.getString(2));
			f.setFoodid(r.getInt(6));
			f.setFoodname(r.getString(1));
			f.setDescription(r.getString(3));
			f.setCategory(r.getString(4));
			f.setPrice(r.getInt(5));
			l.add(f);
			
		}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
			
		}
		return l;
	}

}
