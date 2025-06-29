package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class Admin 
{
	private Connection con;
	public Admin() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","tiger" );
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean insertProductMen(String pname,int pprice,int pstock,String pdesc,String pcategory,String pimage)
	{
		
		String query="insert into cloth values(0,?,?,?,?,?,?,?)";
		int i=0;
		try {
		   PreparedStatement  ps=con.prepareStatement(query);
			ps.setString(1,pname);
			ps.setString(2,pdesc);
			ps.setInt(3,pprice);
			ps.setString(4,pimage);
			ps.setInt(5,pstock);
			ps.setString(6,pcategory);
			ps.setString(7,"Men");
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	 public ArrayList<Order> getorderdata() {
	    	Statement st = null;
	    	ResultSet rs = null;
	        ArrayList<Order> al = new ArrayList<Order>();
	        try {
	            st = con.createStatement();
	            String qry = "select * from orders;";

	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Order p = new Order();
	                p.setOid(rs.getInt("order_id"));
	                p.setUname(rs.getString("uname"));
	                p.setCid(rs.getInt("cid"));
	                p.setCost(rs.getInt("cost"));
	                p.setQty(rs.getInt("qty"));
	                p.setOaddress(rs.getString("order_address"));
	                p.setOcity(rs.getString("order_city"));
	                p.setOstate(rs.getString("order_state"));
	                p.setStatus(rs.getString("status"));
	                al.add(p);

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
	 
	 public int acceptorder(int order_id) {
		    int status = 0;
		    String query = "UPDATE orders SET status = 'OrderConfirm' WHERE order_id = ?";
	 try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, order_id);  // Setting the order_id to the query
		        status = pst.executeUpdate();  // Executing the update
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return status;
		}
	 
	 public int cancelOrder(int order_id) {
		    int status = 0;
		    String query = "UPDATE orders SET status = 'Cancelled' WHERE order_id = ?";

		    try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, order_id);  // Set the order_id to the query parameter
		        status = pst.executeUpdate();  // Execute the update query
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return status;
		}

	 public int accept(int order_id) {
		    int status = 0;
		    String query = "UPDATE orders SET status = 'Shipped' WHERE order_id = ?";
	 try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, order_id);  // Setting the order_id to the query
		        status = pst.executeUpdate();  // Executing the update
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return status;
		}
	 
	 public int delivery(int order_id) {
		    int status = 0;
		    String query = "UPDATE orders SET status = 'Delivered' WHERE order_id = ?";
	 try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, order_id);  // Setting the order_id to the query
		        status = pst.executeUpdate();  // Executing the update
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return status;
		}
	 
	 

}
