<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>AdminPage</title>

<style>
.h2_1 {
	text-align: center;
	background-color: bisque;
}
btn_add {
padding-left: 200px;
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

.add_con {
	position: absolute;
	left:400px;
	margin: 100px;
}

* {
	margin: 0;
	padding: 0;
}

.btn_add {
	color: white;
	text-decoration: none;
	padding: 12px;
	background-color: brown;
	border-radius: 12px;
}
body{
background-color:cornsilk;
}

.btn_add:hover {
	background-color: cornflowerblue;
}
}
</style>

</head>

<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div style="position: relative;top: -10px;" class="top_nav">

		<ul>
		

			<li style="float: right;"><a href="logOut">Logout</a></li>
			<li style="float: right;"><a class="active" href="AdminMain.jsp">Admin</a></li>
			


		</ul>


	</div>

	<div class="body_main1">
		<br>

		<div class="add_con">
			<br> <a  class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="AddProduct.jsp">Add Products</a><br>
			
		
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ProductList.jsp">Show All Products</a><br>
		
			
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ViewUser.jsp">Show All Users</a><br>
			
			
			<br> <a class="btn btn-secondary btn-block" style="margin-left: 40px"
				href="ViewContactUs.jsp">Show ContactUs</a><br>
			<br>

		</div>
	</div>



</body>
</html>