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

@WebServlet("/order")
public class Order extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  HttpSession se1 = req.getSession();
      Registration reg = new Registration(se1);
      try {
          if (req.getParameter("submit") != null) {
              String order_address = req.getParameter("address");
              String order_city = req.getParameter("city");
              String order_state = req.getParameter("state");
              String pid=req.getParameter("pid");
              String pname = req.getParameter("pdesc");
              String pimage =req.getParameter("pimage");
              String tcost = req.getParameter("tcost");
              String qty = req.getParameter("qty");
              String uid =req.getParameter("uid");
              String uname=req.getParameter("uname");
              String payment=req.getParameter("payment_method");
              String size=req.getParameter("size");              
              System.out.println(order_address+" "+order_city+" "+order_state+" "+tcost+" "+pid+" "+pname+" "+pimage+" "+qty+" "+uid+" "+uname);
          
              String status = reg.orderdetails(order_address, order_city, order_state,pid,pname,pimage,tcost,qty,uid,uname,payment,size);
              if (status.equals("success")) {
                  RequestDispatcher rd1 = req.getRequestDispatcher("order.jsp");
                  rd1.forward(req, resp);
              }
          } 
          else if (req.getParameter("deleteorder") != null) {
              int oid = Integer.parseInt(req.getParameter("orderid"));
              int status = reg.deleteorder(oid);
              if (status > 0) {
                  RequestDispatcher rd1 = req.getRequestDispatcher("order.jsp");
                  rd1.forward(req, resp);
              }
          }
          else if (req.getParameter("delete") != null) {
              int oid = Integer.parseInt(req.getParameter("orderid"));
              int status = reg.delete(oid);
              if (status > 0) {
                  RequestDispatcher rd1 = req.getRequestDispatcher("order.jsp");
                  rd1.forward(req, resp);
              }
          }
      } catch (Exception e) {
          e.printStackTrace();
      }
  }
}
