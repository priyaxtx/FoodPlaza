<%@page import="com.foodpla.dao.OrderImpl"%>
<%@page import="com.foodpla.pojo.Order21020"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nivo-lightbox.css">
	<link rel="stylesheet" href="css/nivo_themes/default/default.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

h2{

color: red;

}

h3{


color:blue;

}

body{


text-align: center;
}


</style>



<body>

<% String user = (String)session.getAttribute("user"); 
  
%> 


<!-- navigation section -->
<section class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="index.jsp" class="navbar-brand">Food-Plaza</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="AddFoodServlet?user=<%=user%>" class="smoothScroll">FOOD GALLERY</a></li>
			<%
			if(user != null)
			{
				
		    %>
		    <li><a href="CartList.jsp?user=<%=user%>" class="smoothScroll">SHOW-CART</a></li>
		    <li><a href="RegisterCustomerServlet?method=update&user=<%=user%>" class="smoothScroll">UPDATE PROFILE</a></li>
		    <li><a href="RegisterCustomerServlet?method=delete&user=<%=user%>" class="smoothScroll">DELETE ACCOUNT</a></li>
		    <li><a href="OrderServlet?method=showallordercustomer&user=<%=user%>" class="smoothScroll">SHOW MY ORDERS</a></li>
		   	<li><a href="ChangePassword.jsp" class="smoothScroll">CHANGE PASSWORD</a></li>
			<li><a href="LogoutServlet?user=<%=user%>" class="smoothScroll">LOGOUT</a></li>
					   	
		    
		    <%
			}
			%>
				
				
				
				
				
				
				
			</ul>
		</div>
	</div>
</section>

<%

Order21020 o = new Order21020();
OrderImpl odi = new OrderImpl();

o = (Order21020)session.getAttribute("order");

%>
<h1><strong>Order Delivering</strong></h1>

<h1><strong>Order Delivering</strong></h1>


<h2>Order Id</h2>
<h3><%=o.getOrderid()%></h3> 

<h2>Email id</h2>
<h3><%=o.getEmail_id()%></h3> 

<h2>Address</h2>
<h3><%=o.getAddress()%></h3> 

<h2>Order Total Price</h2>
<h3><%=o.getTotalprice()%></h3> 



<h1>Thank you for Placing Order</h1>

</body>
</html>