<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
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
	<center><p class="content_summary">비밀번호를 찾고자 하는 핸드폰 번호를 입력해 주세요.</p></center>
	<center><input type="text" placeholder="핸드폰 번호" id="phonenum" name="phonenum"/></center>
	<center><p class="content_summary">버튼을 누른 후 잠시 지연이 있을 수 있습니다.</p></center>
</form>
<hr/>
<div>
	<center>
	<input type="button" value="다음" onclick="next1()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="닫기" onclick="close1()"/>
	</center>
</div>
</body>
</html>