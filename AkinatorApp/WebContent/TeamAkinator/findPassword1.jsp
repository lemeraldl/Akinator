<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<script>
	function close1(){
		window.opener = window.location.href;
		self.close();
	}
	function next1(){
		document.f.submit();
		window.open("/AkinatorApp/reg.action?command=FINDPASSWORD&phonenum="+document.f.phonenum.value,"new","width=400, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no");
	}
</script>
</head>
<style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);
   /*min-height: 700px;*/
}
   #menu-wrapper{margin:0 auto;width:825px;left:60px;top:300px;}
</style>
<body>
<form name="f" method="post">
	<center><p class="content_summary">��й�ȣ�� ã���� �ϴ� �ڵ��� ��ȣ�� �Է��� �ּ���.</p></center>
	<center><input type="text" placeholder="�ڵ��� ��ȣ" id="phonenum" name="phonenum"/></center>
	<center><p class="content_summary">��ư�� ���� �� ��� ������ ���� �� �ֽ��ϴ�.</p></center>
</form>
<hr/>
<div>
	<center>
	<input type="button" value="����" onclick="next1()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="�ݱ�" onclick="close1()"/>
	</center>
</div>
</body>
</html>