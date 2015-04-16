 <%@page import="Board.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="dao" class="Board.board.BoardDao"></jsp:useBean>

<%String id=request.getParameter("id"); 








%>
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
<h1>알림내역 <%=id %></h1> <!-- id -->
<jsp:include page="adminHeader.jsp"></jsp:include>
<table border=1 width=75%  align=center>
<tr>
 <td align=center>상품명</td>
 <td align=center>알림글</td>
 <td align=center>삭제</td>
</tr> 


<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>



</table>
<jsp:include page="adminFooter.jsp"></jsp:include>
</body>
</html>