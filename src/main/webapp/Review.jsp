<%@page import="com.MVC.Model.Product"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body
{
  background-color: #f8f9fa;
}
.viewcard
{
  margin-left:290px;
  margin-top: 100px;
  width:900px;
}
.review-card
{
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  background-color:white;
  
  width: 900px;
  margin-left:280px;
}
</style>
</head>
<body>
<%int pid=Integer.parseInt(request.getParameter("pid"));
Registration reg=new Registration(session);
Product p=reg.productdetails(pid);%>


<div class="card mb-3 viewcard" style="max-width:900px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="Shirts/<%=p.getPimage()%>" class="img-fluid rounded-start" alt="<%=p.getPname()%>" >
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=p.getPname()%></h5>
        <p class="card-text"><%=p.getPdesc()%></p>
        <p class="card-text fw-bold">&#8377;<%=p.getPrice()%></p>
            <%if(p.getPstock()>0){%>
            <p><span class="badge bg-success">In Stock:<%=p.getPstock()%></span></p>
            <%}else{%>
            <p><span class="badge bg-danger">In Stock:<%=p.getPstock()%></span></p>
            <%}%>
            <div class="mt-auto">
              <select class="btn btn-secondary">
              <option selected="selected">Select Size</option>
              <option>S</option>
              <option>M</option>
              <option>L</option>
              </select>
            </div><br>
           <%if(p.getPstock()>0){%>
            <div class="mt-auto">
              <button class="btn btn-primary btn-add-cart">Add to Cart</button>
              <button class="btn btn-success">Order</button>
            </div>
            <%}else{%>
             <div class="mt-auto">
              <button class="btn btn-primary btn-add-cart" onclick="empty()">Add to Cart</button>
              <button class="btn btn-success" onclick="empty()">Order</button>
            </div>
            <%}%>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
<div class="row">
<div class="col-sm-6 col-md-4 col-lg-3 mb-4">
<div class="review-card">
   <h4>Reviews about Product</h4>
   <span>admin123@gmailcom</span><br>
   <span>ksdnfkgjfdbgjhdfjgnfjdnbbbbbbbbbbbbbbbbbbbbvvnbjfvjlknfmbvnmbfnvbncbvnmcvmvmn,</span><br>
   <span>Rating 5</span>
</div>
</div>
</div>
</div>

</body>
<script>
function empty()
{
	alert("Stack Not Avaialble")
}
</script>
</html>