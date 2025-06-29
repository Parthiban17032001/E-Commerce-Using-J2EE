<%@page import="com.MVC.Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Tracking & Review</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .product-card {
      max-width: 600px;
      margin: auto;
    }
    .star {
      font-size: 1.5rem;
      color: gray;
      cursor: pointer;
    }
    .star.selected {
      color: orange;
    }
  </style>
</head>
<body>
<%
Registration reg=new Registration(session);
ArrayList<Order> list=reg.getorderinfo();%>
<%if(list!=null){%>
<div class="container mt-5">
<h2 class="text-center mb-4">Your Order</h2>
<%for(Order item:list){%>
<%if (item.getStatus().equals("ordered") || item.getStatus().equals("OrderConfirm") || item.getStatus().equals("Shipped") || item.getStatus().equals("Delivered")) {%>
  <div class="card product-card shadow-sm">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="Shirts/<%=item.getCimage()%>" class="img-fluid rounded-start" alt="Product Image">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title"><%=item.getCname()%></h5>
          <p class="card-text mb-1">Order ID: <strong>ORD<%=item.getOid()%></strong></p>
          <p class="card-text">QTY:<%=item.getCost()%></p>
          <%if(item.getSize()!=null){%>
          <p class="card-text">Size:<%=item.getSize()%></p>
          <%}%>
          <p class="card-text">Price:<%=item.getQty()%></p>
          <button class="btn btn-primary mt-2" onclick="showTracking()">Track Order</button><br>
                                <%if(item.getStatus().equals("ordered") || item.getStatus().equals("OrderConfirm")){%>
                                <form action="order" method="post">
                                    <input type="hidden" name="orderid" value="<%=item.getOid()%>"/><br>
                                    <input type="submit" class="btn btn-warning" name="deleteorder" value="Cancel Order">
                                </form>
                                <%}else if(item.getStatus().equals("Delivered")){%>
                                <form action="order" method="post">
                                    <input type="hidden" name="orderid" value="<%=item.getOid()%>"/><br>
                                    <input type="submit" class="btn btn-danger" name="deleteorder" value="Delete">
                                </form>
                                <%}%>
        </div>
      </div>
    </div>

    <!-- Tracking Info -->
    <%if(item.getStatus().equals("ordered")){%>
    <div id="trackingInfo" class="p-3 d-none">
      <h6>Order Status: <span id="statusText" class="text-primary">Pending</span></h6>
      <div class="progress mt-2">
        <div id="progressBar" class="progress-bar bg-primary progress-bar-striped progress-bar-animated" style="width:25%">Pending</div>
      </div>
     </div> 
    <%}else if(item.getStatus().equals("OrderConfirm")){%>
    <div id="trackingInfo" class="p-3 d-none">
      <h6>Order Status: <span id="statusText" class="text-warning"><%=item.getStatus()%></span></h6>
      <div class="progress mt-2">
        <div id="progressBar" class="progress-bar  bg-warning progress-bar-striped progress-bar-animated" style="width:50%"><%=item.getStatus()%></div>
      </div>
     </div> 
    <%}else if(item.getStatus().equals("Shipped")){%>
    <div id="trackingInfo" class="p-3 d-none">
      <h6>Order Status: <span id="statusText" class="text-secondary"><%=item.getStatus()%></span></h6>
      <div class="progress mt-2">
        <div id="progressBar" class="progress-bar bg-secondary progress-bar-striped progress-bar-animated" style="width:75%"><%=item.getStatus()%></div>
      </div>
    </div>
    <%}else if(item.getStatus().equals("Delivered")){%>
    <div id="trackingInfo" class="p-3 d-none">
      <h6>Order Status: <span id="statusText" class="text-success"><%=item.getStatus()%></span></h6>
      <div class="progress mt-2">
        <div id="progressBar" class="progress-bar bg-success progress-bar-striped progress-bar-animated" style="width: 100%"><%=item.getStatus()%></div>
      </div>
      <button class="btn btn-outline-success mt-3" onclick="showReviewForm()">Give Review</button>
    </div>
    <%}%>
    <!-- Review Form -->
    <div id="reviewForm" class="p-3 d-none border-top">
      <h5 class="mb-3">Write a Review</h5>
      <form action="review" post="method" onsubmit="submitReview(event)">
        <div class="mb-2">
          <label class="form-label">Name</label>
          <input type="text" name="name" class="form-control" value="<%=session.getAttribute("uname")%>" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control" value="<%=session.getAttribute("email")%>" required>
        </div>
        <div class="mb-2">
          <label class="form-label">Message</label>
          <textarea name="message" class="form-control" rows="3" required></textarea>
        </div>
        <div class="mb-2">
          <label class="form-label">Rating</label><br>
          <span class="star" onclick="rate(1)">★</span>
          <span class="star" onclick="rate(2)">★</span>
          <span class="star" onclick="rate(3)">★</span>
          <span class="star" onclick="rate(4)">★</span>
          <span class="star" onclick="rate(5)">★</span>
          <input type="hidden" name="rating" id="ratingValue" required>
        </div>
        <button class="btn btn-success mt-2" type="submit">Submit Review</button>
      </form>
    </div>
  </div>
</div>
<br>
<%}%>
<%}%>
<%}else{%>
<p>No orders found</p>
<%}%>
<script>
  function showTracking() {
    document.getElementById('trackingInfo').classList.remove('d-none');
  }

  function showReviewForm() {
    document.getElementById('reviewForm').classList.remove('d-none');
  }

  function rate(stars) {
    document.getElementById('ratingValue').value = stars;
    const allStars = document.querySelectorAll('.star');
    allStars.forEach((star, index) => {
      star.classList.toggle('selected', index < stars);
    });
  }

  function submitReview(e) {
    e.preventDefault();
    alert("Thank you! Your review has been submitted.");
    document.getElementById('reviewForm').reset();
    document.getElementById('reviewForm').classList.add('d-none');
  }
</script>

</body>
</html>
