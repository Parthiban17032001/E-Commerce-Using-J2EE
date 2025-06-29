<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop-Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
*
{
   padding:0px;
   margin:0px;
}
.header
{
  display: flex;
  justify-content: space-between;
  margin-top:10px;
}
.title h1
{
  font-size:xx-large;
  font-weight:700;
  color:#2832C2;
}
.body
{
  text-align: center;
  margin-top:40px;
}
.features {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
	padding: 50px 20px;
}

.feature-card {
	background-color: rgba(255, 255, 255, 0.1);
	border: 2px solid rgba(255, 255, 255, 0.2);
	color: black;
	padding: 20px;
	width: 300px;
	border-radius: 15px;
	text-align: center;
	backdrop-filter: blur(5px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
}

.feature-cards{
	background-color: rgba(255, 255, 255, 0.1);
	border: 2px solid rgba(255, 255, 255, 0.2);
	color: black;
	padding: 20px;
	width: 300px;
	border-radius: 15px;
	text-align: center;
	backdrop-filter: blur(5px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
	border-style: double;
	border-color: yellow;
}
.feature-card:hover {
	transform: translateY(-5px);
}

.feature-card h3 {
	font-size: 20px;
	margin-bottom: 10px;
}

.feature-card p {
	font-size: 14px;
	opacity: 0.9;
}

.feature-cards:hover {
	transform: translateY(-5px);
}

.feature-cards h3 {
	font-size:25px;
	margin-bottom: 10px;
}

.feature-cards a{
	list-style: none;
	text-decoration: none;
}
.feature-cards p {
	font-size: 14px;
	opacity: 0.9;
}
</style>
</head>
<body>
  <div class="container header">
  <a href="home.jsp" class="btn btn-secondary">>>Back</a>
  <%if(session.getAttribute("uname")!=null){%>
  <a href="signup?logout=yes" class="btn btn-danger">Logout>></a>
  <%}%>
  </div>
  
  <div class="container body">
  <div class="title">
    <h1>Welcome to</h1>
    <h1>ShopingSpot</h1><br>
  </div>
  <div>
  <p>Welcome to <span style="color:#2832C2">Shopping Spot</span> – your ultimate destination for quality and savings</p>
  <p>Shop the latest trends and enjoy a seamless online shopping experience!</p>
  <p>Shop from a wide range of categories, from fashion to electronics, at unbeatable prices</p>
  </div>
  </div>
    
  <div class="caontainer-fluid">
  <section class="features">
			<div class="feature-cards">
				<h3><a href="Men.jsp">Men's Fashion</a></h3>
			</div>
			<div class="feature-cards">
				<h3><a href="#">Women's Fashion</a></h3>
			</div>
			<div class="feature-cards">
				<h3><a href="#">Electronics</a></h3>
			</div>
			<div class="feature-cards">
				<h3><a href="#">Home-Livings</a></h3>
			</div>
 </section>
 </div>
  
  
  <div class="caontainer-fluid">
  <section class="features">
			<div class="feature-card">
				<h3>⚡ About the Website</h3>
				<p>At ShoppingSpot, we bring you the latest trends and best deals – all in one place.</p>
			</div>
			<div class="feature-card">
				<h3>🔒  Why Choose Us</h3>
				<p>Trusted by thousands of happy customers for our fast delivery and top-notch service.</p>
			</div>
			<div class="feature-card">
				<h3>🕒 Engaging the Customer</h3>
				<p>Looking for something special? Browse our collections and find what you love!</p>
			</div>
			<div class="feature-card">
				<h3>🕒 24/7 Support</h3>
				<p>We offer secure payments, easy returns, and 24/7 customer support – shopping made simple!</p>
			</div>
		</section>
 </div>		
</body>
</html>