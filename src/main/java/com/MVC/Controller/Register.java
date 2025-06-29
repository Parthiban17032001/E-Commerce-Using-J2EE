package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class Register extends HttpServlet
{
   
protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	   HttpSession session = req.getSession();
		Registration reg = new Registration(session);
		try {
			if(req.getParameter("register")!=null) {
				String name=req.getParameter("username");
				String phone=req.getParameter("phone");
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				String confirm=req.getParameter("confirm");
				
				System.out.println(name+" "+phone+" "+email+" "+password);
				
				if(password.equals(confirm)) {
					String status = reg.Registration(name,phone,email,password);
					if(status.equals("existed")) {
						req.setAttribute("status", "Existed Record");
						RequestDispatcher rd1=req.getRequestDispatcher("register.jsp");
						rd1.forward(req, resp);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
						rd.forward(req, resp);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Registration Failed");
						RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
						rd.forward(req, resp);
					}
				}
				
				
			}
			else if(req.getParameter("login")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status =reg.login(email, password);
				if(status.equals("success")) {
					req.setAttribute("status", "Login Successfull");
					if(session.getAttribute("uname")!=null && session.getAttribute("id").equals("1")) {
					RequestDispatcher rd =req.getRequestDispatcher("Admin.jsp");
					rd.forward(req, resp);
					}else {
						RequestDispatcher rd =req.getRequestDispatcher("home.jsp");
						rd.forward(req, resp);
					}
					
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				
		
			}
			else if(req.getParameter("logout")!=null) {
				session.invalidate();
				resp.sendRedirect("home.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			}
}
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {
       processRequest(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {
       processRequest(req, resp);
   }

}
