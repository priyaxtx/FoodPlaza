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
    <link rel = "stylesheet" href = "addfood.css">
    <meta charset="ISO-8859-1">
    <title>ChangePassword</title>
   <head>
<link rel = "stylesheet" href = "addfood.css">
<meta charset="ISO-8859-1">
    <script type="text/javascript">
    function validation()
    {
    var opass = document.getElementById("lol3").value;
    var npass = document.getElementById("lol4").value;
    var cpass = document.getElementById("lol5").value;
    if(opass =="")
    	{
    	document.getElementById("rofl1").innerHTML = "Enter old password";
    	return false;
    	}
    	if(npass == "")
    		{
    		document.getElementById("rofl2").innerHTML = "Enter new password";
    		return false;
    		}
    	if(cpass == "")
    		{
    		document.getElementById("rofl3").innerHTML = "Re-enter new password";
    		return false;
    		}
    	 if(cpass!=npass)
    		{
    		document.getElementById("rofl3").innerHTML = "New Password and confirm password should be same";
    		return false;
    		}
    	if(opass==npass)
    		{
    		document.getElementById("rofl3").innerHTML = "new password should not be same as old password";
    		return false;
    		}
    	return true;
    }
    </script>
    </head>
    <style>
    #home{
    	background: url('https://ak.picdn.net/shutterstock/videos/18755474/thumb/5.jpg') 50% 0 repeat-y fixed; */
    	 /* filter: blur(8px);

    	-webkit-filter: blur(8px); */
    }
    #canbut{

    	padding-left: 20px
    }
    </style>
    <body>
 
<% String user = (String)session.getAttribute("user"); 
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
				<li><a href="AddFoodServlet?user=<%=user%>" class="smoothScroll">FOOD GALLERY</a></li>
			<%
			if(admin== null && user != null)
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


    
    
<%
String useremail = (String)session.getAttribute("user");
//String adminemail = (String)session.getAttribute("admin");
//out.print(c);
%>
    <div>
    <form onsubmit = "return validation()" action = "LoginServlet" method="post">
    <input type="hidden" name = "action" value = "changepass">

    <section id="home" class="parallax-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-12 col-sm-12">


    			<a id = aks href="index.jsp"><h1>Food-Plaza</h1></a>
		<%
		if(useremail!=null)
		{
		%>
          <select name = "type" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
  					
  					<option >Customer</option>
  					<span class="caret"></span>
  				</select>
<%
		}
		
		else if(useremail==null)
		{
%>

 <select name = "type" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
  					
  					<option >Admin</option>
  					<span class="caret"></span>
  				</select>


<%

}
%>
    			<form class="form-horizontal">
    				<div class="form-group">
    					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    					<div class="col-sm-10">
    						<input type="email" class="form-control" id="lol2" placeholder="Email" name = "email" value = <%=useremail%> required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Old Password</label>
    					<div class="col-sm-10">
    						<input type="password" class="form-control" id="lol3" placeholder="Old-Password" name = "opass" required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
    					<div class="col-sm-10">
    						<input type="password" class="form-control" id="lol4" placeholder="New-Password" name = "npass" required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Confirm Password</label>
    					<div class="col-sm-10">
    						<input type="password" class="form-control" id="lol5" placeholder="Confirm- New Password" name = "cpass" required>
    					</div>
    				</div>
    				<div class="form-group">
    				 <div class="col-sm-offset-2 col-sm-10">
    					 <input type="submit" class="btn btn-default">
    					  <input id = 'canbut' type="cancel" value="Cancel" class="btn btn-default">

    					 <p>  </p>
    				 <!--	 <p id = "already">Already a customer?</p> -->
    			 <a id="change" href="index.jsp">Back</a>
    				 </div>
    			 </div>
    			 </form>
    			 </div>
    			 </div>
    			 </div>
    			 </section>

    <!-- <table>
    <caption>Change Password</caption>
    <tr>
    <td><select name="type">
    <option>Customer</option>
    <option>Admin</option>
    </select>
    </td>
    </tr>
    <tr>
    <td>Email Id</td>
    <td><input type = "email" id = "lol1" name = "email"></td>
    <td><span style="color: red" id = "rofl1"></span></td>
    </tr>
    <tr>
    <td>Old Password</td>
    <td><input type = "password" id = "lol1" name = "opass"></td>
    <td><span style="color:red" id = "rofl1"></span></td>
    </tr>
    <tr>
    <td>New Password</td>
    <td><input type = "password" id = "lol2" name = "npass"></td>
    <td><span style="color:red" id = "rofl2"></span></td>
    </tr>
    <tr>
    <td>Confirm new Password</td>
    <td><input type = "password" id = "lol3" name = "cpass"> </td>
    <td><span style="color:red" id = "rofl3"></span></td>
    </tr>
    <tr>
    <td><input type = "submit" value = "submit"></td>
    <td><input type = "reset" value = "cancel"></td>
    </tr>
    </table> -->
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
                
                | Design: <a rel="nofollow" href="http://www.github.com/parateaksh" target="_parent">Priya and anita</a></p>
			</div>
		</div>
	</div>
</section>
<!-- footer section end point-->
    </body>
    </html>
