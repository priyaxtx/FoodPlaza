<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>
    <head>
    <link rel="stylesheet" href="FoodPlazaTemplate.css">
    <meta charset="ISO-8859-1">
    <title>Registration Form</title>
  	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nivo-lightbox.css">
	<link rel="stylesheet" href="css/nivo_themes/default/default.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript">
    
    function validation()
    {
    var uname = document.getElementById("lol1").value;
    var eid = document.getElementById("lol2").value;
    var pnum = document.getElementById("lol3").value;
    var add = document.getElementById("lol4").value;
    var pass = document.getElementById("lol5").value;
    if(uname=="")
    	{
    	document.getElementById("rofl1").innerHTML = "enter username";
    	return false
    	}
    if(eid=="")
    {
    document.getElementById("rofl2").innerHTML = "enter email id";
    return false
    }
    /* if(pnumber==10)
    {
    	document.getElementById("rofl3").innerHTML = "enter corrent phone number"; */
    	if(pnum=="")
    		{
    document.getElementById("rofl3").innerHTML = "enter phone number";
    return false
    }
    //}
    if(add=="")
    {
    document.getElementById("rofl4").innerHTML = "enter address";
    return false
    }
    if(pass=="")
    {
    document.getElementById("pass").innerHTML = "enter password";
    return false
    }
    return true;

    }
    </script>
    </head>
    <style>
    #home{
    	background: url('https://d39l2hkdp2esp1.cloudfront.net/img/photo/126844/126844_00_2x.jpg') 50% 0 repeat-y fixed; */
    	 /* filter: blur(8px);

      -webkit-filter: blur(8px); */
    }
    #id{

    	color: "white";
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


    	<div align = "center">
    		<form onsubmit = "return validation()" action="RegisterCustomerServlet" method="post">
    		<input type = "hidden" name = "action" value = "regcust">

    		<section id="home" class="parallax-section">
    			<div class="container">
    				<div class="row">
    					<div class="col-md-12 col-sm-12">


    					<a id = aks href="index.jsp"><h1>Food-Plaza</h1></a>

    					<form class="form-horizontal">
    						<div class="form-group">
    							<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
    							<div class="col-sm-10">
    								<input type="text" class="form-control" id="lol1" placeholder="Name" name = "uname" required>
    							</div>
    						</div>

    						<div class="form-group">
    							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    							<div class="col-sm-10">
    								<input type="email" class="form-control" id="lol2" placeholder="Email" name = "eid" required>
    							</div>
    						</div>

    						<div class="form-group">
    							<label for="inputPassword3" class="col-sm-2 control-label">PhoneNumber</label>
    							<div class="col-sm-10">
    								<input type="number" class="form-control" id="lol3" placeholder="Phone Number" name = "num" required>
    							</div>
    						</div>

    						<div class="form-group">
    							<label for="inputPassword3" class="col-sm-2 control-label">Address</label>
    							<div class="col-sm-10">
    								<input type="text" class="form-control" id="lol4" placeholder="Address" name = "add" required>
    							</div>
    						</div>

    						<div class="form-group">
    							<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    							<div class="col-sm-10">
    								<input type="password" class="form-control" id="lol5" placeholder="Password" name = "pass" required>
    							</div>
    						</div>
    						<div class="form-group">
    						 <div class="col-sm-offset-2 col-sm-10">
    							 <input type="submit" class="btn btn-default">

    							 <p>  </p>
    						 <!--	 <p id = "already">Already a customer?</p> -->
    					 <a id="change" href="Login.jsp">Login</a>
    						 </div>
    					 </div>
    					 </form>
    					 </div>
    					 </div>
    					 </div>
    					 </section>
    					 </form>
    					 </div>


    		<!-- <table>
    		<caption style = "font-family: algerian">customer registration form</caption>
    		<tr>
    		<td>UserName</td>
    		<td><input type = "text" id = "lol1" name = "uname"></td>
    		<td><span style="color: red" id = "rofl1"></span></td>
    		</tr>
    		<tr>
    		<td>EmailId</td>
    		<td><input type = "email" id = "lol2" name = "eid"></td>
    		<td><span style="color: red" id = "rofl2"></span></td>

    		</tr>
    		<tr>
    		<td>PhoneNumber</td>
    		<td><input type = "number" id = "lol3" name = "num"></td>
    		<td><span style="color: red" id = "rofl3"></span></td>

    		</tr>
    		<tr>
    		<td>Address</td>
    		<td><textarea id = "lol4" name = "add"></textarea></td>
    		<td><span style="color: red" id = "rofl4"></span></td>

    		</tr>
    		<tr>
    		<td>Password</td>
    		<td><input type = "password" id = "lol5" name = "pass"></td>
    		<td><span style="color: red" id = "rofl5"></span></td>
    		</table>
    		<input type = "submit">&nbsp<input type = "reset">
    		</form>
    	</div> -->
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
                
                | Design: <a rel="nofollow" href="http://www.github.com/parateaksh" target="_parent">Priya and Anita</a></p>
			</div>
		</div>
	</div>
</section>
<!-- footer section end point-->
    </body>
    </html>
