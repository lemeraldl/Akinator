 <%@page import="java.util.Vector"%>
<%@page import="Board.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">

   <style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);;
   /*min-height: 700px;*/
   </style>
 <script>
 	function fnsubmit(){
 		if(confirm("����� �Է��Ͻðڽ��ϱ�?")==true){
 			document.post.action="/AkinatorApp/board.do?command=REPLY";
 			document.post.submit();
 		}
 		else{
 			return false;
 		}
 	}
 </script>
</head>
<body>
<c:forEach var="dto" begin="0" step="1" items="${requestScope.reply_getboard}">
<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=84F399 height=25 align=center>�亯�ϱ�</td>
 </tr>
</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>


<!-- form action -->
<form name="post" method=post  id="f">
<input type="hidden" name="command" value="REPLY" />
<input type="hidden" name="ip" value="${requestScope.getRemoteAddr}">

<%-- <c:out value ="${requestScope.getRemoteAddr}"/> --%>
<input type="hidden" name="num" value="${dto.num}">
 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
    <tr>
     <td width=10%>�г���</td>
     <td width=90%><input type=text name=name size=10 maxlength=8 value="${dto.name}" readonly="readonly"></td>
    </tr>
    <tr>
	 <td width=10%>E-Mail</td>
	 <td width=90%><input type=text name=email size=30 maxlength=30 value="${dto.email}" readonly="readonly"></td>
    </tr>
    <tr>
     <td width=10%>�� ��ȣ</td>
     <td width=90%><input type=text name=phone size=40 maxlength=30 value="${dto.phone}" readonly="readonly"></td>
   	</tr>
    <tr>
     <td width=10%>�� ��</td>
     <td width=90%><input type=text name=subject size=50 maxlength=30 value="�亯 : ${dto.subject}"></td>
    </tr>
    <tr>
     <td width=10%>�� ��</td>
     <td width=90%><textarea name=content rows=10 cols=50>${dto.content}-----------------------------------------------</textarea></td>
    </tr>   
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
    <tr>
      <td><input type="button" value="���" onclick="fnsubmit()" />&nbsp;&nbsp; 
<!--      <td><input type="submit" value="���" onclick="fnsubmit()" />&nbsp;&nbsp; -->
         <input type=reset value="�ٽþ���">&nbsp;&nbsp;
     </td>
    </tr> 
   </table>
  </td>
 </tr>
 </c:forEach>
</form> 
</table>
</center>
</body>
</html>
