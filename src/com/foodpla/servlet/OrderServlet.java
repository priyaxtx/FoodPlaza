package com.foodpla.servlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodpla.dao.OrderImpl;
import com.foodpla.pojo.Order21020;
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet
{
	
	OrderImpl odi = new OrderImpl();
	Order21020 o = new Order21020();
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
{
	String act1 = req.getParameter("method");
	String user = req.getParameter("user");
	HttpSession session= req.getSession();
	if(act1!=null && act1.equals("add"))
	{
		
		boolean placeorder = odi.AddOrder(user);
//		ArrayList<Order21020> lo = new ArrayList<Order21020>();
		if(placeorder)
		{
			
			List<Order21020> lo = odi.ShowAllOrders(user);
			session.setAttribute("orderlist",lo);
			session.setAttribute("user",user);
			resp.sendRedirect("Orders.jsp");
			
		}
		else
		{
			
			resp.sendRedirect("fail.jsp");
		}
		
		
		
		
	}
	
	else if(act1!=null && act1.equals("showindividual"))
	{
		
		
		
		long orderid = Long.parseLong(req.getParameter("orderid"));
		System.out.println("redirecting");
		o = odi.ShowOrder(orderid);
		System.out.println("again");
		session.setAttribute("order",o);
		System.out.println("last");
		resp.sendRedirect("IndividualOrder.jsp");
		
		
	}
	
	
	else if (act1!=null && act1.equals("showallorder"))
	{
		
		List<Order21020> ls = odi.ShowAllOrders();
		session.setAttribute("showallorder",ls);
		resp.sendRedirect("AllOrder.jsp");
	}
	else if(act1!=null && act1.equals("showallordercustomer"))
	{
		List<Order21020> lo = odi.ShowAllOrders(user);
		session.setAttribute("orderlist",lo);
		session.setAttribute("user",user);
		resp.sendRedirect("Orders.jsp");
		
	}
	
	else
	{
		resp.sendRedirect("redirect.jsp");
		
	}
	
	
}
}
