package mail;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class Gmail
{
	
	
	
 public static void gmailtest(String email, String authno) 
 
 {
	// session.setAttribute
	// DB ����
	 
	 
  Properties p = new Properties();
  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google����@gmail.com���� ����
  p.put("mail.smtp.host", "smtp.gmail.com");
  p.put("mail.smtp.port", "465");
  p.put("mail.smtp.starttls.enable","true");
  p.put( "mail.smtp.auth", "true");
  p.put("mail.smtp.debug", "true");
  p.put("mail.smtp.socketFactory.port", "465"); 
  p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
  p.put("mail.smtp.socketFactory.fallback", "false");
  //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
  try {
   Authenticator auth = new SMTPAuthenticator();
   Session session = Session.getInstance(p, auth);
   session.setDebug(true); // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
   //session = Session.getDefaultInstance(p);
   MimeMessage msg = new MimeMessage(session);

   System.out.println("�޼��� ���� ����");

   String message = "Akinator ȸ�� ������ ���� ���� �����Դϴ�. \n �Ʒ� ������ȣ�� �Է��� �ּ���.. \n"
			+authno;
		   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
   msg.setSubject("Akinator ȸ�� ������ ���� ���� �����Դϴ�.");
   Address fromAddr = new InternetAddress("eunjung11525@gmail.com"); // ������ ����� �����ּ�
   msg.setFrom(fromAddr);
   Address toAddr = new InternetAddress(email);  // �޴� ����� �����ּ�
   msg.addRecipient(Message.RecipientType.TO, toAddr); 
   msg.setContent(message, "text/plain;charset=KSC5601");
   System.out.println("Message: " + msg.getContent());
   Transport.send(msg);
   System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����");
  }
  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
   System.out.println("I am here??? ");
   mex.printStackTrace(); 
  } 
 }
 
 //�̸��Ͽ�
public static void gmailPassword(String email, String pass) 
 
 {
	// session.setAttribute
	// DB ����
	 
	 
  Properties p = new Properties();
  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google����@gmail.com���� ����
  p.put("mail.smtp.host", "smtp.gmail.com");
  p.put("mail.smtp.port", "465");
  p.put("mail.smtp.starttls.enable","true");
  p.put( "mail.smtp.auth", "true");
  p.put("mail.smtp.debug", "true");
  p.put("mail.smtp.socketFactory.port", "465"); 
  p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
  p.put("mail.smtp.socketFactory.fallback", "false");
  //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
  try {
   Authenticator auth = new SMTPAuthenticator();
   Session session = Session.getInstance(p, auth);
   session.setDebug(true); // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
   //session = Session.getDefaultInstance(p);
   MimeMessage msg = new MimeMessage(session);

   System.out.println("�޼��� ���� ����");

   String message = "ȸ������ ��й�ȣ�� �Ʒ��� �����ϴ�. ���� ���� ���� ����!\n\n"
			+"��й�ȣ : " + pass;
		   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
   msg.setSubject("Akinator ȸ�� ��й�ȣ�Դϴ�.");
   Address fromAddr = new InternetAddress("eunjung11525@gmail.com"); // ������ ����� �����ּ�
   msg.setFrom(fromAddr);
   Address toAddr = new InternetAddress(email);  // �޴� ����� �����ּ�
   msg.addRecipient(Message.RecipientType.TO, toAddr); 
   msg.setContent(message, "text/plain;charset=KSC5601");
   System.out.println("Message: " + msg.getContent());
   Transport.send(msg);
   System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����");
  }
  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
   System.out.println("Am i here??? ");
   mex.printStackTrace(); 
  } 
 }
 private static class SMTPAuthenticator extends javax.mail.Authenticator {
  public PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication("hta.l3.akinator@gmail.com ", "dkzlspdlxj"); // Google id, pwd, ����) @gmail.com �� �����ϼ���
  }
 }
 
 
 
 public static void favoritemail(String email, String keyword){
	 
	// session.setAttribute
		// DB ����
		 
		 
	  Properties p = new Properties();
	  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google����@gmail.com���� ����
	  p.put("mail.smtp.host", "smtp.gmail.com");
	  p.put("mail.smtp.port", "465");
	  p.put("mail.smtp.starttls.enable","true");
	  p.put( "mail.smtp.auth", "true");
	  p.put("mail.smtp.debug", "true");
	  p.put("mail.smtp.socketFactory.port", "465"); 
	  p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	  p.put("mail.smtp.socketFactory.fallback", "false");
	  //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	  try {
	   Authenticator auth = new SMTPAuthenticator();
	   Session session = Session.getInstance(p, auth);
	   session.setDebug(true); // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
	   //session = Session.getDefaultInstance(p);
	   MimeMessage msg = new MimeMessage(session);

	   System.out.println("�޼��� ���� ����");

	   String message = "����մϴ� ������ \n" +"��ǰ �ҽ� �˷��帳�ϴ� .\n" +"����ǰ " +keyword+" �� �԰� �Ǿ����ϴ�\n" + "�̿��� �ּż� �����մϴ�.";
			   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
	   msg.setSubject("Akinator  ȸ������ ���Ͻô� ����ǰ�� ��ϵǾ����ϴ�.");
	   Address fromAddr = new InternetAddress("hta.l3.akinator@gmail.com"); // ������ ����� �����ּ�
	   msg.setFrom(fromAddr);
	   Address toAddr = new InternetAddress(email);  // �޴� ����� �����ּ�
	   msg.addRecipient(Message.RecipientType.TO, toAddr); 
	   msg.setContent(message, "text/plain;charset=KSC5601");
	   System.out.println("Message: " + msg.getContent());
	   Transport.send(msg);
	   System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����");
	  }
	  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
	   System.out.println("I am here??? ");
	   mex.printStackTrace(); 
	  } 
	  
 }
}