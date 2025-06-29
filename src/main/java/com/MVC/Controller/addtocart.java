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

@WebServlet("/addtocart")
public class addtocart extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  HttpSession session = req.getSession();
      Registration reg = new Registration(session);
      try {
    	  if(req.getParameter("addtocart") != null) 
    	  {
			String pname=req.getParameter("pname");
			String pimage=req.getParameter("pimage");
			String cost=req.getParameter("pcost");
			String qty=req.getParameter("quantity");
			String size=req.getParameter("size");
			String id=(String)session.getAttribute("id");
			String pdesc=req.getParameter("pdesc");
			String status=reg.addtocart(pname,pimage,cost,id,qty,size,pdesc);
			if(status.equals("success"))
			{
				RequestDispatcher rd=req.getRequestDispatcher("cart.jsp");
				rd.forward(req, resp);
			}
    	  }
    	  
    	  else if(req.getParameter("delete") != null)
    	  {
    		  int c_id = Integer.parseInt(req.getParameter("cid"));
              int status = reg.deletecart(c_id);
              if (status > 0) {
                  RequestDispatcher rd1 = req.getRequestDispatcher("cart.jsp");
                  rd1.forward(req, resp);
              }
    	  }
      }
      catch (Exception e) {
		// TODO: handle exception
	}
	
}
}
