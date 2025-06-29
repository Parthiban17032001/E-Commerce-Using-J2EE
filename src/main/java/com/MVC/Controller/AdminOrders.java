package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminorders")
public class AdminOrders extends HttpServlet
{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   Admin admin = new Admin();
	   if (req.getParameter("acceptevent") != null) {
		    int order_id = Integer.parseInt(req.getParameter("order_id"));
		    int status = admin.acceptorder(order_id);  
		    if (status > 0) {
		        RequestDispatcher rd = req.getRequestDispatcher("BookedProducts.jsp");
		        rd.forward(req, resp);
		    }
		}
	 else if ( req.getParameter("cancel") != null) {
		    int order_id = Integer.parseInt(req.getParameter("order_id"));
		    int status = admin.cancelOrder(order_id);
		    if (status > 0) {
		        RequestDispatcher rd = req.getRequestDispatcher("BookedProducts.jsp");
		        rd.forward(req, resp);
		    }
		}
	 

}
}
