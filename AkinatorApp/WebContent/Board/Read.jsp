 <%@page import="java.util.Vector"%>
<%@page import="Board.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<script>
function fndelete(){
	if(confirm("삭제 하시겠습니까?") == true){
		document.delete1.submit();
	}
	else{
		return;
	}
}
</script>
   <style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);;
   /*min-height: 700px;*/
   </style>
<body>
<c:set var="num" value="${param.num}"></c:set>
<c:set var="keyField" value="${param.keyField}"></c:set>
<c:set var="keyWord" value="${param.keyWord}"></c:set>

<c:forEach var="dto" begin="0" step="1" items="${requestScope.read}">

<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 아이디 </td>
	 <td bgcolor=#ffffe8>${dto.name}</td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8>${dto.regdate}</td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 >${dto.email}</td> 
	 <td align=center bgcolor=#dddddd width=10%> 폰 번호 </td>
	 <td bgcolor=#ffffe8 >${dto.phone}</td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3>${dto.subject}</td>
   </tr>
   <tr> 
    <td colspan=4>${dto.content}</td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     ${dto.ip}로 부터 글을 남기셨습니다./  조회수 : ${dto.count}
    </td>   
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
<c:if test="${sessionScope.usernum == dto.usernum}">	
	[ <a href="javascript:document.list.submit()">목 록</a> | 
	<a href="javascript:document.update.submit()">수 정</a> |
	<a href="javascript:document.reply.submit()">답 변</a> |
	<a href="javascript:fndelete()">삭 제</a> ]<br>
</c:if>

<c:if test="${sessionScope.usernum != dto.usernum}">
	[ <a href="javascript:document.list.submit()">목 록</a> | 
	<a href="javascript:document.reply.submit()">답 변</a> ]
</c:if>
	
  </td>
 </tr>
</table>
 <form name="list" method="post" action="/AkinatorApp/board.do?command=BOARDMAIN">
<%-- 	<input type="hidden" name="keyField" value="<%=keyField%>"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/> --%>
	<!-- <input type="hidden" name="command" value="READ" /> -->
</form> 

<form name="delete1" method="post" action="/AkinatorApp/board.do?command=DELETE">	
	<input type="hidden" name="num" value="${dto.num}"/>
</form>

<form name="update" method="post" action="/AkinatorApp/board.do?command=GETBOARD">
	<input type="hidden" name="num" value="${dto.num}"/>
</form>	

<form name="reply" method="post" action="/AkinatorApp/board.do?command=REPLYGETBOARD">
	<input type="hidden" name="num" value="${dto.num}"/>
</form>
 </c:forEach>
</body>
</html>
