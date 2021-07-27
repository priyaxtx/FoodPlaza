package com.foodpla.test;
import java.util.*;

import com.foodpla.dao.CustomerImpl;
import com.foodpla.pojo.Customer;
public class CustomerTest 
{
public static void main(String args[])
{
Scanner sc= new Scanner(System.in);
String name = "",emailid = "";
boolean result =true;
Customer c = new Customer();
CustomerImpl ci = new CustomerImpl();
ArrayList<Customer>l = new ArrayList<Customer>();
while(true)
{
System.out.println("1)register customer\n2)update customer\n3)delete customer\n4)show all customer\n5)show profile\n");
System.out.println("Enter your choice");
int choice = sc.nextInt();
switch(choice)
{
case 1:
System.out.println("Enter your name");
c.setName(sc.next());
System.out.println("Enter your email id");
c.setEmail_id(sc.next());

System.out.println("Enter your password");
c.setPassword(sc.next());
System.out.println("Enter your contact number");
c.setContact(sc.nextInt());
System.out.println("Enter your address");
c.setAddress(sc.next());
result = ci.RegisterCustomer(c);
if(result)
{
System.out.println("successfull");	
}
else
{
System.out.println("try again");	
}
break;

case 3:
	System.out.println("Enter email id:");
	emailid = sc.next();
	result = ci.DeleteCustomer(emailid);
	if(result)
	{
		System.out.println("deleted");
		
	}
	else
	{
		System.out.println("try again");
		
	}
	break;
case 2:
	System.out.println("Enter your name");
	c.setName(sc.next());
	System.out.println("Enter your email id");
	c.setEmail_id(sc.next());
	System.out.println("Enter your password");
	c.setPassword(sc.next());
	System.out.println("Enter your contact number");
	c.setContact(sc.nextInt());
	System.out.println("Enter your address");
	c.setAddress(sc.next());
	result = ci.UpdateCustomer(c);
	if(result)
	{
	System.out.println("successfull");	
	}
	else
	{
	System.out.println("try again");	
	}
	break;
case 4:
	l = ci.ShowAllCustomer();
	if(l==null)
	{
		System.out.println("no data available");
		
	}
	else
	{
		for(Customer j:l)
		{
			System.out.println(j);
			
		}
		
	}
	break;
case 5:
	System.out.println("Enter your email id");
	emailid = sc.next();
	c = ci.ShowProfile(emailid);
	if(c==null)
	{
		System.out.println("invalid email id");
	}
	else
	{
		System.out.println(c);
		
	}
	break;
	default:
		System.out.println("Enter valid  choice");
		break;
	
}	
}
}
}