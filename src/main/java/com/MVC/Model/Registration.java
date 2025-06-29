package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.MVC.Model.Order;
import com.mysql.cj.xdevapi.Result;

import jakarta.servlet.http.HttpSession;


public class Registration {
	private Connection con;
	HttpSession se;
	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","tiger");
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String Registration(String name,String phone,String email,String password) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM USER WHERE uphone='"+phone+"' or uemail='"+email+"'";
		try {
			Statement st= null;
			ResultSet rs = null;
			st=con.createStatement();
			rs=st.executeQuery(query);
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into user values(0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2,email);
				ps.setString(3,phone);
				ps.setString(4, password);
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	public String login(String email,String pass) {
		String status1="" ,id="";
		String uname="" ,emails="";
		String query="SELECT * FROM USER WHERE uemail='"+email +"'and upassword='"+pass+"';";

		try {
		Statement st=null;
		ResultSet rs=null;
		st=con.createStatement();
		rs=st.executeQuery(query);
		boolean b=rs.next();
		if(b==true) {
			id=rs.getString("uid");
			uname=rs.getString("uname");
			emails=rs.getString("uemail");
			se.setAttribute("uname", uname);
			se.setAttribute("email", emails);
			se.setAttribute("id", id);
			
			status1="success";
			
		}
		else {
			status1="failure";
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status1;
		
	}
	
	public ArrayList<Product> getdetails(String type)
	{
		String query="select * from cloth where ccategory=? ORDER BY RAND()";
		Product p=null;
		ArrayList<Product> li=new ArrayList<Product>();
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,type);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			p=new Product();
			p.setPid(rs.getInt("cid"));
			p.setPname(rs.getString("cname"));
			p.setPdesc(rs.getString("cdescription"));
			p.setPrice(rs.getInt("cprice"));
			p.setPimage(rs.getString("cimage"));
			p.setPstock(rs.getInt("cstock"));
			p.setPcategory(rs.getString("ccategory"));
			p.setGender(rs.getString("cgender"));
			li.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return li;
	}
	public ArrayList<Product> getdetails()
	{
		String query="select * from cloth ORDER BY RAND() LIMIT 12";
		Product p=null;
		ArrayList<Product> li=new ArrayList<Product>();
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			p=new Product();
			p.setPid(rs.getInt("cid"));
			p.setPname(rs.getString("cname"));
			p.setPdesc(rs.getString("cdescription"));
			p.setPrice(rs.getInt("cprice"));
			p.setPimage(rs.getString("cimage"));
			p.setPstock(rs.getInt("cstock"));
			p.setPcategory(rs.getString("ccategory"));
			p.setGender(rs.getString("cgender"));
			li.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return li;
	}
	
	public Product productdetails(int pid)
	{
		String query="select * from cloth where cid=?";
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, pid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			p=new Product();
			p.setPid(rs.getInt("cid"));
			p.setPname(rs.getString("cname"));
			p.setPdesc(rs.getString("cdescription"));
			p.setPrice(rs.getInt("cprice"));
			p.setPimage(rs.getString("cimage"));
			p.setPstock(rs.getInt("cstock"));
			p.setPcategory(rs.getString("ccategory"));
			p.setGender(rs.getString("cgender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
//	public User getInfo() {
//		Statement st = null;
//		ResultSet rs=null;
//		User s=null;
//		try {
//			
//			st=con.createStatement();
//			rs=st.executeQuery("SELECT * FROM USER WHERE id='"+se.getAttribute("id") + "';");
//			boolean b = rs.next();
//			if(b) {
//				s=new User();
//				s.setName(rs.getString("name"));
//				s.setPhone(rs.getString("phone"));
//				s.setEmail(rs.getString("email"));
//		
//				
//			}
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return s;
//		
//	}
//	
//	public String update(String name,String email,String phone) {
//		Statement st = null;
//		
//		String status2="";
//		
//		try {
//			st=con.createStatement();
//			st.executeUpdate("UPDATE USER SET NAME='"+name+"',EMAIL='"+email+"',PHONE='"+phone+"'WHERE id='"+se.getAttribute("id")+"';");
//			status2="success";
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			status2="failure";
//			e.printStackTrace();
//		}
//		return status2;
//	}
//	
//	public ArrayList<User> getUserinfo(String id){
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		ArrayList<User> al = new ArrayList<>();
//		try {
//		    String query = "select * from user where id=?";
//		    ps = con.prepareStatement(query);
//		    ps.setString(1, id);
//		    rs = ps.executeQuery();
//		    while (rs.next()) {
//		        User p = new User();
//		        p.setId(rs.getString("id"));
//		        p.setName(rs.getString("name"));
//		        p.setEmail(rs.getString("email"));
//		        p.setPhone(rs.getString("phone"));
//		        p.setDate(rs.getString("date"));
//		        al.add(p);
//		    }
//		} catch (SQLException e) {
//		    e.printStackTrace();
//		} finally {
//		    if (rs != null) {
//		        try {
//		            rs.close();
//		        } catch (SQLException e) {
//		            e.printStackTrace();
//		        }
//		    }
//		    if (ps != null) {
//		        try {
//		            ps.close();
//		        } catch (SQLException e) {
//		            e.printStackTrace();
//		        }
//		    }
//		}
//		return al;
//	}
//	
//		
//	
//
//	public ArrayList<User> getUserDetails() {
//	       Statement st;
//	       ResultSet rs;
//	       ArrayList<User> al = new ArrayList<User>();
//	       try {
//	           st = con.createStatement();
//	           String qry = "select *,"
//	                   + "date_format(date,'%b %d, %Y') as date1"
//	                   + " from user where id not in(1);";
//	           rs = st.executeQuery(qry);
//	           while (rs.next()) {
//	               User p = new User();
//	               p.setId(rs.getString("id"));
//	               p.setName(rs.getString("name"));
//	               p.setEmail(rs.getString("email"));
//	               p.setPhone(rs.getString("phone"));
//	               p.setDate(rs.getString("date1"));
//	               al.add(p);
//	           }
//	       } catch (Exception e) {
//	           e.printStackTrace();
//	       }
//	       return al;
//	   }
//
//
//	public String delete(int id) {
//	       int count = 0;
//	       Statement st = null;
//	       String status = "";
//	       try {
//	           st = con.createStatement();
//	           count = st.executeUpdate("delete from user where "
//	                   + "id='" + id + "'");
//	           if (count > 0) {
//	               status = "success";
//	           } else {
//	               status = "failure";
//	           }
//	       } catch (Exception e) {
//	           e.printStackTrace();
//	       }
//
//	       return status;
//	   }
//	public String forgot(String mail, String pw) {
//	       String status = "";
//	       try {
//	           Statement st = con.createStatement();
//
//	           int rspw = st.executeUpdate("update user  set password='" + pw + "' where email='" + mail + "';");
//	           if (rspw > 0) {
//	               status = "success";
//	           } else {
//	               status = "failure";
//	           }
//	       } catch (Exception e) {
//	           e.printStackTrace();
//	       }
//	       return status;
//	   }
//	public String getPassword(String email,String oldPass) {
//		String status="";
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String query="select * from user where email=? and password=?";
//		try {
//		ps=con.prepareStatement(query);
//		ps.setString(1, email);
//		ps.setString(2, oldPass);
//		rs=ps.executeQuery();
//		if(rs.next()) {
//			status="success";
//		}
//		else {
//			status="failed";
//		}
//	}
//	catch(Exception e){
//		e.printStackTrace();
//	}
//		return status;
//	}
//	public String resetPassword(String email,String pwd) {
//		String status="";
//		PreparedStatement ps = null;
//		boolean res;
//		try {
//			ps=con.prepareStatement("update user set password=? where email=?");
//			ps.setString(1, pwd);
//			ps.setString(2, email);
//			int rc=ps.executeUpdate();
//			if(rc>0) {
//				status="success";
//			}
//			else {
//				status="failure";
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return status;
//	}
//	 public ArrayList<Dproduct> get_productinfo(String animal) {
//		 Statement st = null;
//		 ResultSet rs = null;
//	        ArrayList<Dproduct> al = new ArrayList<Dproduct>();
//	        try {
//	            st = con.createStatement();
//	            String qry = "select * from products where p_category='" + animal + "';";
//	            rs = st.executeQuery(qry);
//	            while (rs.next()) {
//	                Dproduct p = new Dproduct();
//	                p.setp_id(rs.getString("p_id"));
//	                p.setp_image(rs.getString("p_image"));
//	                p.setp_name(rs.getString("p_name"));
//	                p.setP_cost(rs.getDouble("p_cost"));
//	                p.setp_details(rs.getString("p_details"));
//	                
//	                al.add(p);
//	            }
//	            
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return al;
//	    }
//
//
	 public ArrayList<Cart> getcartinfo() {
		 Statement st = null;
		 ResultSet rs = null;
	        ArrayList<Cart> al = new ArrayList<Cart>();
	        try {
	            st = con.createStatement();
	            String qry = ("select *  from cart where uid=" + se.getAttribute("id") + " and status='pending';");
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Cart p = new Cart();
	                p.setc_id(rs.getString("cid"));
	                p.setc_image(rs.getString("cimage"));
	                p.setc_name(rs.getString("cname"));
	                p.setc_cost(rs.getString("cost"));
	                p.setQuantity(rs.getString("quantity"));
	                p.setSize(rs.getString("size"));
	                p.setUid(rs.getString("uid"));
	                p.setCdesc(rs.getString("cdesc"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
//	 public Dproduct getProductById(String productId) {
//		 ArrayList<Dproduct> products = new ArrayList<Dproduct>();
//	        for (Dproduct product : products) {
//	            if (product.getp_id().equals(productId)) { 
//	                return product;
//	            }
//	        }
//	        return null;
//	    }
//	 
//	 public String addwishlist(String p_id) {
//	        String status = "";
//	        try {
//	            Statement st = null;
//	            st = (Statement) con.createStatement();
//	            String qry = "insert into wishlist select 0,p_name,p_image,p_cost,'" + se.getAttribute("name") + "'," + se.getAttribute("id") + ",0,'pending' from products where p_id=" + p_id + ";";
//	            int a = st.executeUpdate(qry);
//	            status = "success";
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return status;
//	    }
//	 
//	 public ArrayList<Wishlist> getwishlistinfo() {
//		 Statement st = null;
//		 ResultSet rs = null;
//	        ArrayList<Wishlist> al = new ArrayList<Wishlist>();
//	        try {
//	            st = con.createStatement();
//	            String qry = ("select *  from wishlist where uid=" + se.getAttribute("id") + " and status='pending';");
//	            rs = st.executeQuery(qry);
//	            while (rs.next()) {
//	               Wishlist w = new Wishlist();
//	               w.setW_id(rs.getString("w_id"));
//	               w.setW_image(rs.getString("w_image"));
//	               w.setW_name(rs.getString("w_name"));
//	              al.add(w);
//	                
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return al;
//	    }
	  public String addtocart(String pname,String pimage,String cost,String id,String qty,String size, String pdesc) {
	        String status = "";
	        try {
	        	String qry = "insert into cart values(0,?,?,?,?,?,?,?,?,?,?)" ;
	            PreparedStatement ps= null;
	            ps =con.prepareStatement(qry);
	            ps.setString(1,pname);
	            ps.setString(2,pimage);
	            ps.setInt(3,Integer.parseInt(cost));
	            ps.setString(4,null);
	            ps.setInt(5,Integer.parseInt(id));
	            ps.setString(6,null);
	            ps.setString(7,"pending");
	            ps.setString(8,qty);
	            ps.setString(9,size);
	            ps.setString(10,pdesc);
	            int a= ps.executeUpdate();
	            status = "success";
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
//	  public String addtocart1(String p_id) {
//	        String status = "";
//	        try {
//	            Statement st = null;
//	            st = (Statement) con.createStatement();
//	            String qry = "insert into cart select 0,p_name,p_image,p_cost,'" + se.getAttribute("name") + "'," + se.getAttribute("id") + ",0,'pending' from products where p_id=" + p_id + ";";
//	            int a = st.executeUpdate(qry);
//	            status = "success";
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return status;
//	    }
//	 
//	 
//	
//	 public int deleteproduct(int c_id) {
//	        int status = 0;
//	        try {
//	            Statement st = null;
//	            st = (Statement) con.createStatement();
//	            String qry ="delete from products where p_id='" + c_id + "'";
//	            status = st.executeUpdate(qry);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return status;
//	    }
//	 
//	 //Wishlist
//
//	
//	 
	 public int deletecart(int c_id) {
	        int status = 0;
	        try {
	            Statement st = null;
	            st = (Statement) con.createStatement();
	            String qry = "update cart set status='deleted' where cid='" + c_id + "'";
	            status = st.executeUpdate(qry);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
//	 
//	 
//	 public int deletewishlist(int w_id) {
//	        int status = 0;
//	        try {
//	            Statement st = null;
//	            st = (Statement) con.createStatement();
//	            String qry = "update wishlist set status='deleted' where w_id='" + w_id + "'";
//	            status = st.executeUpdate(qry);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return status;
//	    }
//	 
//	 
	 public String orderdetails(String order_address, String order_city, String order_state,String pid,String pname,String pimage,String cost,String qty, String uid, String uname, String payment,String size) {
		 Statement st = null;
		 ResultSet rs = null;
		 PreparedStatement ps=null;
	        String status = "";
	        int c_id =0;
	        int order_id = 0;
	        try {
	           String qry2="insert into orders values(0,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
	            ps =con.prepareStatement(qry2);
	            ps.setString(1,order_address);
	            ps.setString(2,order_city);
	            ps.setString(3,order_state);
	            ps.setInt(4,Integer.parseInt(pid));
	            ps.setString(5,pname);
	            ps.setString(6,pimage);
	            ps.setInt(7,Integer.parseInt(qty));
	            ps.setInt(8,Integer.parseInt(cost));
	            ps.setInt(9,Integer.parseInt(uid));
	            ps.setString(10,uname);
	            ps.setString(11,"ordered");
	            ps.setString(12,payment);
	            ps.setString(13,size);
	            int a = ps.executeUpdate();
	            
	            st = (Statement) con.createStatement();
	            if (a > 0) {
	                status = "success";
	            } else {
	                status = "failure";
	            }                                                                                          //last order of my id with status=ordered,
	            String qry1 = "select order_id,cid from orders where uid=" + se.getAttribute("id") + " and status='ordered' order by order_id desc limit 1;";
	            rs = st.executeQuery(qry1);
	            while (rs.next()) {
	                order_id = rs.getInt("order_id");
	                c_id = rs.getInt("cid");
	            }
	            String qry = "update cart set status='ordered',order_id='" + order_id + "' where cid in (" + c_id + ") and uid=" + se.getAttribute("id") + " and status='pending';";
	            int b = st.executeUpdate(qry);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	   }
	 
 
	   public int deleteorder(int oid) {
	        int status = 0;
	        try {
	            Statement st = null;
	            st = (Statement) con.createStatement();
	            String qry = "update orders set status='Canceled' where order_id='" + oid + "'";
	            status = st.executeUpdate(qry);
	            String qry1 = "update cart set status='Canceled' where order_id='" + oid + "'";
	            status = st.executeUpdate(qry1);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	   
	   public int delete(int oid) {
	        int status = 0;
	        try {
	            Statement st = null;
	            st = (Statement) con.createStatement();
	            String qry = "update orders set status='Deleted' where order_id='" + oid + "'";
	            status = st.executeUpdate(qry);
	            String qry1 = "update cart set status='Deleted' where order_id='" + oid + "'";
	            status = st.executeUpdate(qry1);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	   
	   
	   public ArrayList<Order> getorderinfo() {
		   Statement st = null;
		   ResultSet rs = null;
	        ArrayList<Order> al = new ArrayList<Order>();
	        try {
	            st = con.createStatement();
	            String qry = "select *  from orders where uid='" + se.getAttribute("id") + "';";
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	                Order p = new Order();
	                p.setOid(rs.getInt("order_id"));
	                p.setOaddress(rs.getString("order_address"));
	                p.setOcity(rs.getString("order_city"));
	                p.setCid(rs.getInt("cid"));
	                p.setCname(rs.getString("cname"));
	                p.setCimage(rs.getString("cimage"));
	                p.setCost(rs.getInt("cost"));
	                p.setQty(rs.getInt("qty"));
	                p.setUid(rs.getInt("uid"));
	                p.setUname(rs.getString("uname"));
	                p.setStatus(rs.getString("status"));
	                p.setSize(rs.getString("size"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
//
//	    public ArrayList<Order> getorderinfocart(int oid) {
//	    	Statement st = null;
//			   ResultSet rs = null;
//	        ArrayList<Order> al = new ArrayList<Order>();
//	        try {
//	            st = con.createStatement();
//	            String qry = ("select *  from cart where uid='" + se.getAttribute("id") + "' and order_id = '" + oid + "';");
//	            rs = st.executeQuery(qry);
//	            while (rs.next()) {
//	                Order p = new Order();
//	                p.setoid(rs.getInt("order_id"));
//	                p.setc_cost(rs.getString("c_cost"));
//	                p.setp_image(rs.getString("c_image"));
//	                p.setc_name(rs.getString("c_name"));
//	                p.setQuantity(rs.getString("quantity"));
//	                al.add(p);
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return al;
//	    }
//	    
//	
//	    
//	    public ArrayList<Product> getproductdetails(int pid){
//	    	Statement st = null;
//	    	ResultSet rs = null;
//	    	ArrayList<Product> al = new ArrayList<Product>();
//	    	try {
//	    		st=con.createStatement();
//	    		String query=("SELECT * FROM PRODUCTDETAILS WHERE p_id="+pid+";");
//	    		rs=st.executeQuery(query);
//	    		while(rs.next()) {
//	    			Product p = new Product();
//	    			p.setP_id(rs.getString("p_id"));
//	    			p.setP_name(rs.getString("p_name"));
//	    			p.setP_image(rs.getString("p_image"));
//	    			p.setP_image1(rs.getString("p_image1"));
//	    			p.setP_image2(rs.getString("p_image2"));
//	    			p.setP_cost(rs.getString("p_cost"));
//	    			p.setP_details(rs.getString("p_details"));
//	    	
//	    			p.setP_info(rs.getString("p_info"));
//	    			al.add(p);
//	    		}
//	    	}catch(Exception e) {
//	    		e.printStackTrace();
//	    	}
//	    	return al;
//	    }
//	    
//	    
//
//	    public String contactInfo(String name, String email, String subject, String message,String phone) {
//	        String status = "";
//	        String query = "SELECT * FROM contact WHERE Name = ? OR Email = ?";
//	        try (PreparedStatement ps = con.prepareStatement(query)) {
//	            ps.setString(1, name);
//	            ps.setString(2, email);
//	            ResultSet rs = ps.executeQuery();
//	            if (rs.next()) {
//	                status = "existed";
//	            } else {
//	                query = "INSERT INTO contact (name, email, subject, message,phone) VALUES (?, ?, ?, ?)";
//	                try (PreparedStatement insertPs = con.prepareStatement(query)) {
//	                    insertPs.setString(1, name);
//	                    insertPs.setString(2, email);
//	                    insertPs.setString(3, subject);
//	                    insertPs.setString(4, message);
//	                    insertPs.setString(5, phone);
//	                    int rowsAffected = insertPs.executeUpdate();
//	                    status = (rowsAffected > 0) ? "success" : "failure";
//	                }
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            //status = "error";
//	        }
//	        return status;
//	    }
////	    public ArrayList<Animal> getAnimalinfo(int aid){
////	    	Statement st = null;
////	    	ResultSet rs = null;
////	    	ArrayList<Animal> al = new ArrayList<Animal>();
////	    	try {
////	    		st=con.createStatement();
////	    		String query=("SELECT * FROM ANIMAL WHERE a_id="+aid+";");
////	    		rs=st.executeQuery(query);
////	    		while(rs.next()) {
////	    			Animal a = new Animal();
////	    			a.setA_id(rs.getInt("a_id"));
////	    			a.setA_name(rs.getString("a_name"));
////	    			a.setA_age(rs.getInt("a_age"));
////	    			a.setA_gender(rs.getString("a_gender"));
////	    			a.setA_cost(rs.getDouble("a_cost"));
////	    			a.setA_lifespan(rs.getString("a_lifespan"));
////	    			a.setA_image(rs.getString("a_image"));
////	    			
////	    			al.add(a);
////	    		}
////	    	}catch(Exception e) {
////	    		e.printStackTrace();
////	    	}
////	    	return al;
////	    }
//	    public  boolean updateCartQuantity(String cid, String userId, int quantity) {
//	        String sql = "UPDATE cart SET quantity = ? WHERE c_id = ? AND uid = ? AND status = 'pending'";
//	        
//	        try (PreparedStatement ps = con.prepareStatement(sql)) {
//	            ps.setInt(1, quantity);
//	            ps.setString(2, cid);
//	            ps.setString(3, userId);
//	            int rowsUpdated = ps.executeUpdate();
//	            return rowsUpdated > 0;
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return false;
//	        }
//	    }
//
//	    public String getReview(String pid, String uname, String review, int rating) {
//	        String status = "";
//	        String query = "INSERT INTO REVIEW (p_id, uname, review, rating) VALUES (?, ?, ?, ?)"; // Include rating
//
//	        try (PreparedStatement ps = con.prepareStatement(query)) {
//	            ps.setString(1, pid);
//	            ps.setString(2, uname);
//	            ps.setString(3, review);
//	            ps.setInt(4, rating); // Set the rating
//
//	            int rowsAffected = ps.executeUpdate();
//	            if (rowsAffected > 0) {
//	                status = "success";
//	            } else {
//	                status = "failure";
//	            }
//
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            status = "error"; 
//	        }
//
//	        return status;
//	    }
//
//
//	   public ArrayList<Reviews> getreviewinfo(){
//		   Statement st = null;
//		   ResultSet rs = null;
//		   ArrayList<Reviews> al = new ArrayList<Reviews>();
//		   try {
//			st=con.createStatement();
//			String query="SELECT * FROM REVIEW ;";
//			rs=st.executeQuery(query);
//			while(rs.next()) {
//				Reviews re=new Reviews();
//				re.setPid(rs.getString("p_id"));
//				re.setUname(rs.getString("uname"));
//				re.setReview(rs.getString("review"));
//				re.setRating(rs.getString("rating"));
//				al.add(re);
//			}
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return al;
//		   
//	   }
//	   public ArrayList<Dproduct> get_all_productinfo() {
//	        ArrayList<Dproduct> productList = new ArrayList<>();
//	        String query = "SELECT * FROM products"; // Assuming your table name is 'products'
//
//	        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
//	            while (rs.next()) {
//	                Dproduct product = new Dproduct();
//	              product.setp_id(rs.getString("p_id"));
//	              product.setp_name(rs.getString("p_name"));
//	              product.setp_image(rs.getString("p_image"));
//	              product.setP_cost(rs.getDouble("p_cost"));
//	            
//	              product.setp_details(rs.getString("p_details"));
//	              
//	              
//	                productList.add(product);
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        }
//
//	        return productList;
//	    }
//
//	    public boolean addProduct(Dproduct product) {
//	        String query = "INSERT INTO products (p_name, p_image, p_cost, p_details,p_category) VALUES (?, ?, ?, ?,?)";
//	        try (PreparedStatement pstmt = con.prepareStatement(query)) {
//	            pstmt.setString(1, product.getp_name());
//	            pstmt.setString(2, product.getp_image());
//	            pstmt.setDouble(3, product.getP_cost());
//	            pstmt.setString(4, product.getp_details());
//	            pstmt.setString(5, product.getP_category());
//
//	            int rowsAffected = pstmt.executeUpdate();
//	            return rowsAffected > 0;
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return false;
//	        }
//	    }
//	    public boolean updateProduct(Dproduct product) {
//	        String query = "UPDATE products SET p_name = ?, p_image = ?, p_cost = ?, p_details = ? WHERE p_id = ?";
//	        try (PreparedStatement pstmt = con.prepareStatement(query)) {
//	            pstmt.setString(1, product.getp_name());
//	            pstmt.setString(2, product.getp_image());
//	            pstmt.setDouble(3, product.getP_cost());
//	            pstmt.setString(4, product.getp_details());
//	            pstmt.setString(5, product.getp_id());
//
//	            int rowsAffected = pstmt.executeUpdate();
//	            return rowsAffected > 0;
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return false;
//	        }
//	    }
//	    public boolean updateProductCost(int productId, double newCost) {
//	        
//	        PreparedStatement preparedStatement = null;
//	        try {
//	           
//	            String sql = "UPDATE products SET p_cost = ? WHERE p_id = ?";
//	            preparedStatement = con.prepareStatement(sql);
//	            preparedStatement.setDouble(1, newCost);
//	            preparedStatement.setInt(2, productId);
//	            int rowsUpdated = preparedStatement.executeUpdate();
//	            return rowsUpdated > 0;
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return false;
//	        } finally {
//	            try {
//	                if (preparedStatement != null) preparedStatement.close();
//	                if (con != null) con.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	    }
//	    public boolean deleteProduct(int productId) {
//	        String query = "DELETE FROM products WHERE p_id = ?";
//	        try (PreparedStatement stmt = con.prepareStatement(query)) {
//	            stmt.setInt(1, productId);
//	            int rowsAffected = stmt.executeUpdate();
//	            return rowsAffected > 0;
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            return false;
//	        }
//	    }
//


	}
	    
	   


