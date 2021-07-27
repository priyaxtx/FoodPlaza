package com.foodpla.servlet;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodpla.dao.FoodImpl;
import com.foodpla.pojo.Food;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
	
	Food f = new Food();
	FoodImpl fdi = new FoodImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		String act = req.getParameter("method");
//		String user = req.getParameter("user");
		HttpSession session = req.getSession();
		if(act != null && act.equals("edit"))
		{
			int fid = Integer.parseInt(req.getParameter("id"));
			f = fdi.searchByFoodId(fid);
			session.setAttribute("food", f);
			resp.sendRedirect("UpdateFood.jsp");
			
		}
		else if(act != null && act.equals("delete"))
		{
			int fid = Integer.parseInt(req.getParameter("id"));
			boolean flag = fdi.DeleteFood(fid);
			if(flag)
			{
				List<Food> lf = fdi.ShowAllFood();
				session.setAttribute("foodList",lf);
				resp.sendRedirect("FileList.jsp");
				
			}
			else
			{
				
				resp.sendRedirect("fail.jsp");
			}

			
		}
		else if(act!=null && act.equals("search"))
		{
			System.out.println("request recieved from ajax");
			act = req.getParameter("type");
			System.out.println("type"+act);
			if(act!=null && act.contentEquals("type"))
			{
				act = req.getParameter("data");
				System.out.println(act);
				List<Food> lf = fdi.SearchFoodByTypes(act);
				System.out.println(lf);
				Gson j = new Gson();
				JsonElement je = j.toJsonTree(lf);
				System.out.println(je);
				JsonArray ja = je.getAsJsonArray();
				System.out.println(ja);
				resp.setContentType("application/json");
				resp.getWriter().print(ja);
				
			}
			
		}
		else
		{
			
			
			ArrayList<Food> lf = fdi.ShowAllFood();
			session.setAttribute("foodList", lf);
			resp.sendRedirect("FileList.jsp");		
		}
	
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean flag;
		
		String action = req.getParameter("action");
		if (action.equals("addfood")) {
			String fname = req.getParameter("fname");
			String fdesc = req.getParameter("fdesc");
			String ftype = req.getParameter("ftype");
			int fprice = Integer.parseInt(req.getParameter("fprice"));
			String fcat = req.getParameter("fcat");
			
			f.setFoodname(fname);
			f.setDescription(fdesc);
			f.setType(ftype);
			f.setPrice(fprice);
			f.setCategory(fcat);
			
			flag = fdi.AddFood(f);
			
			if (flag) {
				resp.sendRedirect("index.jsp");
				System.out.println("successfull");
			}
			
			else {
				resp.sendRedirect("fail.jsp");
				System.out.println("fail");
			}

		} 
		else if (action.equals("updatefood")) {
			
			int fid = Integer.parseInt(req.getParameter("fid"));
			String fname = req.getParameter("fname");
			String fdesc = req.getParameter("fdesc");
			String ftype = req.getParameter("ftype");
			int fprice = Integer.parseInt(req.getParameter("fprice"));
			String fcat = req.getParameter("fcat");
			
			f.setFoodid(fid);
			f.setFoodname(fname);
			f.setDescription(fdesc);
			f.setType(ftype);
			f.setPrice(fprice);
			f.setCategory(fcat);
			
			flag = fdi.UpdateFood(f);
			
			if (flag) {
				resp.sendRedirect("AddFood.jsp");
				System.out.println("successfull");
			} 
			
			else {
				resp.sendRedirect("fail.jsp");
				System.out.println("fail");
			}
		}
	}
}
