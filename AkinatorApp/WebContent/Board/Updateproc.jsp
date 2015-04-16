<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="update" value="${param.update}"/>
	
	<c:if test="${update == 'ok' }">
		<script>
		alert("수정되었습니다.");
		location.href="/AkinatorApp/board.do?command=BOARDMAIN";
		</script>
	</c:if>
	<c:if test="${update != 'ok' }">
		<script>
		alert("게시자가 아닙니다.");
		history.back();
		</script>
	</c:if>