<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="delete" value="${param.delete}" />
<c:out value="놀랬지" />
<c:if test="${delete == 'ok'}">
<script>
	alert("삭제되었습니다.");
	location.href="/AkinatorApp/board.do?command=BOARDMAIN";
</script>
</c:if>
<c:if test="${delete != 'ok'}">
<script>
	alert("게시자가 아닙니다");
	history.back();
</script>
</c:if> 