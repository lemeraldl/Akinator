<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String post = request.getParameter("p");
if("ok".equals(post)){
%>
<script>
alert("�� ����� �Ǿ����ϴ�.");
location.href="/AkinatorApp/Board/List.jsp";
</script>
<%
}else{
%>
<script>
alert("�� ��Ͽ� �����Ͽ����ϴ�.");
history.back();
</script>
<%
}
%>