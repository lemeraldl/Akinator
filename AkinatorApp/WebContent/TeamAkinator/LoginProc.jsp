<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String confirm = request.getParameter("confirm");
   
//LoginCommand lc = new LoginCommand();   
// String confirm = (String)lc.processCommand(request, response);
// RegConfirmConfirmCommand�κ��� ���� ������ ���� ���� �غ�, �׸��� �ٽ� REGCOMPLETE�� ���� �غ�.
   String id = (String)session.getAttribute("id");
   


   if(confirm.equals("false")){
%>
      <script>
         alert("��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
         location.href="/AkinatorApp/TeamAkinator/Login.jsp";
          
      </script>   
<%
      return;
   }else if(confirm.equals("no id")){
%>
      <script>
         alert("�������� �ʴ� ����ȣ �Դϴ�");
         location.href="/AkinatorApp/TeamAkinator/Login.jsp";
      </script>
<%
   }else if(confirm.equals("true")){
%>

      <script>
         
         alert("�ݰ����ϴ� <%=id%>��");
         location.href="/AkinatorApp/TeamAkinator/Index.jsp";
      </script>
<%
   }
%>      