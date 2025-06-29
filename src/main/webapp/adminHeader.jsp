<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Header</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
<style>

*
{
  padding: 0px;
  margin: 0px;
}
body
{
  position: relative;
}
.header
{
  display:flex;
  justify-content:space-between;
  align-items:center;
  height:70px;
  background-color: #2f3542;
}
.cts-logo
{
   border-radius:10px;
}
.navbar ul li a
		{
		 text-decoration: none;
	    color: black;
	    border-radius:2px;
		}
 .navbar ul li
		{
		    float: left;
		    position: relative;
		    list-style:none;
		}
		.navbar ul li a
		{
		    
		    padding:10px 20px;
		    display: block;
		    transition: 0.5s;
		}
		.navbar ul li a:hover 
		{
		    color:white;
		    background-color: #57606f;
		}
		.navbar ul li ul
		{
		   position: absolute;
		   width:200px;
		   background-color:white;
		   display: none;
		   margin: 0px;
		   padding:0px;
		   list-style:none;
		}
		.navbar ul li  ul li a
		{
		  color:#333;
		}
		.navbar ul li  ul li a:hover
		{
		  color: white;
		}
		.navbar ul li  ul li
		{
		  margin:0px;
		  padding:0px;
		  width:100%;
		  list-style:none;
		}
		.navbar ul li:hover>ul
		{
		  display:block;
		}
</style>
</head>
<body>
 <div class="container-fluid">
        <div class="row ">
            <div class="col p-3 mb-2 bg-dark-subtle text-dark-emphasis header">
				 <a class="navbar-brand fw-bold" href="#">ShopingSpot</a>
               <nav class="navbar">
               <ul>
                 <li><a href="#">MEN</a>
                  <ul>
                   <li><a href="addMen.jsp">CREATE PRODUCTS</a></li>
                   <li><a href="ViewProducts.jsp">VIEW & EDIT PRODUCTS</a></li>
                   <li><a href="#">DELETE PRODUCTS</a></li>
                 </ul>
                 </li>
                 <li><a href="#">WOMEN</a>
                  <ul>
                   <li><a href="addWomen.jsp">CREATE PRODUCTS</a></li>
                   <li><a href="ViewDishe.jsp">VIEW & EDIT PRODUCTS</a></li>
                   <li><a href="#">DELETE PRODUCTS</a></li>
                 </ul>
                 </li>
                 <li><a href="#">ELECTRONICS</a>
                  <ul>
                   <li><a href="addElectronic.jsp">CREATE PRODUCTS</a></li>
                   <li><a href="ViewDishe.jsp">VIEW & EDIT PRODUCTS</a></li>
                   <li><a href="#">DELETE PRODUCTS</a></li>
                 </ul>
                 </li>
                 <li><a href="#">HOME&LIVING</a>
                  <ul>
                   <li><a href="addHome&Living.jsp">CREATE PRODUCTS</a></li>
                   <li><a href="ViewDishe.jsp">VIEW & EDIT PRODUCTS</a></li>
                   <li><a href="#">DELETE PRODUCTS</a></li>
                 </ul>
                 </li>
                 <li><a href="BookedProducts.jsp">ORDER MANAGEMENT</a></li>
                 <li><a href="DeliveryBoy.jsp">DELIVERY</a></li>
                </nav>
                <div>
                <form action="signup" method="post">
				 <input type="submit" value="LogOut" name="logout" class="btn btn-danger logout">
				</form>
				</div>
          </div>
       </div>
   </div>      
</body>
</html>