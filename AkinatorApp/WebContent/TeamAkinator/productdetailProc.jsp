<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%
   int num = Integer.parseInt(request.getParameter("num"));
%>
<script>
   alert("상품보자");
   location.href="productdetail.jsp?num="+<%=num%>;
</script> --%>

<%
   String follow = request.getParameter("follow");


if(follow.equals("add")){
%>

<script>
alert("팔로우 되었습니다.");
location.href="/AkinatorApp/TeamAkinator/Index.jsp";
</script>
<%
}
%>