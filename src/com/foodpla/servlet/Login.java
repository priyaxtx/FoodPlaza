package com.foodpla.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodpla.dao.CustomerImpl;
import com.foodpla.dao.LoginImpl;
import com.foodpla.pojo.Customer;

@WebServlet("/LoginServlet")
public class Login extends HttpServlet 
{
	CustomerImpl cdi = new CustomerImpl();
	 Customer c = new Customer();
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
{
	String email = req.getParameter("email");
	String method = req.getParameter("method");
	c = cdi.ShowProfile(email);
HttpSession session = req.getSession();
    session.setAttribute("emailid",email);
	
    
    if(c!=null)
    	{
    	
    		session.setAttribute("userdata", c);
    		resp.sendRedirect("index.jsp");
    	}
}	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();

		String action = req.getParameter("action");
		boolean flag;
		PrintWriter pw = resp.getWriter();
		if (action !=null && action.equals("login")) {

			String type = req.getParameter("type");
			String uname = req.getParameter("email");
			String pass = req.getParameter("pass");
			LoginImpl ldi = new LoginImpl();
			
			System.out.println("akshay");
			if (type != null && type.equals("Admin")) {
				flag = ldi.AdminLogin(uname, pass);
				if (flag) {
                    session.setAttribute("admin",uname);
					resp.sendRedirect("index.jsp");
				
				}

				else {
					resp.sendRedirect("fail.jsp");
					System.out.println("aslhdiu");
				}
			} else if (type != null && type.equals("Customer")) {
				flag = ldi.CustomerLogin(uname, pass);
				System.out.println("aslkjoi");
				if (flag) {
					System.out.println("aksdguas");
					session.setAttribute("user",uname);
					resp.sendRedirect("index.jsp");

				} else {
					resp.sendRedirect("fail.jsp");
					System.out.println("sshduia");

				}

			}
			System.out.println("coders");

		}
		
		else if(action !=null && action.equals("changepass"))
		{
			String eid = req.getParameter("email");
			String type = req.getParameter("type");
			String opass = req.getParameter("opass");
			String npass = req.getParameter("npass");
			String cpass = req.getParameter("cpass");
			LoginImpl ldi = new LoginImpl();
			System.out.println("changepass");
			if(type!=null && type.equals("Admin"))
			{
				flag = ldi.AdminChangepassword(eid, npass);
				System.out.println("changed");
				if(flag)
				{
				resp.sendRedirect("index.jsp");	
					System.out.println("successfull");
				}
				else
				{
					resp.sendRedirect("ChangePassword.jsp");
					System.out.println("fail");
				}
				
			}
			else if(type!=null && type.equals("Customer"))
			{
				flag = ldi.CustomerChangePassword(eid, npass);
				System.out.println("customer changed");
				if(flag)
				{
					
					resp.sendRedirect("index.jsp");
				
				System.out.println("successfull");
				}
				else
				{
					
					resp.sendRedirect("ChangePassword.jsp");
				System.out.println("fail");
				}
				
			}
			
		}
	}
}






















/*
 * import java.io.IOException;
 * 
 * import java.io.PrintWriter;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.foodpla.dao.LoginImpl;
 * 
 * @WebServlet("/LoginServlet") public class Login extends HttpServlet {
 * protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
 * ServletException, IOException { String type = req.getParameter("type");
 * String uname = req.getParameter("email"); String pass =
 * req.getParameter("pass"); LoginImpl ldi = new LoginImpl(); boolean flag;
 * PrintWriter pw = resp.getWriter(); System.out.println("akshay"); if (type !=
 * null && type.equals("Admin")) { System.out.println("asjdugas"); flag =
 * ldi.AdminLogin(uname, pass); if (flag) {
 * 
 * resp.sendRedirect("success.html"); System.out.println("okay"); }
 * 
 * else { resp.sendRedirect("fail.html"); System.out.println("aslhdiu"); } }
 * System.out.println("coders");
 * 
 * } }
 * 
 * 
 * 
 */