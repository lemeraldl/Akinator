<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%
   int num = Integer.parseInt(request.getParameter("num"));
%>
<script>
   alert("��ǰ����");
   location.href="productdetail.jsp?num="+<%=num%>;
</script> --%>

<%
   String follow = request.getParameter("follow");


if(follow.equals("add")){
%>

<script>
alert("�ȷο� �Ǿ����ϴ�.");
location.href="/AkinatorApp/TeamAkinator/Index.jsp";
</script>
<%
}
%>