<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)request.getAttribute("idx");
	request.setAttribute("id", id);
	String result = request.getParameter("result");
	
	if(result.equals("false")){
%>
	<script>
		alert("�����ϴ� �г��� �Դϴ�.");	
		history.back();
		
	</script>
<%	

	}
	else{
%>
	<script>
		alert("�г��� ���� �����մϴ�");
		window.close();
	</script>
<%	
	}
	
%>