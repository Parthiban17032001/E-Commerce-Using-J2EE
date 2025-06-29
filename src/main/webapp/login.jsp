<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
   *
        {
            padding:0px;
            margin:0px;
        }
        body
        {
            background-image:url(Images/ecommerce.jpg);
            background-repeat: no-repeat;
            backdrop-filter: blur(3px);
            background-size: cover;
        }
        .box
        {
          text-align: center;
           margin-top:10%;
          margin-right:50%;
        }
        input
        {
            margin: 10px;
            padding-left:40px;
            padding-top:5px;
            padding-bottom:5px;
            margin-right:30px;
            width:300px;
            border: none;
            outline: none;
            border-radius: 5px;
        }
         input:hover
        {
         box-shadow:0px 0px 20px  lightblue;
        }
        .btn-login
        {
            width:300px;
            background-color:black;
            color:white;
            border-radius: 5px;
            padding-top:5px;
            padding-bottom:5px;
        }
        .a-forget
        {
            text-decoration: none;
            color: black;
            margin-left:150px;
        }
        .icons
        {
           padding:10px 30px;
        }
        .icons:hover
        {
            background-color: white;
            color:tomato;
            border-radius:10px;
        }
        .icon
        {
            position:relative;
             left:40px;
        }
</style>
</head>
<body>
       <div class="box">
        <h2>Sign in with email</h2>
        <p>Can you select your And To Make Order it</p>
        <% String message=(String)request.getAttribute("loginfailed");
        if(message!=null){%>
        <%=message%>
        <%}%>
        <form action="signup" method="post">
        <i class="fa-solid fa-envelope icon"></i>
                <input type="email" name="email" placeholder="Email"><br>
        <i class="fa-solid fa-lock icon"></i>
                <input type="password" name="password" placeholder="Password"><br>
           
        <a href="#" class="a-forget">forget password?</a><br><br>
        <button type="submit" class="btn-login" name="login">LOGIN</button><br><br>
        </form>
        <h6>Or sign in with</h6>
        <i class="fa-brands fa-google icons"></i>
        <i class="fa-brands fa-facebook-f icons"></i>
        <i class="fa-brands fa-apple icons"></i>
    </div></body>
</html>