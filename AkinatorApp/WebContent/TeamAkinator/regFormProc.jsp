<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="confirm" value="${requestScope.confirm}"></c:set>
<c:if test="${param.confirm == 'phoneno'}">
<script>
   alert("이미 존재하는 전화번호입니다.");
   history.back();
</script>
</c:if>

<c:if test="${param.confirm == 'idno'}">
   <script>
   alert("이미 존재하는 닉네임입니다");
   history.back();
   </script>
</c:if>

<c:if test="${param.confirm == 'emailno'}">
   <script>
   alert("이미 존재하는 이메일입니다");
   history.back();
   </script>
</c:if>
<c:if test="${param.confirm == 'allok'}">
   <script>
   alert("가입하시겠습니까?");
   </script>
</c:if>
</body>
</html>