<%@page import="org.omg.CORBA.DynAnyPackage.Invalid"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("Index.jsp");
%>
</body>
</html>