<%@page import="com.foodpla.pojo.Food"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "addfood.css">
<meta charset="ISO-8859-1">
<title>UpdateFood</title>
<script>
function validation()
{
	var fname = document.getElementById("lol1").value;
	var fdesc = document.getElementById("lol2").value;
	var fprice = document.getElementById("lol3").value;
	var ftype1 = document.getElementById("lol4").value;
	//var ftype2 = document.getElementById("lol5").value;
	if(fname=="")
		{
		document.getElementById("rofl1").innerHTML = "Enter food name";
		return false;
		}
	if(fdesc=="")
	{
	document.getElementById("rofl2").innerHTML = "Enter food description";
	return false;
	}
	if(fprice=="")
	{
	document.getElementById("rofl3").innerHTML = "Enter food price";
	return false;
	}
	if(ftype1=="")
	{
	document.getElementById("rofl4").innerHTML = "select food type";
	return false;
	}
	return true;
	}
</script>
</head>
<body>
<% Food f = (Food)session.getAttribute("food"); %>

<div>
<form onsubmit = "return validation()" action = "AddFoodServlet" method="post">
<input type = "hidden" name = "action" value = "updatefood">
<table>
<caption>Update Food</caption>
<tr> 
<td>Food ID</td>
<td><input type = "text" id= "lol5" name = "fid" value = "<%=f.getFoodid()%>" readonly="readonly"></td>
<td><span style="color: red" id = "rofl5"></span></td>
</tr>
<tr> 
<td>Food Name</td>
<td><input type = "text" id= "lol1" name = "fname" value = "<%=f.getFoodname()%>"></td>
<td><span style="color: red" id = "rofl1"></span></td>
</tr>
<tr> 
<td>Food Description</td>
<td><input type = "text" id= "lol2"  name = "fdesc" value = <%=f.getDescription()%>></td>
<td><span style="color: red" id = "rofl2"></span></td>

</tr>
<tr> 
<td>Food Price</td>
<td><input type = "number" id= "lol3" name = "fprice" value = <%=f.getPrice()%>></td>
<td><span style="color: red" id = "rofl3"></span></td>

</tr>
<tr> 
<td>Food Type</td>
<td><input type = "text" id= "lol4" name = "ftype" value = <%=f.getType()%>></td>
<td><span style="color: red" id = "rofl4"></span></td>
</tr>
<tr> 
<td>Food Category</td>
<td><input type = "text" id= "lol6" name = "fcat" value = <%=f.getCategory()%>></td>
<td><span style="color: red" id = "rofl6"></span></td>
</tr>
<tr> 
<td><input type = "submit" value = "update"></td>
<td><input type = "reset" value ="cancel"> </td>
</tr>

</table>
</form>
</div>
</body>
</html>