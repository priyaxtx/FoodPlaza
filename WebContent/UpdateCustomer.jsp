<%@page import="com.foodpla.pojo.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nivo-lightbox.css">
	<link rel="stylesheet" href="css/nivo_themes/default/default.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" href = "UpdateCustomer.css">
<meta charset="ISO-8859-1">
<title>Customer Update Form</title>
<script type="text/javascript">
function validation()
{
	var name = document.getElementById("lol1").value;
	var pnum = document.getElementById("lol2").value;
	var add = document.getElementById("lol3").value;
	var eid = document.getElementById("lol4").value;
	var pass = document.getElementById("lol5").value;
	if(name=="")
		{
		document.getElementById("rofl1").innerHTML ="enter name";
		return false;
		}
	if(pnum =="")
		{
		document.getElementById("rofl2").innerHTML = "Enter phone number";
		return false;
		
		}
	if(add=="")
		{
		document.getElementById("rofl3").innerHTML = "Enter address";
		return false;
		}
	return true;
	}
</script>
<style type="text/css">
.coders{
padding-bottom: 200px;
}

</style>
</head>
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
Customer c = (Customer)request.getAttribute("userdata");
//out.print(c);
%>
<div class = "coders" align="center">
<form onsubmit = "return validation()" action ="RegisterCustomerServlet" method="post">
<input type="hidden" name  = "action" value = "updcust">
<table >
<caption style="font-family: algerian">Customer update form</caption>
<tr>
<td>EmailId</td>
<td> <input type = "text" id = "lol4" name = "eid" value = "<%=c.getEmail_id()%>" readonly="readonly"></td>
<td><span style="color: red" id =  "rofl4"></span></td>
</tr>
<tr>
<td>password</td>
<td> <input type = "text" id = "lol5" name = "pass" value = <%=c.getPassword()%> readonly="readonly"></td>
<td><span style="color: red" id =  "rofl5"></span></td>
</tr>
<tr>
<td>Name</td>
<td> <input type = "text" id = "lol1" name = "name" value = <%=c.getName()%>></td>
<td><span style="color: red" id =  "rofl1"></span></td>
</tr>
<tr>
	<td>PhoneNumber</td>
	<td><input type = "number" id = "lol2" name = "num" value = <%=c.getContact() %>></td>
	<td><span style="color: red" id =  "rofl2"></span></td>
	
	</tr>
	<tr>
	<td>Address</td>
	<td><input type="text" id = "lol3" name = "add" value = <%=c.getAddress()%>></td>
	<td><span style="color: red" id =  "rofl3"></span></td>
	
	</tr>
</table>
<input type = "submit" value ="update">&nbsp<input type = "reset" value = "cancel"></td>
</form>
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