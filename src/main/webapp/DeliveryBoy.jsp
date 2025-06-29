<%@page import="com.MVC.Model.Order"%>
<%@page import="com.MVC.Model.Admin"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Managemant</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-i1b/nzkVo97VN5WbEtaPebBG8REvjWeqNclJ6AItj7msdVcaveKrlIIByDpvjk5nwHjXkIqGZscVxOrTb9tsMA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: 'Arial', sans-serif;
           
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 40px;
            font-size: 36px;
            color: #2c3e50;
            font-weight: 600;
        }

        .table-container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 14px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        table th {
            background-color: #f1c40f;
            color: #fff;
            font-size:1.2rem;
            font-weight: bold;
        }

        table td {
            background-color: #fff;
            font-size:1rem;
            font-weight:bold;
        }

        table td img {
            max-width: 80px;
            max-height: 80px;
            object-fit: cover;
        }

        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }

        .status-booked {
            color: #2ecc71;
            font-weight: bold;
        }

        .status-cancelled {
            color: #e74c3c;
            font-weight: bold;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn {
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
.btn-success {
    background-color: #28a745;
    color: white;
    border: 2px solid #28a745;
    border-radius: 5px;
     height:50px;
            width:80px;
}

.btn-danger {
    background-color: #dc3545;
    color: white;
    border: 2px solid #dc3545;
    border-radius: 5px;
     height:50px;
            width:80px;
}

.btn-warning {
    background-color: #f1c40f;
    color: white;
    border: 2px solid #f1c40f;
    border-radius: 5px;
     height:50px;
            width:80px;
}

.btn:hover {
    opacity: 0.8;
    transform: translateY(-2px);
    border: 2px solid #333;
}


        
        .btn-closed {
            background-color: #bdc3c7; 
            color: white;
            border: none;
            height:50px;
            width:80px;
        }

        .btn:hover {
            opacity: 0.8;
            transform: translateY(-2px);
        }

        .icon {
            font-size: 20px;
        }

        .no-orders {
            font-size: 18px;
            color: #888;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            table th, table td {
                font-size: 12px;
                padding: 10px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 5px;
            }

            .btn {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
    </style>
</head>
<body>
    <h1>Order Management</h1>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Order Id</th>
                    <th>Order Address</th>
                    <th>Order City</th>
                    <th>Order State</th>
                    <th>Username</th>
                    <th>Quantity</th>
                     <th>Cost</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Admin admin = new Admin();
                    ArrayList<Order> orders = admin.getorderdata();  

                    if (orders.isEmpty()) {
                %>
                    <tr><td colspan="8" class="no-orders">No orders found</td></tr>
                <%
                    } else {
                        Iterator<Order> itr = orders.iterator();
                        while (itr.hasNext()) {
                            Order order = itr.next();
                        if(order.getStatus().equals("OrderConfirm") || order.getStatus().equals("Shipped")){    
                %>
                    <tr>
                        <td><%=order.getCid()%></td>
                        <td><%=order.getOid()%></td>
                        <td><%= order.getOaddress()%></td>
                        <td><%= order.getOcity()%></td>
                        <td><%= order.getOstate()%></td>
                        <td><%=order.getUname()%></td>
                        <td><%=order.getCost()%></td>
                         <td>&#8377; <%= order.getQty()%></td>
             
                       <td class="action-buttons">
                            <% if ("OrderConfirm".equals(order.getStatus())) { %>
                                <form action="delivery" method="post" style="display: flex; gap: 10px;">
                                    <input type="hidden" name="order_id" value="<%= order.getOid()%>"/>
                                    <button type="submit" class="btn-success" name="acceptorder">Accept</button>
                                </form>
                            <% } else if("Shipped".equals(order.getStatus())) { %>
                                 <form action="delivery" method="post" style="display: flex; gap: 10px;">
                                    <input type="hidden" name="order_id" value="<%= order.getOid()%>"/>
                                    <button type="submit" class="btn-success" name="delivery">Deliver</button>
                                </form>
                            <% } else if("Delivered".equals(order.getStatus())){%>
                             <h5>Delivered</h5>
                             <%}%>
                        </td>
                    </tr>
                <% }
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>