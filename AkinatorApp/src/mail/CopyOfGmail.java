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
public class CopyOfGmail
{
	
	
	
 public static void gmailtest(String email, String authno) 
 
 {
	// session.setAttribute
	// DB 연결
	 
	 
  Properties p = new Properties();
  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google계정@gmail.com으로 설정
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
   session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
   //session = Session.getDefaultInstance(p);
   MimeMessage msg = new MimeMessage(session);

   System.out.println("메세지 설정 성공");

   String message = "Akinator 회원 가입을 위한 인증 메일입니다. \n 아래 인증번호를 입력해 주세요.. \n"
			+authno;
		   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
   msg.setSubject("Akinator 회원 가입을 위한 인증 메일입니다.");
   Address fromAddr = new InternetAddress("eunjung11525@gmail.com"); // 보내는 사람의 메일주소
   msg.setFrom(fromAddr);
   Address toAddr = new InternetAddress(email);  // 받는 사람의 메일주소
   msg.addRecipient(Message.RecipientType.TO, toAddr); 
   msg.setContent(message, "text/plain;charset=KSC5601");
   System.out.println("Message: " + msg.getContent());
   Transport.send(msg);
   System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
  }
  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
   System.out.println("I am here??? ");
   mex.printStackTrace(); 
  } 
 }
 
 //이메일용
public static void gmailPassword(String email, String pass) 
 
 {
	// session.setAttribute
	// DB 연결
	 
	 
  Properties p = new Properties();
  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google계정@gmail.com으로 설정
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
   session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
   //session = Session.getDefaultInstance(p);
   MimeMessage msg = new MimeMessage(session);

   System.out.println("메세지 설정 성공");

   String message = "회원님의 비밀번호는 아래와 같습니다. 개인 정보 유출 조심!\n\n"
			+"비밀번호 : " + pass;
		   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
   msg.setSubject("Akinator 회원 비밀번호입니다.");
   Address fromAddr = new InternetAddress("eunjung11525@gmail.com"); // 보내는 사람의 메일주소
   msg.setFrom(fromAddr);
   Address toAddr = new InternetAddress(email);  // 받는 사람의 메일주소
   msg.addRecipient(Message.RecipientType.TO, toAddr); 
   msg.setContent(message, "text/plain;charset=KSC5601");
   System.out.println("Message: " + msg.getContent());
   Transport.send(msg);
   System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
  }
  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
   System.out.println("Am i here??? ");
   mex.printStackTrace(); 
  } 
 }
 private static class SMTPAuthenticator extends javax.mail.Authenticator {
  public PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication("eunjung11525", "dlthq799"); // Google id, pwd, 주의) @gmail.com 은 제외하세요
  }
 }
 
 
 
 public static void favoritemail(String email, String keyword){
	 
	// session.setAttribute
		// DB 연결
		 
		 
	  Properties p = new Properties();
	  p.put("mail.smtp.user", "eunjung11525@gmail.com"); // Google계정@gmail.com으로 설정
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
	   session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
	   //session = Session.getDefaultInstance(p);
	   MimeMessage msg = new MimeMessage(session);

	   System.out.println("메세지 설정 성공");

	   String message = "사랑합니다 고객님 \n" +"상품 소식 알려드립니다 .\n" +"새상품 " +keyword+" 가 입고 되었습니다\n" + "이용해 주셔서 감사합니다.";
			   //"http://localhost:8080/AkinatorApp/TeamAkinator/Index.jsp";
	   msg.setSubject("Akinator  회원님이 원하시는 새상품이 등록되었습니다.");
	   Address fromAddr = new InternetAddress("eunjung11525@gmail.com"); // 보내는 사람의 메일주소
	   msg.setFrom(fromAddr);
	   Address toAddr = new InternetAddress(email);  // 받는 사람의 메일주소
	   msg.addRecipient(Message.RecipientType.TO, toAddr); 
	   msg.setContent(message, "text/plain;charset=KSC5601");
	   System.out.println("Message: " + msg.getContent());
	   Transport.send(msg);
	   System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
	  }
	  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
	   System.out.println("I am here??? ");
	   mex.printStackTrace(); 
	  } 
	  
 }
}