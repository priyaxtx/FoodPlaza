<%@page import="com.foodpla.pojo.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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


<%  
   String admin = (String)session.getAttribute("admin");
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
				<li><a href="FileList.jsp" class="smoothScroll">FOOD GALLERY</a></li>
			
					   	
		    
		    <%
			if(admin != null)
			{
				
			%>
			
			<li><a href="AddFood.jsp" class="smoothScroll">ADD FOOD</a></li>
			<li><a href="OrderServlet?method=showallorder" class="smoothScroll">SHOW ALL ORDERS</a></li>
			<li><a href="RegisterCustomerServlet?method=showallcustomer" class="smoothScroll">SHOW ALL CUSTOMERS</a></li>
			<li><a href="ChangePassword.jsp" class="smoothScroll">CHANGE PASSWORD</a></li>
			<li><a href="LogoutServlet?user=<%=admin%>" class="smoothScroll">LOGOUT</a></li>
			
			<%	
			}
			
			%>
			
				
				
				
				
				
				
				
			</ul>
		</div>
	</div>
</section>

<%

Customer c= new Customer();

c = (Customer)session.getAttribute("userdata");

%>



<h1><strong>Customer Profile</strong></h1>


<h2>Name</h2>
<h3><%=c.getName()%></h3> 

<h2>Email id</h2>
<h3><%=c.getEmail_id()%></h3> 

<h2>Address</h2>
<h3><%=c.getAddress()%></h3> 


<h2>Contact</h2>
<h3><%=c.getContact()%></h3> 



<h1>You Have been an amazing customer</h1>

</body>
</html>