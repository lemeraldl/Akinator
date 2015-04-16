<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${requestScope.reg!='complete'}">
   <script>
   alert("가입되셨습니다!!");
   location.href="TeamAkinator/Index.jsp";
   </script>
</c:if>   
  