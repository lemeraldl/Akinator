<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String check = request.getParameter("check");
System.out.println("mypage2proc"+check);

      if("passno".equals(check)){%>
      <script>
      alert("현재 비밀번호가 일치하지 않습니다");
      history.back();
      </script>
   <% }
   else if("passok".equals(check)){         
         String id = request.getParameter("id");
         session.setAttribute("id", id);%>
         <script>      
         alert("회원정보가 수정되었습니다")
         location.href="TeamAkinator/Index.jsp";
            </script>
        
   <%}else if("bye".equals(check)){%>
      <script>
      alert("탈퇴되었습니다. 두번 다시 가입 안되 새꺄");      
      location.href="TeamAkinator/Index.jsp";
      </script>
      <%} %>
      