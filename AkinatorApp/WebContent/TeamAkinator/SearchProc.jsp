<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)request.getAttribute("idx");
	request.setAttribute("id", id);
	String result = request.getParameter("result");
	
	if(result.equals("false")){
%>
	<script>
		alert("존재하는 닉네임 입니다.");	
		history.back();
		
	</script>
<%	

	}
	else{
%>
	<script>
		alert("닉네임 생성 가능합니다");
		window.close();
	</script>
<%	
	}
	
%>