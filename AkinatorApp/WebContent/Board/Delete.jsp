<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="delete" value="${param.delete}" />
<c:out value="���" />
<c:if test="${delete == 'ok'}">
<script>
	alert("�����Ǿ����ϴ�.");
	location.href="/AkinatorApp/board.do?command=BOARDMAIN";
</script>
</c:if>
<c:if test="${delete != 'ok'}">
<script>
	alert("�Խ��ڰ� �ƴմϴ�");
	history.back();
</script>
</c:if> 