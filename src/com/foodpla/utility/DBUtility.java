package com.foodpla.utility;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtility 
{
public static Connection getconnection()
{
	String username = "root";
	String password = "";
	Connection con =null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplaza",username,password);

	}
	catch(ClassNotFoundException | SQLException e)
	{}
	return con;
}
public static void main(String args[])
{
getconnection();

if(getconnection()!=null)
{
System.out.println("connection established");	
}
else
{
System.out.println("not established");	
}
}
}

