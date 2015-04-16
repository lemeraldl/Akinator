 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="main.Replydto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="main.testDto"/>
<jsp:useBean id="dao" class="main.testDao"/>
<% 
   int productnum=Integer.parseInt(request.getParameter("num"));
   int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
   String textarea=request.getParameter("textarea");
   String id = (String)session.getAttribute("id");
   if(textarea!=null||textarea.equals(null)||null!=textarea||textarea.isEmpty()){
      dao.replyupdate(textarea, productnum,usernum,id);
   }
   System.out.println("프록시의 textarea는"+textarea);
%>
<script>
   alert("댓글이 입력되었습니다.");
   location.href="/AkinatorApp/TeamAkinator/productdetail.jsp?num="+"<%=productnum%>";
</script>