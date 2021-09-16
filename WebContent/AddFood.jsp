<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>
    <head>
    <link rel = "stylesheet" href = "addfood.css">
    <meta charset="ISO-8859-1">
    <title>AddFood</title>
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
    	var foodname = document.getElementById("lol1").value;
    	var fooddesc = document.getElementById("lol2").value;
    	var foodprice = document.getElementById("lol5").value;
    	var foodtype = document.getElementById("lol3").value;
    	var foodcategory = document.getElementById("lol4").value;
    	//var error = document.getElementByTagName("span");
    		if(foodname == "")
    			{
    			document.getElementById("fnameerror").innerHTML ="Please enter food name";
    			return false;
    			}
    		if(fooddesc == "")
    		{
    		document.getElementById("fdescerror").innerHTML ="Please enter food desscription";
    		return false;
    		}
    		if(foodprice == "")
    		{
    		document.getElementById("fpriceerror").innerHTML ="Please enter food price";
    		return false;
    		}
    		if(isNaN(foodprice))
    		{
    		document.getElementById("fnameerror").innerHTML ="Please enter food name";
    		return false;
    		}
    		if(foodtype == "")
    		{
    		document.getElementById("ftypeerror").innerHTML ="Please enter food type";
    		return false;
    		}
    		if(foodcategory == "")
    		{
    		document.getElementById("fcategoryerror").innerHTML ="Please Enter food category";
    		return false;
    		}
    	return true;
    	}
    </script>
    </head>
    <style>
    #home{
    	background: url('	https://assets.tvo.org/prod/s3fs-public/styles/full_width_1280/public/article-thumbnails/Chef_at_grill_iStock_Aleksandar_Nakic.jpg?aUgCoHbvpMy2_W89IuWjgI7zcZzQR74K') 50% 0 repeat-y fixed;
    	 /* filter: blur(8px);

    	-webkit-filter: blur(8px); */
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


    
    <div>
    <form onsubmit="return validation()" action = "AddFoodServlet" method="post">
    <input type="hidden" name = "action" value = "addfood">

    <section id="home" class="parallax-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-12 col-sm-12">


    			<a id = aks href="index.jsp"><h1>Food-Plaza</h1></a>

    			<form class="form-horizontal">
    				<div class="form-group">
    					<label for="inputEmail3" class="col-sm-2 control-label">Food Name</label>
    					<div class="col-sm-10">
    						<input type="text" class="form-control" id="lol1" placeholder="Food Name" name = "fname" required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Food Description</label>
    					<div class="col-sm-10">
    						<input type="text" class="form-control" id="lol2" placeholder="Description" name = "fdesc" required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Food Type</label>
    					<div class="col-sm-10">
    						<input type="text" class="form-control" id="lol3" placeholder="Food Type" name = "ftype" required>
    					</div>
    				</div>

    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Food Category</label>
    					<div class="col-sm-10">
    						<input type="text" class="form-control" id="lol4" placeholder="Food Category" name = "fcat" required>
    					</div>
    				</div
    				>
    				<div class="form-group">
    					<label for="inputPassword3" class="col-sm-2 control-label">Food Price</label>
    					<div class="col-sm-10">
    						<input type="number" class="form-control" id="lol5" placeholder="Price" name = "fprice" required>
    					</div>
    				</div>

    				<div class="form-group">
    				 <div class="col-sm-offset-2 col-sm-10">
    					 <input type="submit" value = "Add Food" class="btn btn-default">
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
    <caption style="font-family: algerian; font-size: 20px">Add Food</caption>
    <tr>
    <td>Food Name</td>
    <td><input type = "text" id = "foodname" name = "fname"></td>
    <td><span style="color:red" id = "fnameerror"></span>
    </tr>
    <tr>
    <td>Food Description</td>
    <td><input type = "text" id = "fooddesc" name = "fdesc"></td>
    <td><span style="color:red" id = "fdescerror"></span>
    </tr>
    <tr>
    <td>Food type</td>
    <td><input type = "text" id = "foodtype" name = "ftype"></td>
    <td><span style="color:red" id = "ftypeerror"></span>

    </tr>
    <tr>
    <td>Food Category</td>
    <td><input type = "text" id = "foodcategory" name = "fcat"></td>
    <td><span style="color:red" id = "fcategoryerror"></span>

    </tr>
    <tr>
    <td>Food Price</td>
    <td><input type = "number" id = "foodprice" name = "fprice"></td>
    <td><span style="color:red" id = "fpriceerror"></span>

    </tr>

    <tr>
    <td><input type = "submit" value = "ADD Food"></td>
    <td><input type = "reset" value = "CANCEL"></td>
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
                
                | Design: <a rel="nofollow" href="http://www.github.com/parateaksh" target="_parent">priya and anita</a></p>
			</div>
		</div>
	</div>
</section>
<!-- footer section end point-->
    </body>
    </html>
