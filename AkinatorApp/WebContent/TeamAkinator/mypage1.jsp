 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
function gogo(){
	document.g.submit();
	opener.document.f.phone.value=document.g.phonenum.value;

	window.close();	
}
</script>
</head>
<body>
<jsp:useBean id="dao" class="Member.UpdateMemberDao"></jsp:useBean>
<jsp:useBean id="dto" class="Member.MemberDto"></jsp:useBean>
<%
	System.out.println(request.getParameter("chkvl"));
int num = Integer.parseInt((String)session.getAttribute("usernum"));
dto=dao.getMemberInfo(num);	//���� ���߿� �����κп� ȸ����ȣ�޾Ƽ� �����ߵ�
	//session.getAttribute("usernum");
String phone=request.getParameter("phone");
%>
<script>
	alert(phone);
</script>

���� �� ��ȣ :  <input type="text" value="<%=dto.getMem_phone()%>" name="nowphonenum"/> 



<form method="post" id="g" name="g">
�ٲ� �� ��ȣ : <input type="text" name="phonenum" id="phonenum"/>
<input type="button" value="����" onclick="gogo()"/>
</form>
</body>
</html>