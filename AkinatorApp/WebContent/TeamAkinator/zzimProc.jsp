 <%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<jsp:useBean id="dto" class="main.testDto"/>
<jsp:useBean id="dao" class="main.testDao"/>
<% 

	int productnum=Integer.parseInt(request.getParameter("num"));
	int usernum=Integer.parseInt(request.getParameter("usernum"));
	if(request.getParameter("usernum")==null||0==usernum){
%>
		<script>
			alert("로그인 하세요!");
			history.back();
		</script>
<%
	}
	else{
		dao.updateZzimnum(productnum,usernum);	
	}
	
%>
<script>
   location.href="/AkinatorApp/productdetailview.action?num=<%=productnum%>&&command=PRODUCTDETAILVIEW";
</script>
</head>
<body>
</body>
</html>