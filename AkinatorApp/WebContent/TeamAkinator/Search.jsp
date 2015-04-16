<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>닉네임 중복체크</title>
<script>
	function check(){
		if(document.f.id.value==""){
			alert("닉네임을 입력하세요");
			document.f.id.focus();
		}
		//var id = document.f.id.value;
		
		//document.g.action="regForm.jsp?";
		//document.g.submit();
		document.f.submit();
		opener.document.join.id.value = document.f.id.value;
	}

</script>
</head>
<body>
<h3>중복 체크</h3>
<%
	String id = request.getParameter("id");
	//request.setAttribute("updateid", );
    session.setAttribute("checkedDup", "checked");
%>
<form method="post" action="/AkinatorApp/reg.action" name="f">
	<input type="hidden" name="command" value="SEARCH"/>
		<input type="text" name="id" value="<%=id%>"/>
		<input type="button" value="확인" onclick="check()"/>
</form>

<!-- 
<form method="post" name="g">
	<input type="hidden" name="id" value="<% %>"/>
</form>
 -->
</body>
</html>