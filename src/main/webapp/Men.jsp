<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <style>
    body {
      background-color: #f8f9fa;
      padding: 30px;
    }
    #product-list
    {
      display: flex;
    }
    .product-card {
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 10px;
      transition: transform 0.2s;
    }
    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 16px rgba(0,0,0,0.15);
    }
    .product-img {
      height: 250px;
      object-fit: cover;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }
    .btn-add-cart {
      margin-right: 10px;
      margin-top: 10px;
    }
        .line-clamp-2 {
      display: -webkit-box;
      -webkit-line-clamp: 2; 
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    
    .features {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
	padding:20px 10px;
}

.feature-cards{
	background-color: rgba(255, 255, 255, 0.1);
	border: 2px solid rgba(255, 255, 255, 0.2);
	color: black;
	padding:10px;
	width: 250px;
	border-radius: 15px;
	text-align: center;
	backdrop-filter: blur(5px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
	border-style: double;
	border-color: yellow;
}

.feature-cards:hover {
	transform: translateY(-5px);
}

.feature-cards h3 {
	font-size:25px;
}

.feature-cards a{
	list-style: none;
	text-decoration: none;
}
.feature-cards p {
	font-size: 14px;
	opacity: 0.9;
}
a
{
  text-decoration: none;
  
}
  </style>
</head>
<body>

<div class="caontainer-fluid">
  <section class="features">
            <%%>
			<div class="feature-cards">
				<h3><a href="Men.jsp?type=shirt">Men's Shirt</a></h3>
			</div>
			<div class="feature-cards">
				<h3><a href="Men.jsp?type=pant">Men's Pant</a></h3>
			</div>
			<div class="feature-cards">
				<h3><a href="Men.jsp?type=t-shirt">Men's T-Shirt</a></h3>
			</div>
 </section>
 </div>


   <%Registration reg=new Registration(session);
   String id=(String)session.getAttribute("id");
   String type=request.getParameter("type");
   ArrayList<Product> list=reg.getdetails(type);
   ArrayList<Product> list1=reg.getdetails();%>
   
  <div class="container">
  <%if(type!=null){%>
    <div class="row" id="product-list">
     <%for(Product p:list){%>
         <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
         <div class="card product-card">
          <img src="Shirts/<%=p.getPimage()%>" class="card-img-top product-img" alt="<%=p.getPimage()%>" />
          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><%=p.getPname()%></h5>
            <p class="card-text line-clamp-2"><%=p.getPdesc()%></p>
            <p class="card-text fw-bold">&#8377;<%=p.getPrice()%></p>
            <%if(p.getPstock()>0){%>
            <p><span class="badge bg-success">In Stock:<%=p.getPstock()%></span></p>
            <%}else{%>
            <p><span class="badge bg-danger">In Stock:<%=p.getPstock()%></span></p>
            <%}%>
            
            
            <%if(session.getAttribute("uname")!=null){%>
            <form action="addtocart" method="post"> 
            <div class="mt-auto">
              <select name="size" class="btn btn-secondary">
              <option selected="selected">Select Size</option>
              <option>Small</option>
              <option>Medium</option>
              <option>Large</option>
              </select>
              
              <select name="quantity" class="btn btn-secondary">
              <option selected="selected">Qty</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              </select>
            </div>
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
            <input type="hidden" name="pname" value="<%=p.getPname()%>">
            <input type="hidden" name="pdesc" value="<%=p.getPdesc()%>">
              <input type="hidden" name="pimage" value="<%=p.getPimage()%>">
              <input type="hidden" name="pcost" value="<%=p.getPrice()%>">
           <%if(p.getPstock()>0){%>
            <div class="mt-auto">
              <button type="submit" name="addtocart" class="btn btn-primary btn-add-cart">Add to Cart</button>
              <button class="btn btn-success">Order</button>
              <a class="btn btn-secondary btn-add-cart" href="Review.jsp?pid=<%=p.getPid()%>" role="button">Reviews</a>
            </div>
            <%}else{%>
             <div class="mt-auto">
              <button class="btn btn-primary btn-add-cart" onclick="empty()">Add to Cart</button>
              <button class="btn btn-success" onclick="empty()">Order</button>
              <a class="btn btn-secondary btn-add-cart" href="Review.jsp?pid=<%=p.getPid()%>" role="button">Reviews</a>
            </div>
            <%}%>
             </form>
             <%}else{%>
              <p>Please log in to addtocart</p>
             <%}%>
          </div>
        </div>
         </div>
          <%}%>
    </div>
    <%}else{%>
    <div class="row" id="product-list">
     <%for(Product p:list1){%>
         <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
         <div class="card product-card">
          <img src="Shirts/<%=p.getPimage()%>" class="card-img-top product-img" alt="<%=p.getPimage()%>" />
          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><%=p.getPname()%></h5>
            <p class="card-text line-clamp-2"><%=p.getPdesc()%></p>
            <p class="card-text fw-bold">&#8377;<%=p.getPrice()%></p>
            <%if(p.getPstock()>0){%>
            <p><span class="badge bg-success">In Stock:<%=p.getPstock()%></span></p>
            <%}else{%>
            <p><span class="badge bg-danger">In Stock:<%=p.getPstock()%></span></p>
            <%}%>
            
            <%if(session.getAttribute("uname")!=null){%>
            <form action="addtocart" method="post"> 
            <div class="mt-auto">
              <select name="size" class="btn btn-secondary">
              <option selected="selected">Select Size</option>
              <option>Small</option>
              <option>Medium</option>
              <option>Large</option>
              </select>
              
              <select name="quantity" class="btn btn-secondary">
              <option selected="selected">Qty</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              </select>
            </div>
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
             <input type="hidden" name="pname" value="<%=p.getPname()%>">
             <input type="hidden" name="pdesc" value="<%=p.getPdesc()%>">
              <input type="hidden" name="pimage" value="<%=p.getPimage()%>">
              <input type="hidden" name="pcost" value="<%=p.getPrice()%>">
            <%if(p.getPstock()>0){%>
            <div class="mt-auto">
              <button type="submit" name="addtocart" class="btn btn-primary btn-add-cart">Add to Cart</button>
              <button type="submit" class="btn btn-success">Order</button>
              <a class="btn btn-secondary btn-add-cart" href="Review.jsp?pid=<%=p.getPid()%>" role="button">Reviews</a>
            </div>
            <%}else{%>
             <div class="mt-auto">
              <button class="btn btn-primary btn-add-cart" onclick="empty()">Add to Cart</button>
              <button class="btn btn-success" onclick="empty()">Order</button>
              <a class="btn btn-secondary btn-add-cart" href="Review.jsp?pid=<%=p.getPid()%>" role="button">Reviews</a>
            </div>
            <%}%>
            </form>
             <%}else{%>
              <p>Please <a href="login.jsp">login</a> to addtocart</p>
             <%}%>
          </div>
        </div>
         </div>
          <%}%>
    </div>
    <%}%>
  </div>
</body>
<script type="text/javascript">
const Stock = document.getElementById('stock');
const  value=Stock.value;

const stockText = value > 0 
? `<span  >In Stock: value</span>` 
: `<span class="badge bg-danger">Out of Stock</span>`;

function empty()
{
	alert("Stack Not Avaialble")
}
</script>
</html>