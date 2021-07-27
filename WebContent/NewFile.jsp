<%@ page import = "java.util.Iterator" %>
<%@ page import = "com.foodpla.pojo.Food" %>
<%@ page import = "java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>FileList</title>
</head>

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nivo-lightbox.css">
	<link rel="stylesheet" href="css/nivo_themes/default/default.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	


<style>


h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
  text-transform: uppercase;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }

th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
.final{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
.not{
  margin: 5px;
}

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}

</style>
<body>

<% 
String user = (String)session.getAttribute("user");
String admin = (String)session.getAttribute("admin");


List<Food> lf = (List<Food>)session.getAttribute("foodList");%>


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
				<li><a href="#menu" class="smoothScroll">SPECIAL MENU</a></li>
			<%
			if(admin== null && user != null)
			{
				
		    %>
		    <li><a href="AddCartServlet?method=show&user=<%=user%>" class="smoothScroll">SHOW-CART</a></li>
		    <li><a href="RegisterCustomerServlet?method=update&user=<%=user%>" class="smoothScroll">UPDATE PROFILE</a></li>
		    <li><a href="RegisterCustomerServlet?method=delete&user=<%=user%>" class="smoothScroll">DELETE ACCOUNT</a></li>
		    <li><a href="OrderServlet?method=add&user=<%=user%>" class="smoothScroll">SHOW MY ORDERS</a></li>
		   	<li><a href="ChangePassword.jsp" class="smoothScroll">CHANGE PASSWORD</a></li>
			<li><a href="LogoutServlet?user=<%=user%>" class="smoothScroll">LOGOUT</a></li>
					   	
		    
		    <%
			}
			if(admin != null && user ==null)
			{
				
			%>
			
			<li><a href="AddFood.jsp" class="smoothScroll">ADD FOOD</a></li>
			<li><a href="OrderServlet?method=showallorder" class="smoothScroll">SHOW ALL ORDERS</a></li>
			<li><a href="RegisterCustomerServlet?method=showallcustomer" class="smoothScroll">SHOW ALL CUSTOMERS</a></li>
			<li><a href="ChangePassword.jsp" class="smoothScroll">CHANGE PASSWORD</a></li>
			<li><a href="LogoutServlet?user=<%=admin%>" class="smoothScroll">LOGOUT</a></li>
			
			<%	
			}
			if(admin==null && user==null)
			{
				
			%>
			
			<li><a href="Login.jsp" class="smoothScroll">LOGIN</a></li>
			<li><a href="RegisterCustomer.jsp" class="smoothScroll">REGISTER</a></li>
			
			<%	
			}
			%>
			</ul>
		</div>
	</div>
</section>
<h1>amdnjndajn</h1>











<%
Food f = new Food();

Iterator<Food> i = lf.iterator(); 

%>

<div class = "final">
<section class = "not">
  <!--for demo wrap-->
  <h1>Food Plaza Menu</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Food-Name</th>
          <th>Food-Type</th>
          <th>Food Category</th>
          <th>Description</th>
          <th>Price </th>
          <% if(admin ==null && user!=null){ %>
          <th>Action</th>
          <%} if(admin !=null && user == null){ %>
          <th colspan="2">Action</th>
          <%} %>
        </tr>
      </thead>
    </table>
  </div>
  
<%
while(i.hasNext())
{
	
 f = i.next();	
 long foodid = f.getFoodid();
%>

<div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td><%=f.getFoodname() %></td>
          <td><%=f.getType() %></td>
          <td><%=f.getCategory() %></td>
          <td><%=f.getDescription() %></td>
          <td><%=f.getPrice() %></td>
<% if(admin ==null && user!=null){ %>
<td><a href = "AddCartServlet?user=<%=user%>&foodid=<%=foodid%>&method=add">ADD-TO-CART</a></td>
<%} if(admin !=null && user == null){ %>
<td><a href = "AddFoodServlet?method=edit&id=<%=f.getFoodid()%>">Edit</a></td>
<td><a href = "AddFoodServlet?method=delete&id=<%=f.getFoodid()%>">Delete</a></td>
<%} %>

</tr>
<%} %>

  </tbody>
    </table>
</div>
</section>
<p>  </p>
<br>
<p> </p>

<%
if (user!=null && admin==null)
{
%>
<div class = "container">
<button class="btn btn-default" type="submit"><a href = "AddCartServlet?method=show&user=<%=user%>">Show Cart</a></button>
<%} %>
</div>
</div>
</body>
</html>

    
  