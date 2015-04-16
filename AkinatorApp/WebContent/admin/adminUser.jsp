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
		alert("삭제되었습니다.");
		location.href="/AkinatorApp/admin.do?COMMAND=USERDEL&delUser="+param;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>회원관리</h1>
<jsp:include page="adminHeader.jsp"></jsp:include>

<table border=1 width=75%  align=center>
<tr>
 <td align=center>닉네임</td>
 <td align=center>전화번호</td>
 <td align=center>패스워드</td>
 <td align=center>이메일</td>
 <td align=center>삭제</td>
</tr> 
<c:forEach var="dto" begin="0" items="${requestScope.adminuser_memberinfovector}" step="1">
<tr>
	<td>${dto.mem_id}</td><!-- 닉네임 -->
	<td>${dto.mem_phone}</td><!-- 전화번호 -->
	<td>${dto.mem_pass}</td><!-- 패스워드 -->
	<td>${dto.mem_email}</td><!-- 이메일 -->
	<td><a href="javascript:delUser('${dto.mem_num}')"> 삭제</a></td>
</tr>

</c:forEach>

</table> 

<jsp:include page="adminFooter.jsp"></jsp:include>

</body>
</html>