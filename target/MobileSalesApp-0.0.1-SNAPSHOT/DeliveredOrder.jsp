
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.mobilesalesapp.impl.OrderImpl" import ="java.sql.*" import ="com.mobilesalesapp.model.OrderPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ViewOrders</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 20px;
}
.h2_1 {
	text-align: center;
	background-color: bisque;
}

.top_nav {
	/* background-color: brown;
        padding: 9px; */
	
}
.btn_add {
	padding: 12px;
	background-color: lightbrown;
	border-radius: 22px;
}

.btn_add:hover {
	background-color: green;
}

.top_nav_in1 {
	position: relative;
	left: 500px;
	padding: 8px;
}

.top_nav_bu1 {
	position: relative;
	left: 520px;
	padding: 8px;
	background-color: cornflowerblue;
}

.top_nav_bu1 :hover {
	background-color: darkgreen;
	color: darkkhaki;
}

.table1 td {
	padding: 15px;
}

.button1 {
	text-decoration: none;
	position: relative;
	left: 60px;
	padding: 12px;
	padding-left: 32px;
	padding-right: 32px;
	color: blanchedalmond;
	border-radius: 12px;
	border-color: black;
	background-color: red;
}

.button1:hover {
	background-color: blue;
}

.mar1 {
	font-size: 30px;
	color: crimson;
}

.body_main {
	margin-top: 120px;
	margin-left: 240px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: brown;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: goldenrod;
}

.active {
	background-color: grey;
}

.phoneInfo {
	margin-left: 250px;
	margin-top: -270px;
	font-size: 20px;
}
.but_log a{
	text-decoration:none;
	color:white;
 	padding: 12px;
 	margin-top:20px;
    margin-left: 100px;
    background-color: rgb(83, 83, 204);
    border-radius: 20px;

}
.but_log{
margin-top:40px;
}

* {
	margin: 0;
	padding: 0;
}
</style>
<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div class="top_nav">

		<ul>
			<li><a  href="AdminMain.jsp">Home</a></li>
			<li><a class="active" href="ViewOrders.jsp">My Orders</a></li>
            <li><a href="ViewCart.jsp">Cart</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>
			<li style="float: right;"><a href="index.jsp">Logout</a></li>
			<li style="float: right;"><a href="AdminLogin.jsp">Admin</a></li>

		</ul>


	</div><br><br>
    <%
    //String user = (String) session.getAttribute("userId");
  //  System.out.println("my"+user);
  
    	int userId = Integer.parseInt(request.getParameter("userId"));
    	System.out.println("my1	"+userId);
    	OrderPojo orderPojo=new OrderPojo(userId);
    	OrderImpl order=new OrderImpl();
    	ResultSet rs=order.viewAllOrders(orderPojo);
    	ResultSet rs1=order.viewAllOrders(orderPojo);
    %>
    <%
    if(rs1.next() ){%>
    	
   
    	
    <table style="width: 80%;margin-left: 100px;">
    <tr>
     <th>Order Id</th>
    <th>Order Status</th>
    <th>Price</th>
    <th>Order Date</th>
    <th>Delivery Address</th>
    <th>Cancel Order</th>
    </tr>
    
  
    
 
    <%while(rs.next()){%>
    <tr>
    <td><%=rs.getInt(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getDouble(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td>
    <form action="deliveredOrder" method="post" >
    Order Id :<input type="text" name="orderId" value="<%=rs.getInt(1) %>" readonly ><br><br>
    
    <button type="submit" class="btn_add ">Delivered</button>
    </form>
    </td>
    </tr>
  
    	<% }%>	
    		
    	
   
    </table>

 <% }
   else{%>
    	<h1 style="color: red ;margin-left: 500px;margin-top: 150px">Order is not placed yet</h1>
   <% }%>
<!--  <h3 style="color: red;margin-left: 300px">No Order Placed</h3> -->


</body>
</html>