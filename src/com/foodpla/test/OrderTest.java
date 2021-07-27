package com.foodpla.test;
import java.util.*;

import com.foodpla.dao.OrderImpl;
import com.foodpla.pojo.Customer;
import com.foodpla.pojo.Order21020;
public class OrderTest 
{
public static void main(String args[])
{
	Order21020 o = new Order21020();
	OrderImpl oi = new OrderImpl();
boolean result ;
ArrayList<Order21020> l = new ArrayList<Order21020>();
	Scanner sc = new Scanner(System.in);
while(true)
{
System.out.println("1)add order\n2)cancel order\n3)show all order\n4)show order of particular customer\n 5)show order\n");
System.out.println("Enter your choice\n");
int choice = sc.nextInt();
switch(choice)
{
case 1: System.out.println("Enter email id");
String eid = sc.next();
result = oi.AddOrder(eid);
if(result)
{
System.out.println("order placed successfully");	
}
else
{
System.out.println("try again");	
}
break;
case 2:
	System.out.println("Enter order id");
	break;
	
	
case 3:
	l = oi.ShowAllOrders();
	if(l==null)
	{
		System.out.println("no data available");
		
	}
	else
	{
		for(Order21020 j:l)
		{
			System.out.println(j);
			
		}
		
	}
	break;
	
case 5:
	System.out.println("enter order id");
	int orderid = sc.nextInt();
	o = oi.ShowOrder(orderid);
	if(o==null)
	{
		System.out.println("invalid order id or id doesnt consist");
	}
	else
	{
		System.out.println(o);
		
	}
	break;
	default:
		System.out.println("Enter valid  choice");
		break;
}
}

}
}
