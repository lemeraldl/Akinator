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
<br/><br/><br/><br/>
<p class="content_summary">찾으신 비밀번호가 가입시 입력한 이메일로 전송됩니다.</p>
<center><input type="button" value="닫기" onclick="close1()"/></center>
</body>
</html>