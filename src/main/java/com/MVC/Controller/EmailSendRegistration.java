package com.MVC.Controller;

import java.util.Properties;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.*;

public class EmailSendRegistration 
{
   public static void sendMail(String recepient)
   {
	   System.out.println("Preparing to send mail....");
	   Properties properties=System.getProperties();
	   properties.put("mail.smtp.auth","false");
	   properties.put("mail.smtp.host","127.0.0.1");
	   properties.put("mail.smtp.port","25");
	   properties.put("mai.debug","true");
	   
	   //sender user name(email) and password
	   
	   String username="parthibansathya798@gmail.com";
	   String password="Parthiban1731@";
	   
	   try {
	   //create session object and pass the credentials
	   Session session=Session.getInstance(properties);
	   
	   //create Message Object receiving from
	   Message message=prepareMessage(session,username,recepient);
		Transport.send(message);
		System.out.println("Email sent successfully....");
	   } catch (Exception e) 
	   {
		e.printStackTrace();
	   }
   }

     private static Message prepareMessage(Session session, String username, String recepient) {
	 MimeMessage message=new MimeMessage(session);
	 try 
	 {
        message.setFrom(new InternetAddress(username));
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
	    message.setSubject("[Registration Conformation]");
	    message.setText("Hello Sir! Your successfully created Your acount on Shoppingspot thaks once again");
	 } 
	 catch (Exception e) {
		e.printStackTrace();	
	 }
	 return message;
	}
}
