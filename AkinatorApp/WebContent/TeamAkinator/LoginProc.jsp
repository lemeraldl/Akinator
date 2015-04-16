<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String confirm = request.getParameter("confirm");
   
//LoginCommand lc = new LoginCommand();   
// String confirm = (String)lc.processCommand(request, response);
// RegConfirmConfirmCommand로부터 받은 정보를 담을 벡터 준비, 그리고 다시 REGCOMPLETE로 보낼 준비.
   String id = (String)session.getAttribute("id");
   


   if(confirm.equals("false")){
%>
      <script>
         alert("비밀번호가 일치 하지 않습니다");
         location.href="/AkinatorApp/TeamAkinator/Login.jsp";
          
      </script>   
<%
      return;
   }else if(confirm.equals("no id")){
%>
      <script>
         alert("존재하지 않는 폰번호 입니다");
         location.href="/AkinatorApp/TeamAkinator/Login.jsp";
      </script>
<%
   }else if(confirm.equals("true")){
%>

      <script>
         
         alert("반갑습니다 <%=id%>님");
         location.href="/AkinatorApp/TeamAkinator/Index.jsp";
      </script>
<%
   }
%>      