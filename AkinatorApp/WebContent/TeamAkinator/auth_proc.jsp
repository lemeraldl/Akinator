 <%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="mailtest" class="mail.Gmail" />
<jsp:useBean id="auth" class="mail.AuthServlet" />

<%
String inputauth =  (String)request.getParameter("authno");
String email = (String)request.getParameter("email");
String phonenum = (String)request.getParameter("phone");
System.out.println("�Է¹��� ������ȣ : "+inputauth);
System.out.println(email);
PrintWriter outprint = response.getWriter();

if(inputauth ==null) {
	String authno = (String)auth.getRandomKey(6); //������ȣ ����
	mailtest.gmailtest(email,authno);		//������ȣ �߼�
	auth. insertAuthno(phonenum, authno); //�������̺� ����ȣ, ������ȣ �Է�

} else if(inputauth!=null)  {
	System.out.println(inputauth);
	String result = auth.compareAuthno(phonenum, inputauth);
	outprint.print(result);
	
}
%>

