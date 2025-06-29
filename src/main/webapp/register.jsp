<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"></script>
<style>
   body 
    {
        font-family: 'Arial', sans-serif;
        margin: 0px;
        padding: 0px;
        background-image: url(Images/ecommerce.jpg);
	    background-repeat:no-repeat;
	    backdrop-filter: blur(3px);
	    background-size:cover;
    }

    .container 
    {
        width:300px;
        text-align: center;
        margin-top:10%;
        margin-left:12%;
    }
    #msg {
        padding: 12px;
        background-color: black;
        color: black;
        border: 1px solid #ffeb3b;
        border-radius: 5px;
        margin-bottom: 15px;
        font-size: 16px;
        font-family: 'Comic Sans MS', cursive, sans-serif;
        text-align: center;
    }

    table 
    {
        width: 100%;
    }

    td 
    {
        text-align: left;
        font-size: 16px;
        color: #f57c00;
    }

    input[type="text"],
    input[type="tel"],
    input[type="email"],
    input[type="password"] {
       width:100%;
       padding-left:40px;
       padding-top:5px;
       padding-bottom:5px;
       border-radius: 10px;
       border: none;
       font-size: 16px;
       box-sizing: border-box;
       transition: all 0.3s ease;
    }
     .icon
        {
            color:black;
            position:relative;
             left:15px;
             top:30px;	
        }
    input[type="text"]:focus,
    input[type="tel"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: lightGrey;
        box-shadow:0px 0px 20px  lightblue;
    }

    input[type="submit"] {
        width: 100%;
        padding: 14px;
        background-color: #ffeb3b;
        color: #fff;
        border: none;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover
     {
        background-color: #f57c00;
    }
     .btn-login
        {
            width:300px;
            background-color:black;
            color:white;
            border-radius: 5px;
            padding-top:5px;
            padding-bottom:5px;
            margin-top:15px;
        }
        
    .login {
        margin-top: 15px;
    }

    .login a {
        color: #f57c00;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
    }

    .login a:hover {
        text-decoration: underline;
    }

    @media (max-width: 480px) {
        .container {
            width: 90%;
            padding: 25px;
        }

        h2 {
            font-size: 24px;
        }

        input[type="submit"] {
            font-size: 16px;
        }
    }
  
</style>
</head>
<body>
<script>
    jQuery.validator.addMethod("checkemail", function(value, element) {
        return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value); 
    });
   
    $(document).ready(function () {
    	$(".container").hide();
    	$(".container").slideDown(1000);
        $("#signup").validate({
            rules: {
                username: {
                    required: true
                },
                phone: {
                    required: true,
                    minlength: 10,
                    maxlength: 10,
                    digits: true
                },
                email: {
                    required: true,
                    checkemail: true
                },
                password: {
                    required: true,
                    minlength: 4
                },
                Cpassword: {
                    required: true,
                    minlength: 4,
                    equalTo: "#password"
                }
            },
            messages: {
                username: {
                    required: "*Please enter your name"
                },
                phone: {
                    required: "*Please enter your phone number",
                    minlength: "*Your phone number must be exactly 10 digits",
                    maxlength: "*Your phone number must be exactly 10 digits",
                    digits: "*Please enter a valid phone number"
                },
                email: {
                    required: "*Please enter your email"
                },
                password: {
                    required: "*Please enter your password",
                    minlength: "*Your password must be at least 4 characters long"
                },
                Cpassword: {
                    required: "*Please confirm your password",
                    minlength: "*Your password must be at least 4 characters long",
                    equalTo: "*Passwords do not match"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
<div class="container" id="container">
    <h2>Getting Started</h2>
    <p>Create an account to continue then to Purchase Products and More</p>

    <% if(request.getAttribute("status") != null) { %>
        <div id="msg"><%= request.getAttribute("status") %></div>
    <% } %>

    <form  action="signup" method="post" id="signup">
        <table>
            <tr>
                
                <td><i class="fa-solid fa-user icon"></i><input type="text" id="username" name="username" placeholder="Username"></td>
            </tr>
            <tr>
                
                <td><i class="fa-solid fa-phone icon"></i><input type="tel" name="phone" placeholder="Phone"></td>
            </tr>
            <tr>
                
                <td><i class="fa-solid fa-envelope icon"></i><input type="email" name="email" placeholder="Email"></td>
            </tr>
            <tr>
                
                <td><i class="fa-solid fa-lock icon"></i><input type="password" name="password" id="password" placeholder="Password"></td>
            </tr>
            <tr>
                
                <td><i class="fa-solid fa-lock icon"></i><input type="password" name="confirm" placeholder="Confirm Password"></td>
            </tr>
	        <tr>
	        <td><button type="submit" class="btn-login" name="register">SIGNUP</button></td>
	        </tr>
	        <!--<tr>
	        <td><input type="submit" class="btn-login" name="register" value="SIGNUP"></td>
	        </tr>-->
        </table>
    </form>
</div>
</body>
</html>