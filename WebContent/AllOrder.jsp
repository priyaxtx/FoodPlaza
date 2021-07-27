<%@page import="com.foodpla.pojo.Order21020"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.foodpla.pojo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders List</title>
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
 
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;

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



<h1>amdnjndajn</h1>



<%
List<Order21020> lo = (List<Order21020>)session.getAttribute("showallorder");
Order21020 o = new Order21020();
Iterator<Order21020> i = lo.iterator();

%>
<div class= "final">
<section class = "not">
  <!--for demo wrap-->
  <h1>Orders</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
        <th>Email ID</th>
          <th>Order Id</th>
			<th>Booking Date And Time</th>
			<th>Address</th>
			<th>TotalPrice</th>
			<th>Action</th>
        </tr>
      </thead>
    </table>
  </div>


<%
while(i.hasNext())
{
	o = i.next();
   
%>

<div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
        <td><%=o.getEmail_id()%></td>
          <td><%=o.getOrderid()%></td>
          <td><%=o.getBookingdatetime() %></td>
          <td><%=o.getAddress()%></td>
          <td><%=o.getTotalprice() %></td>
         <td><a href = "OrderServlet?method=showindividual&orderid=<%=o.getOrderid()%>">Show</a></td>

</tr>
<%} %>

</tbody>
    </table>
</div>
</section>
<p>  </p>
<br>
<p> </p>
</div>
<!-- footer section start point-->
<footer class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s">
				<h2 class="heading">Contact Info.</h2>
				<div class="ph">
					<p><i class="fa fa-phone"></i> Phone</p>
					<h4>9967697690</h4>
				</div>
				<div class="address">
					<p><i class="fa fa-map-marker"></i> Our Location</p>
					<h4>SEC -21 KHARGHAR NAVI-MUMBAI</h4>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s">
				<h2 class="heading">Open Hours</h2>
					<p>Sunday <span>10:30 AM - 10:00 PM</span></p>
					<p>Mon-Fri <span>9:00 AM - 8:00 PM</span></p>
					<p>Saturday <span>11:30 AM - 10:00 PM</span></p>
			</div>
			<div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s">
				<h2 class="heading">Follow Us</h2>
				<ul class="social-icon">
					<li><a href="#" class="fa fa-facebook wow bounceIn" data-wow-delay="0.3s"></a></li>
					<li><a href="#" class="fa fa-twitter wow bounceIn" data-wow-delay="0.6s"></a></li>
					<li><a href="#" class="fa fa-behance wow bounceIn" data-wow-delay="0.9s"></a></li>
					<li><a href="#" class="fa fa-dribbble wow bounceIn" data-wow-delay="0.9s"></a></li>
					<li><a href="#" class="fa fa-github wow bounceIn" data-wow-delay="0.9s"></a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>


<!-- copyright section -->
<section id="copyright">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<h3>FoodPlaza</h3>
				<p>Copyright © FoodPlaza Restaurant and Cafe 
                
                | Design: <a rel="nofollow" href="http://www.github.com/parateaksh" target="_parent">Akshay</a></p>
			</div>
		</div>
	</div>
</section>
<!-- footer section end point-->
</body>
</html>