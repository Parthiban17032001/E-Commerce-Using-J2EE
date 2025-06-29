package com.MVC.Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.MVC.Model.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name="Cloth",urlPatterns ={"/Cloth"})
@MultipartConfig
public class AdminController extends HttpServlet
{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	    HttpSession session = req.getSession();
	    Admin a=new Admin();
	   if(req.getParameter("Men")!=null)
	   {
		 Part file=req.getPart("image");
	 	 String imagefilename=file.getSubmittedFileName();
	 	 String uploadedpath="E:/eclipse-workspace/E-Commerce/src/main/webapp/Shirts"+imagefilename;
		 FileOutputStream fos=new FileOutputStream(uploadedpath);
	     InputStream is=file.getInputStream();
	    	
	    	byte[] data=new byte[is.available()];
	    	is.read(data);
	    	fos.write(data);
	    	fos.close();
	     String Pname=req.getParameter("Pname");
	     int Pprice=Integer.parseInt(req.getParameter("Pprice"));
	     int Pstock=Integer.parseInt(req.getParameter("Pstock"));
	     String Pdesc=req.getParameter("Pdescription");
	     String Pcategory=req.getParameter("Pcategory");
	    
	     boolean ad=a.insertProductMen(Pname, Pprice, Pstock,Pdesc,Pcategory,imagefilename);
	     
	     if(ad==true)
	     {
	    	 req.setAttribute("success","Successfully inserted Dishes");
	    	 RequestDispatcher rd=req.getRequestDispatcher("addMen.jsp");
	    	 rd.forward(req, resp);
	     }
	     else
	     {
	    	 req.setAttribute("failed","Failed store data");
	    	 RequestDispatcher rd=req.getRequestDispatcher("addMen.jsp");
	    	 rd.forward(req, resp);
	     }
	   }
   }
}
