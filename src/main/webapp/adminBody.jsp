<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .admin_img
        {
          background-repeat: none;
          background-origin: border-box;
          height:609px;
          border-radius: 10px;
        }
        .text_animation
        {
          position:absolute;
          bottom:150px;
          left:600px;
        }
        .text_animation h1
        {
           font-style:italic;
           font-weight:900;
           background: linear-gradient(140deg,rgba(53,219,164,1) 9%,rgba(0,212,255,1) 80%);
           color:transparent;
           -webkit-background-clip:text;
           text-align: center;
        }
        .text_animation h4
        {
          color:white;
        }
        .text_animation h4
        {
          font-weight:500;
          width: 0ch;
          white-space:nowrap;
          overflow:hidden;
          border-right:1px solid white;
          animation:typing 10s infinite;
        }
        @keyframes typing{
	        0%
	        {
	          width:0ch;
	        }
	        50%
	        {
	          width:65ch;
	        }
         }
</style>
</head>
<body>
 <div class="container-fluid">
        <div class="row ">
            <div class="col">
            <img alt="" src="Images/Admin-Home.jpg" width="100%" class="admin_img">
            </div>
         </div>
   </div>               
   
  
            <div class="text_animation">
			     <h1>Welcome Admin</h1><br>
			     <h4>You can do Add Dishes,Menus and also to edit the dishe&Menu and Delete</h4>
            </div>     
</body>
</html>