<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>MobileBuyingPage</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}
.h2_1 {
	text-align: center;
	background-color: bisque;
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
.buy_div{
margin-left:400px;

}
.buy_button{
position: relative;
	left: 80px;
	padding:12px;
	color: blanchedalmond;
	border-radius: 12px;
	
	background-color: rgb(83, 83, 204);
}
table th{
padding: 5px;
padding-right: 25px;
}
body{
background-color:cornsilk;
}
</style>
<body bgcolor="cornsilk">



     <% String name =(String)session.getAttribute("name");%>
      
      
      
	<h2 class="h2_1">Mobile Sales App</h2>

	<div style="position: relative;top: -10px;" class="top_nav">

		<ul>
			<li><a class="active" href="MobilePage.jsp">Home</a></li>
			<li><a href="ViewOrders.jsp">My Orders</a></li>
            <li><a href="ViewCart.jsp">Cart</a></li>
            <li><a href="MyProfile.jsp">My Profile</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>
			<li style="float: right;"><a href="logOut">Logout</a></li>
		

		</ul>

	<%double price=(double)session.getAttribute("price"); %>

	</div></body>
	<div class="buy_div">
	<form action="buying" method="post"><br>
	<h4 style="margin-left: 70px;color: blue">Hello <%=name %></h4>
	<table>
	<tr>
	<th>Address Line  :</th>
	<td><input autocomplete="off" name="address1" required="required" pattern="[a-zA-Z0-9\s,[]]{3,40}" type="text" ><br><br></td>
	 
	</tr>
	<tr>
	<th>City/Town    :</th>
	<td> <input autocomplete="off" name="address2" required="required" pattern="[a-zA-Z0-9\s,[]]{3,40}" type="text" ><br><br></td>
		</tr>
	<tr>
	<th>Pincode :</th>
	<td> <input autocomplete="off" name="pincode" required="required" pattern="[0-9]{6}" maxlength="6" type="text"><br><br></td>
	</tr>
	<tr>
	<th>Phone Number :</th>
	<td><input autocomplete="off" class="c_user2" name="phone_number" type="text"
                pattern="[6789]{1}+[0-9]{9}" maxlength="10"  title="Enter only 10 digit number" required><br><br></td>
	</tr>
	<tr>
	<th> Password :</th>
	<td> <input autocomplete="off" name="password" required="required" pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password"><br><br></td>
	</tr>
	<tr>
	<th> Quantity : </th>
	<td><input type="text" id="myInput1" onkeyup="myFunction()" maxlength="2" value=1 pattern="[1-9]{1+}" ><br><br></td>
	</tr>
	<tr>
	<th> Price  : </th>
	<td> <input type="text" id="myInput2" maxlength="2" value=<%=price%> pattern="[1-9]+{1+}" ><br><br></td>
	</tr>
	
	<%double total=(price-(price*.15));%>
	<tr>
	<th> Total Price(Discount 15%):</th>
	<td> <input type="text" id="myInput3" readonly name="total1" value=<%=total%>><br><br></td>
	</tr>
	
	
	
	<tr>
	<th> <h5 id="timehead" style="margin-left: 150px;"></h5></th>
	</tr>
	
	<%session.setAttribute("total",total); %>	
	<%if(session.getAttribute("buying")!=null){ %>
	<h4 style="color:red;margin-left: 50px"><%=session.getAttribute("buying") %></h3>
	<%} %>
	<tr>
	<th> <button style="margin-left: 150px" class="btn btn-success btn-lg" type="submit">Buy</button><br><br></th>
	</tr>
	</form>
	
	
	</div>
	</table>
	<%session.removeAttribute("buying"); %>
	
	
	<script type="text/javascript">
	 function myFunction() {
         var Input1, Input2, sum,sum1;
         Input1 = document.getElementById("myInput1").value;
         Input2 = document.getElementById("myInput2").value;
         sum = (Input1 * Input2)*0.85;
         
			console.log(sum);
			console.log("sum");
         document.getElementById("myInput3").value = sum;
     }
	
	 console.log("sum");
	let th = document.getElementById("timehead");
	let time = 120;
	let i;
	window.addEventListener('load', () =>{
		
		 i= setInterval(() => {
			if(time > 0){
				if(time >= 30){
					
			th.innerHTML = "00 : " + time--;
			
				}else{
					th.style.color = "red";
					th.innerHTML = "00 : 0" + time--;
				}
			}else{
				clearInterval(i);
				window.location.assign("MobilePage.jsp");
			}
		},1000);
		
	});
	</script>
</html>