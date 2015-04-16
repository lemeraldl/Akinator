<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String post = request.getParameter("p");
if("ok".equals(post)){
%>
<script>
alert("글 등록이 되었습니다.");
location.href="/AkinatorApp/Board/List.jsp";
</script>
<%
}else{
%>
<script>
alert("글 등록에 실패하였습니다.");
history.back();
</script>
<%
}
%>