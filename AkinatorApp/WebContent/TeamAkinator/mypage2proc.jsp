<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String check = request.getParameter("check");
System.out.println("mypage2proc"+check);

      if("passno".equals(check)){%>
      <script>
      alert("���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�");
      history.back();
      </script>
   <% }
   else if("passok".equals(check)){         
         String id = request.getParameter("id");
         session.setAttribute("id", id);%>
         <script>      
         alert("ȸ�������� �����Ǿ����ϴ�")
         location.href="TeamAkinator/Index.jsp";
            </script>
        
   <%}else if("bye".equals(check)){%>
      <script>
      alert("Ż��Ǿ����ϴ�. �ι� �ٽ� ���� �ȵ� ����");      
      location.href="TeamAkinator/Index.jsp";
      </script>
      <%} %>
      