<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String confirm = request.getParameter("confirm");
   
   String id = (String)session.getAttribute("id");
   
   	System.out.println(id);
   if(confirm.equals("false")){
%>
      <script>
         alert("���̵� Ȥ�� ��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
         location.href="/AkinatorApp/admin/adminLogin.jsp";
          
      </script>   
<%
      return;
   }else if(confirm.equals("no id")){
%>
      <script>
         alert("�������� �ʴ� ����ȣ �Դϴ�");
         location.href="/AkinatorApp/admin/adminLogin.jsp";
      </script>
<%
	
   }else if(confirm.equals("true")&&id.equals("admin") ){
	   
%>
      <script>
         alert("������ �������� ����");
         location.href="/AkinatorApp/admin.do?COMMAND=USER";
      </script>
<%
   }
   else{
	   %>
	<script>
		alert("���̵� Ȥ�� ��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
		location.href="/AkinatorApp/admin/adminLogin.jsp";
	</script>
	   <%
   }
%>      