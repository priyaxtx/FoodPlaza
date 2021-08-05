package com.foodpla.test;
import java.util.*;

import com.foodpla.dao.CartImpl;
import com.foodpla.pojo.Cart;
public class CartTest 
{
public static void main(String args[])
{
	boolean result;
	Cart ct = new Cart();
	CartImpl cil = new CartImpl();
	Scanner sc = new Scanner(System.in);
	ArrayList<Cart>l = new ArrayList<Cart>();
	while(true)
	{
System.out.println("1)add cart\n2)delete cart\n3)show all acrt\n4)show cart");
System.out.println("Enter choice\n");
int choice = sc.nextInt();
switch(choice)
{
case 1:
	System.out.println("enter food id");
	int fid = sc.nextInt();
	ct.setFoodid(fid);
	System.out.println("Enter email id");
	ct.setEmail_id(sc.next());
	System.out.println("Enter addons if any");
	ct.setAddons(sc.next());
	System.out.println("Enter quantity");
	ct.setQuantity(sc.nextInt());
	result = cil.AddCart(ct);
	if(result)
	{
		System.out.println("Added successfully");
	}
	else
	{
		System.out.println("try again");
		
	}
	break;
//case 2:
//	System.out.println("Enter email id");
//String eid = sc.next();
//result = cil.DeleteCart(eid);
//if(result)
//{
//System.out.println("successfull");	
//}
//else
//{
//System.out.println("try again");	
//}
//break;
	//this code has been commented
case 3:
	
	l = cil.ShowAllCart();
	if(l==null)
	{
		System.out.println("no data avilable");
		
	}
	else
	{
		for(Cart w:l)
		{
			System.out.println(w);
		}
		
	}
	break;
case 4:
	System.out.println("Enter emailid");
	String cmail = sc.next();
	l = cil.Showcart(cmail);
	if(l==null)
	{
	System.out.println("no data avilable");	
	}
	else
	{
		for(Cart m:l)
		{
			System.out.println(m);
		}
	}

}
	
	}
}
}
