<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String confirm = request.getParameter("confirm");
   
   String id = (String)session.getAttribute("id");
   
   	System.out.println(id);
   if(confirm.equals("false")){
%>
      <script>
         alert("아이디 혹은 비밀번호가 일치 하지 않습니다");
         location.href="/AkinatorApp/admin/adminLogin.jsp";
          
      </script>   
<%
      return;
   }else if(confirm.equals("no id")){
%>
      <script>
         alert("존재하지 않는 폰번호 입니다");
         location.href="/AkinatorApp/admin/adminLogin.jsp";
      </script>
<%
	
   }else if(confirm.equals("true")&&id.equals("admin") ){
	   
%>
      <script>
         alert("관리자 권한으로 입장");
         location.href="/AkinatorApp/admin.do?COMMAND=USER";
      </script>
<%
   }
   else{
	   %>
	<script>
		alert("아이디 혹은 비밀번호가 일치 하지 않습니다");
		location.href="/AkinatorApp/admin/adminLogin.jsp";
	</script>
	   <%
   }
%>      