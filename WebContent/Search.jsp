<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src = "jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
		{
	$("table").hide();
	$("button").click(function()
			{
		var t = $("select").val();
		var d = $("input").val();
		
		$.ajax({
			
			url:"AddFoodServlet?method=search&type="+t+"&data="+d,
			type : "GET",
			datatype : "json",
			success : function(respData)
			{
				$("table").show();
				$.each(respData,function(index,obj){
					$("tbody").append("<tr>");
					$("tbody").append("<td>"+obj.foodname+"</td>");
					$("tbody").append("<td>"+obj.type+"</td>");
					$("tbody").append("<td>"+obj.category+"</td>");
					$("tbody").append("<td>"+obj.description+"</td>");
					$("tbody").append("<td>"+obj.price+"</td>");
					$("tbody").append("</tr>");
				});
			},
			error : function()
			{
				alert("Error !!!!!!");
				
			}
			
		});
			});
		});


</script>
</head>

<body>
<select id = "type">
<option value = "type">type</option>
<option value = "category">category</option>
</select>
<input type="text">
<button>search</button>
<br><br><br><br><br>
<table border = "1">
<thead>
<tr>
<th>Foodname</th>
<th>Foodtype</th>
<th>Food Category</th>
<th>Food description</th>
<th>FoodPrice</th>
</tr>

</thead>
<tbody></tbody>
</table>
</body>
</html>