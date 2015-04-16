 <%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="mailtest" class="mail.Gmail" />
<jsp:useBean id="auth" class="mail.AuthServlet" />

<%
String inputauth =  (String)request.getParameter("authno");
String email = (String)request.getParameter("email");
String phonenum = (String)request.getParameter("phone");
System.out.println("입력받은 인증번호 : "+inputauth);
System.out.println(email);
PrintWriter outprint = response.getWriter();

if(inputauth ==null) {
	String authno = (String)auth.getRandomKey(6); //인증번호 생성
	mailtest.gmailtest(email,authno);		//인증번호 발송
	auth. insertAuthno(phonenum, authno); //인증테이블에 폰번호, 인증번호 입력

} else if(inputauth!=null)  {
	System.out.println(inputauth);
	String result = auth.compareAuthno(phonenum, inputauth);
	outprint.print(result);
	
}
%>

