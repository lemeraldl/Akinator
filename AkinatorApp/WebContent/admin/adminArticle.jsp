<%@page import="Board.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="Board.board.BoardDao"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function delArticle(param){
		alert("�����Ǿ����ϴ�.");
		location.href="/AkinatorApp/admin.do?COMMAND=ARTICLEDEL&delArticle="+param;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�Խù�����</h1>
<jsp:include page="adminHeader.jsp"></jsp:include>
<table border=1 width=75%  align=center>
<tr>
 <td align=center>�Խ���</td>
 <td align=center>����</td>
 <td align=center>�Խ���</td>
 <td align=center>�̸���</td>
 <td align=center>������</td>
 <td align=center>����</td>
</tr> 

<c:forEach var="dto" begin="0" items="${requestScope.adminarticle_articleinfovector}" step="1">
<tr>
	<td>${dto.name}</td>
	<td>${dto.subject}</td>
	<td>${dto.regdate}</td>
	<td>${dto.email}</td>
	<td>${dto.ip}</td>
	<td><a href="javascript:delArticle('${dto.num}')"> ����</a></td>
</tr>

</c:forEach>

</table>
<jsp:include page="adminFooter.jsp"></jsp:include>
</body>
</html>