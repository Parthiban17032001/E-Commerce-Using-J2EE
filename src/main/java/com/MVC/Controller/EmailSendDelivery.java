package com.MVC.Controller;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class EmailSendDelivery 
{
	    public static void main(String[] args) throws Exception
	    {
	    	// change below lines accordingly
	        String to = "msparthiban51@gmail.com"; 
	        String from = "akash@gmail.com"; 
	        String host = "localhost"; // or IP address

	        // Get the session object
	        // Get system properties
	        Properties properties = System.getProperties(); 

	        // Setup mail server
	        properties.setProperty("mail.smtp.host", host); 

	        // Get the default Session object
	        Session session = Session.getDefaultInstance(properties); 

	        // compose the message  
	        try {
	        	// javax.mail.internet.MimeMessage class 
	            // is mostly used for abstraction.
	            MimeMessage message = new MimeMessage(session); 

	            // header field of the header.
	            message.setFrom(new InternetAddress(from)); 
	            message.addRecipient(Message.RecipientType.TO, 
	                                new InternetAddress(to));
	            message.setSubject("Delevery Status");
	            message.setText("Thak your for shopping on ShoppingSpot.Your Product Deliveried successfully.");

	            // Send message
	            Transport.send(message);
	            System.out.println("Yo it has been sent..");

			} 
	        catch (Exception e)
	        {
				e.printStackTrace();
			}

	    }
}