<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add_Dishes</title>
<style type="text/css">
.first_dishe_box
  {
    position:fixed;
    bottom:200px;
    left:950px;
    background-color:white;
    width:500px;
    padding:20px;
    border-radius:20px;
    border: 10px double grey;
  }
.box-1
{
 text-align: center;
 text-indent: 20px;
 margin-top: 20px;
 list-style: none;
}
.box-1 li input
{
  width: 250px;
  padding:5px;
}
.box-1 li select
{
 width: 250px;
  padding:5px;
}
.box-1 li .btn
{
  width: 150px;
  padding:10px;
  border:none;
  background-color: black;
  color:white;
  border-radius: 10px;
}
.admin_img
        {
          background-repeat: none;
          background-origin: border-box;
          height:609px;
          border-radius: 10px;
        }
</style>
</head>
<body>

<div class="container-fluid">
        <div class="row ">
            <div class="col">
            <img alt="" src="Images/Admin-submain.jpg" width="100%"  class="admin_img">
            </div>
         </div>
   </div>               
 

    <div class="first_dishe_box">
            <%String success=(String)request.getAttribute("success");
      if(success!=null){%>
    <h3 style="color:green"><center><%=success%></center></h3>
    <%}%>
    <% String fail=(String)request.getAttribute("failed"); 
    if(fail!=null){%>
    <h3 style="color:red"><center><%=fail%></center></h3> 
    <%}%> 
			     <form action="adding" method="post" enctype="multipart/form-data">
			      <ul class="box-1">
			      <h4>Adding Product Image(and)Details</h4>
			      <li><input type="text" name="Pname" placeholder="Product name"></li><br>
			      <li><input type="text" name="Pprice" placeholder="Product Price"></li><br>
			      <li><input type="text" name="Pstock" placeholder="Product stock"></li><br>
			      <li><input type="text" name="Pdescription" placeholder="Product Description"></li><br>
			      <li>Select Image<input type="file" name="image"></li><br>
			      <li><input type="submit" name="add" value="Submit" class="btn"></li>
			   </ul>
			  </form>
          </div>
</body>
</html>