<%@page import="main.MongoBoardDto"%>
<%@page import="main.mongoDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function delArticle(param){
		alert("삭제되었습니다.");
		alert(param);
		location.href="/AkinatorApp/mongo.action?command=mongodel&delArticle="+param;
	}
	
	/* function test(param){
		
		alert("a전달");
		alert(param);
		location.href="/AkinatorApp/mongo.action?a="+param;
		
	} */
</script>

</head>
<% Vector mongov= new Vector();
	
MongoBoardDto mdto=new MongoBoardDto();
mongoDao m = new mongoDao();
	
		mongov=m.getmongoboardinfo();
	int a=10;
	String b="aabb";

%>

<body>

<%-- <input type="hidden" name="delArticle" value="<%=mdto.getNickname()%>"> --%>
<table border=1 width=75%  align=center>

<tr>
 <td align=center>nickname</td>
 <td align=center>phonenum</td>
 <td align=center>pwd</td>
 <td align=center>email</td>
 <td align=center>삭제</td>
</tr> 

<%for( int i =0 ; i<mongov.size(); i++){ 
			
	mdto=(MongoBoardDto)mongov.get(i);
		
			System.out.println("벡터 사이즈는 "+mongov.size());
			System.out.println("dto.getnickname"+mdto.getNickname());
%>
<tr>
	<td><%=mdto.getNickname()%></td>
	<td><%=mdto.getPhonenum() %></td>
	<td><%=mdto.getPwd() %></td>
	<td><%=mdto.getEmail() %></td>
	<td><a href="javascript:delArticle('<%=mdto.getNickname()%>')">삭제</a></td>
	
	
	
	<%-- 
	<td><a href="javascript:test('<%=a%>')"></a>a</td> --%>
<%-- <a href="javascript:delArticle('<%=mdto.getNickname()%>')">삭제</a> --%>
<!-- <input type="submit" value="삭제"> -->
</tr>

<%} %>


</table>


</body>
</html>