 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function delProduct(param){
		alert("�����Ǿ����ϴ�.");
		location.href="/AkinatorApp/admin.do?COMMAND=PRODUCTDEL&delProduct="+param;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>��ǰ����</h1>

<jsp:include page="adminHeader.jsp"></jsp:include>

<table border=1 width=75%  align=center>
<tr>
 <td align=center>�Ǹ���</td>
 <td align=center>��ǰ��</td>
 <td align=center>����</td>
 <td align=center>����</td>
 <td align=center>�����</td>
 <td align=center>��ǰ������</td>
 <td align=center>��ǰ�̹���</td>
 <td align=center>����</td>
</tr>

<c:forEach var="dto" begin="0" items="${requestScope.adminproduct_productinfovector}" step="1">
<tr>
	<td>${dto.sellerName}</td>
	<td>${dto.subject}</td>
	<td>${dto.price}</td>
	<td>${dto.quantity}</td>
	<td>${dto.regdate}</td>
	<td>${dto.buydate}</td>
	<td><img src="/AkinatorApp/Mokhwan/upload/${dto.productImage}" style="max-height: 200px;max-width: 200px"/></td>
	<td><a href="javascript:delProduct('${dto.product_num}')"> ����</a></td>
</tr>
</c:forEach>

</table>

<jsp:include page="adminFooter.jsp"></jsp:include>
</body>
</html>