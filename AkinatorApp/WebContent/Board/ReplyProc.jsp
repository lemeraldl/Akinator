 <%@page import="Board.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String reply = request.getParameter("reply");
if(reply.equals("ok")){
%>
<script>
alert("����� �ԷµǾ����ϴ�");
location.href="/AkinatorApp/board.do?command=BOARDMAIN";
</script>
<%
}%>
