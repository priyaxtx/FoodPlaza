package com.foodpla.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodpla.dao.CartImpl;
import com.foodpla.pojo.Cart;
import com.foodpla.pojo.Food;

@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet
{
	Cart c = new Cart();
	CartImpl cdi = new CartImpl();

@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 

{
	String user = req.getParameter("user");
	
	String method = req.getParameter("method");
	HttpSession session = req.getSession();
	
		if (method!=null && method.equals("add"))
		{
			int foodid = Integer.parseInt(req.getParameter("foodid"));
		session.setAttribute("user",user);
		session.setAttribute("foodid",foodid);
		resp.sendRedirect("AddCart.jsp");
		}
		else if(method!=null && method.equals("show"))
		{
			List<Cart> cl = cdi.Showcart(user);
			session.setAttribute("cart",cl);
			System.out.println(cl);
			if(cl==null)
			{
				resp.sendRedirect("fail.html");
				
			}
			else if(cl!=null)
			{
				
				resp.sendRedirect("CartList.jsp");	
			}
			
			
		}
		
		else if(method!=null && method.equals("delete"))
		{
			int cartid = Integer.parseInt(req.getParameter("cartid"));
			boolean flag = cdi.DeleteCart(cartid);
			System.out.println(flag);
			if(flag)
			{
				List<Cart> cl = cdi.Showcart(user);
				
				
				session.setAttribute("cart",cl);
				
				resp.sendRedirect("FileList.jsp");
			}
			else
			{
				resp.sendRedirect("fail.jsp");
				
			}
			
			
		}
		
		
		else if(method!=null && method.equals("clear"))
		{
			user = req.getParameter("user");
			boolean flag = cdi.ClearCart(user);
			System.out.println(flag);
			
			if(flag)
			{
				
			resp.sendRedirect("FileList.jsp");	
			}
			else
			{
				resp.sendRedirect("fail.jsp");
				
			}
			
		
		}
		
		
		
		else {
			
			resp.sendRedirect("fail.jsp");
		}
	
	}

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{
	String eid = req.getParameter("eid");
	int fid = Integer.parseInt(req.getParameter("fid"));
	String add = req.getParameter("add");
	int fquan = Integer.parseInt(req.getParameter("fquan"));
	
	boolean flag;
		c.setEmail_id(eid);
	c.setFoodid(fid);
	c.setAddons(add);
	c.setQuantity(fquan);
	flag = cdi.AddCart(c);
	HttpSession session = req.getSession();
	if(flag)
	{
		resp.sendRedirect("FileList.jsp");
		System.out.println("successfull");
	}
	else
	{
		resp.sendRedirect("fail.jsp");
		
	}
	
}
}
