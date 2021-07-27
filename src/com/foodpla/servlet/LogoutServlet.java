package com.foodpla.servlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String user = req.getParameter("user");
		HttpSession session=req.getSession();
		session.setAttribute("user",user);
		System.out.println("invalidating");
		session.invalidate();
		System.out.println("completed");
		resp.sendRedirect("index.jsp");
	}
}
