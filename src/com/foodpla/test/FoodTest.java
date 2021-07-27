package com.foodpla.test;
import java.util.*;

import com.foodpla.dao.FoodImpl;
import com.foodpla.pojo.Food;
public class FoodTest 
{
	
public static void main(String args[])
{
	Food f = new Food();
	boolean result;
	ArrayList<Food>l = new ArrayList<Food>();
	FoodImpl fi = new FoodImpl();
	Scanner sc = new Scanner(System.in);
while(true)
{
	System.out.println("1)add food\n2)update food\n3)delete food\n4)show all food\n5)search by type\n6)search by id\n7)search by category\n");
	System.out.println("Enter choice");

int choice = sc.nextInt();
FoodTest ft = new FoodTest();
switch(choice)
{
case 1:System.out.println("Enter food name");
f.setFoodname(sc.next());
System.out.println("Enter food category");
f.setCategory(sc.next());
System.out.println("Enter food type");
f.setType(sc.next());
System.out.println("Enter food description");
f.setDescription(sc.next());
System.out.println("Enter food price");
f.setPrice(sc.nextInt());
result = fi.AddFood(f);
if(result)
{
	System.out.println("food added successfully");
	
}
else
{
	
	System.out.println("try again");
}
break;
case 2:
	System.out.println("Enter foodid");
	f.setFoodid(sc.nextInt());
	System.out.println("Enter food name");
	f.setFoodname(sc.next());
	System.out.println("Enter food category");
	f.setCategory(sc.next());
	System.out.println("Enter food type");
	f.setType(sc.next());
	System.out.println("Enter food description");
	f.setDescription(sc.next());
	System.out.println("Enter food price");
	f.setPrice(sc.nextInt());
	result =fi.UpdateFood(f);
	if(result)
	{
		System.out.println("food updated successfully");
		
	}
	else
	{
		
		System.out.println("try again");
	}
	break;
case 3:System.out.println("Enter foodid");
int foodid = sc.nextInt();
f.setFoodid(foodid);
result = fi.DeleteFood(foodid);
if(result)
{
System.out.println("food deleted successfulyy");	
}
else
{
System.out.println("try again");	
}
	break;
case 4:l = fi.ShowAllFood();
if(l==null)
{
System.out.println("no data avilable");	
}
else
{
for(Food r:l)
{
System.out.println(r);	
}
}

	break;
case 5:System.out.println("Enter type of food");
String ftype = sc.next();
l = fi.SearchFoodByTypes(ftype);
if(l==null)
{
System.out.println("no data avilable");	
}
else
{
for(Food p:l)
{
System.out.println(p);	
}
}

	break;
case 6:System.out.println("Enter food name");
int fid = sc.nextInt();
f = fi.searchByFoodId(fid);
if(f==null)
{
System.out.println("no data avilable");	
}
else
{
System.out.println(f);	
}
	break;
case 7:
	System.out.println("Enter food category");
	String cat = sc.next();
	l = fi.SearchFoodByCategory(cat);
	if(l==null)
	{
		System.out.println("no data avilable");
		
	}
	else
	{
		for(Food q:l)
		{
			System.out.println(q);
			
		}
		
	}
	break;
}
}
}	
}
