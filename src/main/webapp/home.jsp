<%@page import="com.MVC.Model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Commerce | Home</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f5f5f5;
    }
    .category-card:hover {
      transform: scale(1.05);
      transition: transform 0.3s ease;
    }
    .carousel-caption {
      background: rgba(0, 0, 0, 0.5);
      padding: 20px;
      border-radius: 10px;
    }
    a
    {
      text-decoration: none;
      color: black
    }
    
    
    
        #navbarNav ul li
		{
		    float: left;
		    position: relative;
		     margin-top:10px;
		}
		#navbarNav ul li a
		{
		    
		    padding:10px 20px;
		    display: block;
		    transition: 0.7s;
		}
		#navbarNav ul li a:hover 
		{
		    background-color: #57606f;
		    border-radius:10px;
		    color: white;
		}
		#navbarNav ul li ul
		{
		   position: absolute;
		   width:200px;
		   background-color:white;
		   display: none;
		   margin: 0px;
		   padding:0px;
		   list-style: none;
		}
		#navbarNav ul li  ul li a
		{
		  color:#333;
		}
		#navbarNav ul li  ul li a:hover
		{
		  color: white;
		}
		#navbarNav ul li  ul li
		{
		  margin:0px;
		  padding:0px;
		  width:100%;
		}
		#navbarNav ul li:hover>ul
		{
		  display:block;
		}
		.category-card
		{
		  height:200px;
		}
		
	.page-section {
	background-color: rgba(255, 255, 255, 0.15);
	margin: 60px auto;
	padding: 60px 40px;
	max-width: 1000px;
	border-radius: 12px;
	color: black;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
	text-align: center;
   }

	.page-section h2 {
		font-size: 32px;
		margin-bottom: 20px;
		border-bottom: 2px solid #ccc;
		padding-bottom: 10px;
	}
	
	

    input{
        padding: 10px;
        border-radius: 15px;
        width: 50%;
        border:2px solid rgb(208, 148, 148); 
    }
    
    
    	
  </style>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
  <!-- Header -->
  <%String uname=(String)session.getAttribute("uname");%>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
      <a class="navbar-brand fw-bold" href="#">ShopingSpot</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto">
          <li class="nav-item"><a class="nav-link active" href="home.jsp">🏚️ Home</a></li>
          <li class="nav-item"><a class="nav-link" href="shop.jsp">🛍️ Shop</a></li>
          <li class="nav-item"><a class="nav-link" href="#about">ℹ️ About</a></li>
          <li class="nav-item"><a class="nav-link" href="#contact">📞 Contact</a></li>
           <%if(session.getAttribute("uname")!=null){%>
           <li><a href="cart.jsp">🛒 Cart</a></li>
           <li><a href="order.jsp">📦 MyOrder</a></li>
            <li><a href="#">👤<%=uname.toUpperCase()%></a></li>
           <%}%>
        </ul>
        <div class="d-flex">
        <%if(session.getAttribute("uname")!=null){%>
         <a href="signup?logout=yes" class="btn btn-danger me-2">Logout</a>
         <%}else{%>
          <a href="login.jsp" class="btn btn-primary me-2">Login</a>
          <a href="register.jsp" class="btn btn-success">Sign Up</a>
          <%}%>
        </div>
      </div>
    </div>
  </nav>
  <!-- Hero Section with Slider -->
  <section class="container">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="Images/Images-1.jpg" class="d-block w-100" alt="Slide 1" height="600px">
          <div class="carousel-caption d-none d-md-block">
            <h1>Shop the Latest Trends</h1>
            <p>Best Deals on Quality Products</p>
            <a href="register.jsp" class="btn btn-light btn-lg me-2">Shop Now</a>
            <a href="shop.jsp" class="btn btn-outline-light btn-lg">Explore Products</a>
          </div>
        </div>
        <div class="carousel-item">
            <img src="Images/Images-2.jpg" class="d-block w-100"  height="600px" alt="Slide 2">
          <div class="carousel-caption d-none d-md-block">
            <h1>Discover the New Arrivals</h1>
            <p>Latest fashion and accessories in stock</p>
            <a href="shop.jsp" class="btn btn-light btn-lg">Shop Collection</a>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Images/Images-3.jpg" class="d-block w-100"  height="600px" alt="Slide 3">
          <div class="carousel-caption d-none d-md-block">
            <h1>Exclusive Offers Just for You</h1>
            <p>Sign up and save big on your first purchase</p>
            <a href="register.jsp" class="btn btn-primary btn-lg">Get Started</a>
          </div>
        </div>
        <div class="carousel-item">
          <img src="Images/Images-4.jpg" class="d-block w-100"  height="600px" alt="Slide 4">
          <div class="carousel-caption d-none d-md-block">
            <h1>Upgrade Your Lifestyle</h1>
            <p>Top quality gadgets and home goods</p>
            <a href="shop.jsp" class="btn btn-success btn-lg">Browse Deals</a>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </section>

  
  <!-- Categories -->
  <section class="py-5">
    <div class="container">
      <h2 class="mb-4 text-center">Shop by Category</h2>
      <div class="row g-4">
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card category-card text-center">
            <img src="Images/Fashion.png"  class="card-img-top h-100" alt="Men">
            <div class="card-body">
              <h5 class="card-title">Men's Fashion</h5>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card category-card  text-center">
            <img src="Images/Women's Fashion.jpg" class="card-img-top h-100" alt="Women">
            <div class="card-body">
              <h5 class="card-title">Women's Fashion</h5>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card category-card text-center">
            <img src="Images/Electronic.png" class="card-img-top h-100" alt="Electronics">
            <div class="card-body">
              <h5 class="card-title">Electronics</h5>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card category-card text-center">
            <img src="Images/Home&Furniture.png" class="card-img-top h-100" alt="Home">
            <div class="card-body">
              <h5 class="card-title">Home & Living</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>	
  
<!-- About Us -->
<div class="container">
<section id="about" class="page-section">
			<h2>ℹ️ About Us</h2>
			<p>At ShoppingSpot, we bring you the latest trends and best deals – all in one place.
			Shop from a wide range of categories, from fashion to electronics, at unbeatable prices.</p>
</section>
</div>
<!--Contact us -->
<div class="container">
<div id="contact" class="page-section">
<h2 style="color: rgb(208, 148, 148);">✉︎ Contact Us</h2>
<% String status = (String)request.getAttribute("status"); %>
 <% if(request.getAttribute("status") != null) { %>
        <script>
            alert("<%= status %>");
        </script>
        <% } %>
    <form action="https://formsubmit.co/parthibansathya798@gmail.com" method="post" onsubmit="sendEmail();" reset(); return();>
        <br><br>
        <%if(session.getAttribute("uname")!=null){%>
        <input type="text" placeholder="Name" name="name"  value=<%=session.getAttribute("uname") %> required><br><br>
        <input type="email" placeholder="Email" name="email" id="email" value=<%=session.getAttribute("email") %> required><br><br>
        <%}else{%>
        <input type="text" placeholder="User Name" name="name" required><br><br>
        <input type="email" placeholder="Email" name="email" id="email" required><br><br>
        <%}%>
        <input type="tel" placeholder="Phone" name="phone" id="phone" ><br><br>
        <input type="text" placeholder="Subject" name="subject" required><br><br>
        <input type="text" placeholder="Message" name="message" required><br><br>
        <input type="hidden" name="_next" value="http://localhost:8084/E-Commerce/">
        <input type="submit" class="btn btn-primary" name="Contact" value=Contact >
    </form>
    </div>
    </div>
   


  <!-- CTA Slider -->
  <section class=" bg-dark text-white text-center py-5">
    <div class="container">
      <div id="ctaCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <h2>Join thousands of happy customers</h2>
            <p>Sign up now to get access to exclusive deals and offers!</p>
          </div>
          <div class="carousel-item">
            <h2>Free Shipping on Orders Over <span>&#8377</span>2000</h2>
            <p>Shop now and enjoy fast, free delivery!</p>
          </div>
          <div class="carousel-item">
            <h2>Secure Payments</h2>
            <p>Your data is safe with our advanced encryption</p>
          </div>
          <div class="carousel-item">
            <h2>24/7 Customer Support</h2>
            <p>We’re here to help whenever you need us</p>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#ctaCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#ctaCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
       <%if(session.getAttribute("uname")==null){%>
      <div class="mt-4">
        <a href="register.jsp" class="btn btn-light btn-lg">Sign Up</a>
      </div>
      <%}%>
    </div>
  </section>

  <!-- Testimonial Section -->
  <section class="py-5 bg-light">
    <div class="container">
      <h2 class="text-center mb-4">What Our Customers Say</h2>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card h-100">
            <div class="card-body">
              <p class="card-text">"Amazing experience! Quick delivery and excellent products."</p>
              <h5 class="card-title">- Sarah M.</h5>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card h-100">
            <div class="card-body">
              <p class="card-text">"I always find great deals here. Highly recommend ShopEasy!"</p>
              <h5 class="card-title">- Rajesh K.</h5>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card h-100">
            <div class="card-body">
              <p class="card-text">"Customer support is fantastic. They really care about users."</p>
              <h5 class="card-title">- Elena G.</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-dark text-light py-4">
    <div class="container text-center">
      <p>&copy; 2025 ShopingSpot. All rights reserved.</p>
      <p>
        <a href="#" class="text-light me-3">About Us</a>
        <a href="#" class="text-light me-3">Contact</a>
        <a href="#" class="text-light">Terms & Conditions</a>
      </p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
