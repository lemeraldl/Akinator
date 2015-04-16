<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/AkinatorApp/mongo.action" method="post" name="f" id="mongo" >
<input type="hidden" name="command" value="mongopost">
<input type="text" name="product1"/>
<input type="text" name="product2"/>
<input type="text" name="lsw"/>
<input type="text" name="old"/>
<input type="submit"/>
</form>


</body>
</html>