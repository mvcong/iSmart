package tools;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	 public static boolean sendMail(String to, String subject, String text) {
	        Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.debug", "true");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
	        Session session = Session.getInstance(props,
	                new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("mai.cong365@gmail.com", "anhcong96ns");
	            }
	        });
	        try {
	            Message message = new MimeMessage(session);
	            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
	            message.setFrom(new InternetAddress("mai.cong365@gmail.com"));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	            message.setSubject(subject);
	            message.setText(text);
	            Transport.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return false;
	        }
	        return true;
	    }
	    
	    public static void main(String[] args) {
	        System.out.println(sendMail("cong.mai365@gmail.com", "Admin GYM XXX", "Hello, Cong"));
	    }

}
