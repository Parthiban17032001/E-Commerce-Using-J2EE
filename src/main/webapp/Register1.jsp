<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	background:
		url('Images/ecommerce.jpg')
		no-repeat;
	backdrop-filter: blur(3px);
	background-size: cover;
}

.container {
	width: 100%;
	max-width: 650px;
	background: transparent;
	padding: 28px;
	margin: 0 28px;
	margin-left:-700px;
	border-radius: 10px;
	box-shadow: inset -2px 2px 2px white;
}

.form-title {
	font-size: 26px;
	font-weight: 600;
	text-align: center;
	padding-bottom: 6px;
	color: white;
	text-shadow: 2px 2px 2px black;
	border-bottom: solid 1px white;
}

.main-user-info {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 20px 0;
}

.user-input-box:nth-child(2n) {
	justify-content: end;
}

.user-input-box {
	display: flex;
	flex-wrap: wrap;
	width: 50%;
	padding-bottom: 15px;
}

.user-input-box label {
	width: 95%;
	color: white;
	font-size: 18px;
	font-weight: 400;
	margin: 5px 0;
}

.user-input-box input {
	height: 40px;
	width: 95%;
	border-radius: 7px;
	outline: none;
	border: 1px solid grey;
	padding: 0 10px;
}

.form-submit-btn {
	margin-top: 40px;
}

.form-submit-btn button {
	display: block;
	width: 100%;
	margin-top: 10px;
	font-size: 20px;
	padding: 10px;
	border: none;
	border-radius: 3px;
	color: rgb(209, 209, 209);
	background: rgb(122, 122, 238)
}

.form-submit-btn button:hover {
	background: rgba(56, 204, 93, 0.7);
	color: rgb(255, 255, 255);
}

p {
	text-align: center;
	color: White;
}

p  a {
	font-size: 20px;
	text-decoration: none;
	color: Green;
}

p a:hover {
	color: rgb(209, 209, 209);
	background: rgb(122, 122, 238)
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="form-title">Registration</h1>

		<center>
			<%String fail=(String)request.getAttribute("faliure");
        if(fail!=null){%>
			<h3 style="color: red"><%=fail%></h3>
			<%} %>
		</center>

		<center>
			<%String error=(String)request.getAttribute("error");
        if(error!=null){%>
			<h3 style="color: red"><%=error %></h3>
			<%} %>
		</center>

		<form action="register" method="post">
			<div class="main-user-info">
				<div class="user-input-box">
					<label for="fullname">Full Name :</label> <input type="text"
						id="fullname" name="fullname" placeholder="Enter full name"
						required>
				</div>
				<div class="user-input-box">
					<label for="phone">Phone :</label> <input type="tel" id="phone"
						name="phone" placeholder="Enter number" required>
				</div>
				<div class="user-input-box">
					<label for="mail">Mail :</label> <input type="text" id="mail"
						name="mail" placeholder="Enter your mail" required>
				</div>
				<div class="user-input-box">
					<label for="password">Password :</label> <input type="password"
						id="password" name="password" placeholder="Enter password"
						required>
				</div>
				<div class="user-input-box">
					<label for="conpassword">Confirm Password :</label> <input
						type="password" id="conpassword" name="conpassword"
						placeholder="Confirm password" required>
				</div>
			</div>
			<div class="form-submit-btn">
				<button type="submit" value="login.jsp">Register</button>
			</div>
		</form>
		<br>
		<p>
			Already have account? <span><a href="login.jsp">Login</a></span>
		</p>
	</div>
</body>
</html>