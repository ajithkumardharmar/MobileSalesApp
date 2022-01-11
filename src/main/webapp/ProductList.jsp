<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.mobilesalesapp.impl.*"
	import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Product List</title>
</head>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}

.btn_add {
	padding: 12px;
	background-color: lightbrown;
	border-radius: 22px;
}

.btn_add:hover {
	background-color: cornflowerblue;
}

.h2_1 {
	text-align: center;
	background-color: bisque;
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

table {
	background-color: rgb(248, 213, 168);
}


body{
background-color:cornsilk;
}

* {
	margin: 0;
	padding: 0;
}
</style>
<body >
	<h2 class="h2_1">Mobile Sales App</h2>

	<div style="position: relative; top: -10px;" class="top_nav">

		<ul>

			<li style="float: right;"><a href="logOut">Logout</a></li>
			<li style="float: right;"><a class="active" href="AdminMain.jsp">Admin</a></li>



		</ul>


	</div>
	<br>
	<br>
	<br>
	<%
	ListAllProductImpl listAllProductDao = new ListAllProductImpl();
	ResultSet rs = listAllProductDao.viewProduct();
	%>
	<%
	if (session.getAttribute("deleteInfo") != null) {
	%>
	<h3 style="color: green; margin-left: 500px"><%=session.getAttribute("deleteInfo")%></h3>
	<br>
	<%
	}
	%>
	<%
	if (session.getAttribute("updateInfo") != null) {
	%>
	<h3 style="color: green; margin-left: 500px"><%=session.getAttribute("updateInfo")%></h3>
	<br>
	<%
	}
	%>
	<table class="table table-hover table-striped" style="width: 90%; margin-left: 70px;">
		<tr style="background-color: cornflowerblue">
			<th>Product Id</th>
			<th>Product Name</th>
			<th>Description</th>
			<th>Standard Price</th>
			<th>List Price</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<%
		while (rs.next()) {
		%>


		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td>

				<form action="updateProduct" method="post">

					Product Id : <input type="text" name="updateId"
						value=<%=rs.getInt(1)%> readonly id="brand_textbox"
						pattern="[0-9]{1,8}" maxlength="8" required class="updateId"><br>
					<br> <label class="add_label1">Standard_cost :</label> <input
						type="text" name="updateStandardPrice" id="brand_textbox"
						pattern="[0-9]{1,8}" maxlength="8" required class="add_inputs1"><br>
					<br> <label class="add_label2">List Price :</label> <input
						type="text" name="updateListPrice" id="brand_textbox"
						pattern="[0-9]{1,8}" maxlength="8" required class="add_inputs2"><br>
					<br>
					<button type="submit" class="btn btn-success">Update</button>
					<br> <br>

				</form>
			</td>
			<td>
				<form action="deleteProduct" method="post">
					Product Id : <input type="text" value=<%=rs.getInt(1)%> readonly
						name="deleteId" id="brand_textbox" pattern="[0-9]{1,8}"
						maxlength="8" required class="deleteId"><br> <br>
					<button type="submit" class="btn btn-danger">Delete</button>
					<br> <br>

				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>

	<%
	session.removeAttribute("deleteInfo");
	%>
	<%
	session.removeAttribute("updateInfo");
	%>
</body>
</html>