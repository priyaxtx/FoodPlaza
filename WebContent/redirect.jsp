<%@page import="java.util.Iterator"%>
<%@page import="com.foodpla.pojo.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
List<Cart> cl = (List<Cart>)session.getAttribute("cart");

Cart c = new Cart();
Iterator<Cart> i = cl.iterator();

%>
    <table>
        <tr>
          <th>Food Id</th>
			<th>Food Name</th>
			<th>Food Quantity</th>
			<th>Add Ons</th>
			<th>TotalPrice</th>
			<th>Cart Id</th>
			<th>Action</th>
        </tr>
    </table>

<%
while(i.hasNext())
{
	c = i.next();
   
%>

    <table>
      <tbody>
        <tr>
          <td><%=c.getFoodid() %></td>
          <td><%=c.getFoodname() %></td>
          <td><%=c.getQuantity()%></td>
          <td><%=c.getAddons()  %></td>
          <td><%=c.getTotalprice() %></td>
          <td><%=c.getCartid()%></td>
          <td><a href = "AddCartServlet?method=delete&cartid=<%=c.getCartid()%>">Delete</a></td>

</tr>
<%} %>

</tbody>
    </table>
<p>  </p>
<br>
<p> </p>




<a href = "#">Delete Cart</a>

</body>
</html>