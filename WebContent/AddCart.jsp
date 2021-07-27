<%@page import="com.foodpla.pojo.Cart"%>
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

<head>
<link rel = "stylesheet" href = "addfood.css">
<meta charset="ISO-8859-1">
<title>Add to cart</title>
<script type="text/javascript">
function validation()
{
	var eid = document.getElementById("lol1").value;
	var fid = document.getElementById("lol2").value;
	var fquan = document.getElementById("lol3").value;
	var add = document.getElementById("lol4").value;
	if(eid=="")
		{
		document.getElementById("rofl1").innerHTML = "Enter value";
		return false;	
		}
	if(fid=="")
		{
		
		document.getElementById("rofl2").innerHTML = "enter value";
		return false;
		}
	if(add=="")
		{
		document.getElementById("rofl4").innerHTML = "Enter addons(Optional)";
		return false
		}
	if(fquan =="")
		{
		document.getElementById("rofl3").innerHTML = "enter value";
		return false;
		}
	return true;
	}
</script>
</head>
<head>
<link rel = "stylesheet" href = "addfood.css">
<meta charset="ISO-8859-1">





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
  color: #000000;
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
  color: #000000;
  text-transform: uppercase;
}
td{
  padding: 15px;

  font-weight: 300;
  font-size: 12px;
  color: #000000;
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



{
    	background: url('https://ak.picdn.net/shutterstock/videos/18755474/thumb/5.jpg') 50% 0 repeat-y fixed; */
    	 /* filter: blur(8px);

    	-webkit-filter: blur(8px); */
    }
    #canbut{

    	padding-left: 20px
    }







</style>



<body>

<%
String user = (String)session.getAttribute("user");
int foodid = (int)session.getAttribute("foodid");

%>

<div>
<form onsubmit = "return validation()" action =  "AddCartServlet" method = "post">
<table>
<caption>Add to Cart</caption>
<tr>
<td>Email Id</td>
<td><input type = "email" id = "lol1" name = "eid" value = "<%=user%>" readonly="readonly"></td>
<td><span style="color:red" id = "rofl1" ></span></td>
</tr>
<tr>
<td>Food Id</td>
<td><input type = "number" id = "lol2" name = "fid" value = "<%=foodid%>"></td>
<td><span style="color:red" id = "rofl2" ></span></td>
</tr>
<tr>
 <td>Address</td>
<td><input type = "text" id = "lol4" name = "add"></td>
<td><span style="color:red" id = "rofl4" ></span></td>

</tr>
<tr>
<td>Food Quantity</td>
<td><input type = "number" id = "lol3" name = "fquan"></td>
<td><span style="color:red" id = "rofl3" ></span></td>
</tr>
<tr>
<td><input type = "submit" value = "Add"></td>
<td><input type = "reset" value = "cancel"></td>
</tr>
</table>
</form>


<a href = "AddCartServlet?method=show&user=<%=user%>">Show Cart</a>

</div>


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