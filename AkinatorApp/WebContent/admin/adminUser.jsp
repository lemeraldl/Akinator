 <%@page import="Member.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="dao" class="Member.AdminDao"></jsp:useBean>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function delUser(param){
		alert("�����Ǿ����ϴ�.");
		location.href="/AkinatorApp/admin.do?COMMAND=USERDEL&delUser="+param;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ȸ������</h1>
<jsp:include page="adminHeader.jsp"></jsp:include>

<table border=1 width=75%  align=center>
<tr>
 <td align=center>�г���</td>
 <td align=center>��ȭ��ȣ</td>
 <td align=center>�н�����</td>
 <td align=center>�̸���</td>
 <td align=center>����</td>
</tr> 
<c:forEach var="dto" begin="0" items="${requestScope.adminuser_memberinfovector}" step="1">
<tr>
	<td>${dto.mem_id}</td><!-- �г��� -->
	<td>${dto.mem_phone}</td><!-- ��ȭ��ȣ -->
	<td>${dto.mem_pass}</td><!-- �н����� -->
	<td>${dto.mem_email}</td><!-- �̸��� -->
	<td><a href="javascript:delUser('${dto.mem_num}')"> ����</a></td>
</tr>

</c:forEach>

</table> 

<jsp:include page="adminFooter.jsp"></jsp:include>

</body>
</html>