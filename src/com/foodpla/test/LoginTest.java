package com.foodpla.test;

import java.util.Scanner;

import com.foodpla.dao.LoginImpl;
import com.foodpla.pojo.Customer;

public class LoginTest 
{
	
public static void main(String args[])
{
	Customer c = new Customer();
	LoginImpl li = new LoginImpl();
	String eid="",pass="";
	boolean result;
	Scanner sc = new Scanner(System.in);
	while(true)
	{
	System.out.println("1)Customer login\n2)Customer change password\n3)Admin login\n4)Admin change password\n");
	System.out.println("Enter your choice");
	int choice = sc.nextInt();
	switch(choice)
	{
	case 1:
    System.out.println("Enter email id");
    eid = sc.next();
    System.out.println("Enter password");
    pass=  sc.next();
    result = li.CustomerLogin(eid, pass);
    if(result)
    {
    	System.out.println("logg in successfull");
    	
    }
    else
    {
    	System.out.println("try again");
    	
    }
    break;
	case 2:
		System.out.println("Enter email id");
	    eid = sc.next();
	    System.out.println("Enter new password");
	    pass=  sc.next();
	    result = li.CustomerChangePassword(eid, pass);
	    if(result)
	    {
	    	System.out.println("password change succeefull");
	    	
	    }
	    else
	    {
	    	System.out.println("try again");
	    
	    }
	    break;
	case 3:
		System.out.println("Enter admin email id");
		eid = sc.next();
		System.out.println("Enter admin password");
		pass = sc.next();
		result = li.AdminLogin(eid, pass);
		if(result)
		{
			System.out.println("logged in");
			
		}
		else
		{
			System.out.println("try again");
			
		}
		break;
	case 4:
		System.out.println("Enter adminid");
		eid = sc.next();
		System.out.println("Enter new password");
		pass = sc.next();
		result = li.AdminChangepassword(eid, pass);
		if(result)
		{
			System.out.println("password changed");
		}
		else
		{
			System.out.println("try again");
			
		}
	}
			
}
}
}