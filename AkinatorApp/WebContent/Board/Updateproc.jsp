<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="update" value="${param.update}"/>
	
	<c:if test="${update == 'ok' }">
		<script>
		alert("�����Ǿ����ϴ�.");
		location.href="/AkinatorApp/board.do?command=BOARDMAIN";
		</script>
	</c:if>
	<c:if test="${update != 'ok' }">
		<script>
		alert("�Խ��ڰ� �ƴմϴ�.");
		history.back();
		</script>
	</c:if>