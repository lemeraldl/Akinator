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
		alert("삭제되었습니다.");
		location.href="/AkinatorApp/admin.do?COMMAND=ARTICLEDEL&delArticle="+param;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>게시물관리</h1>
<jsp:include page="adminHeader.jsp"></jsp:include>
<table border=1 width=75%  align=center>
<tr>
 <td align=center>게시자</td>
 <td align=center>제목</td>
 <td align=center>게시일</td>
 <td align=center>이메일</td>
 <td align=center>아이피</td>
 <td align=center>삭제</td>
</tr> 

<c:forEach var="dto" begin="0" items="${requestScope.adminarticle_articleinfovector}" step="1">
<tr>
	<td>${dto.name}</td>
	<td>${dto.subject}</td>
	<td>${dto.regdate}</td>
	<td>${dto.email}</td>
	<td>${dto.ip}</td>
	<td><a href="javascript:delArticle('${dto.num}')"> 삭제</a></td>
</tr>

</c:forEach>

</table>
<jsp:include page="adminFooter.jsp"></jsp:include>
</body>
</html>