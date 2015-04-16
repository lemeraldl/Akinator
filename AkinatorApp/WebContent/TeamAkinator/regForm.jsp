 <%@page import="Member.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<link href="File/css/style.css" rel="stylesheet" />
<link href="File/css/quicket-bundle.css" rel="stylesheet" />
<link href="File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="File/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet" />
<script>
	function find(){
		window.open("/AkinatorApp/TeamAkinator/findPassword1.jsp","new","width=400, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no");
	}
</script>

<script src="File/script/jquery-2.1.1.min.js"></script>

<script src="File/script/bootstrap.js"></script>
<script src="File/ajax.js"></script>
<script type="text/javascript">

var authOK="이메일 인증을 해주세요.";
//ajax 소스 시작
/*
var httpRequest =null;
	
	function getXMLHttpRequest() {
		return new XMLHttpRequest();
		
	}
	*/
	function fnSubmit() {
		//httpRequest = getXMLHttpRequest() ;
		//httpRequest.onreadystatechange=callback;
		alert("오는가?");
		var email =document.getElementById("email").value;
		var phonenum = document.getElementById("phone").value;
		
		var params = "email="+email+"&phone="+phonenum;
		
		sendRequest("auth_proc.jsp", params, callback, "get");
		
		
		
		
		//var paramValue = document.getElementById("id").value;
		//var param = "auth_proc?m_name="+paramValue;
		//httpRequest.open("GET",param, true);
		//httpRequest.send(null);
	}
	

	function callback() {
		
		if(httpRequest.readyState ==4) {
			if(httpRequest.status ==200) {
				//var data=httpRequest.responseText ;
			//	var div=document.getElementById("display");
				//div.innerHTML=data;
				//alert(httpRequest.responseText);
				
				alert("인증메일이 발송되었습니다. 메일을 확인해 주세요.");
			}
			else {
				alert(httpRequest.status);
			}
		}
	}
	
	function fnAuth() {
		
		// AUTH 테이블에 입력된 인증번호와 authno 텍스트필드에 입력받은 인증번호가 
		//같은지 확인
		var params1 = "authno="+document.getElementById("authno").value+"&phone="+document.getElementById("phone").value;
	
		sendRequest("auth_proc.jsp", params1, callback1, "get");
	
	}
	
	function callback1() {
		
		if(httpRequest.readyState ==4) {
			if(httpRequest.status ==200) {
				//var data=httpRequest.responseText ;
			//	var div=document.getElementById("display");
				//div.innerHTML=data;
				//alert(httpRequest.responseText);
				
				alert(httpRequest.responseText);
				authOK=httpRequest.responseText;
			}
			else {
				alert(httpRequest.status);

			}
		}
	}
	

// ajax 소스 끝
$(document).ready(function(){
   $("#btn_join").click(function(){
      var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
      
      if($("#phone").val() == ""){
         alert("폰 번호는 반드시 입력해야 합니다");
         //document.getElementById("phonecomment").innerHTML = "폰 번호는 반드시 입력해야 합니다";
         $("#phone").focus();   
         return;
      }      
      else if($("#pass").val() == ""){
         alert("1차 패스워드를 입력하세요");
         $("#pass").focus();
      }
      else if($("#pwconfirm").val() == ""){
         alert("2차 패스워드를 입력하세요");
         $("#pwconfirm").focus();
      }
      else if($("#pass").val() != $("#pwconfirm").val()){
         alert("비밀번호가 일치 하지 않습니다");
         $("#pass").val("");
         $("#pwconfirm").val("");
         $("#pass").focus();
      }
      else if($("#email").val() == ""){
         alert("이메일을 입력하세요");
         $("#email").focus();
      }
      else if($("#id").val() == ""){
         alert("닉네임을 입력하세요");
         $("#id").focus();
      }
     /*  else if(!regExp.test($("#phone").val())){
         alert("휴대폰 형식으로 입력하세요");
         $("#phone").val("");
         $("#phone").focus();
      }  */
      else if(authOK=="이메일 인증을 해주세요.") {
     	  alert("이메일 인증을 해주세요.");
       }
      else if(authOK=="인증번호가 틀립니다.") {
     	  alert("인증번호를 제대로!!");
       }	   
      
      else{
         $("#join").submit();
      }
      
   });
});

</script>
<style>
body {
	background-color: #f4f4f0
}
</style>
</head>
<body>

	<!-- 홈 사진 -->
	<div style="position: absolute; left: 450px; top: 100px;">
		<a href="/AkinatorApp/TeamAkinator/Index.jsp"> <img src="File/img/2.PNG" width=300
			height="300" alt="Akinator#" />
		</a>
	</div>


	<!-- 회원가입 -->

	<form class="form-horizontal" method="post"
		action="/AkinatorApp/reg.action" name="join" id="join">
		<input type="hidden" name="command" value="REGCONFIRM" />
		<!-- REGCONFIRM -->
		<div style="position: absolute; left: 300px; top: 200px;">
			<div class="control-group">
				<label class="control-label"></label>
				<!-- 폰번호 -->
				<div class="controls">
					<input type="text" name="phone" id="phone"
						placeholder="폰 번호(예:01012345678)" class="input-large"
						maxlength="11" size="7" /> <a class="icon-edit"
						title="-(하이픈)을 제외하고 입력하세요" data-toggle="tooltip" id="theTooltip"
						data-placement="right" data-animation="false"></a>
					<p id="phonecomment" style="color: red"></p>
				</div>
			</div>
			<div>

				<!-- 1차 비밀번호 -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="password" id="pass" name="pass"
							placeholder="비밀번호(6~16자)" class="input-large" maxlength="16"
							size="7" />
						<p id="pwcomment" style="color: red"></p>
					</div>
				</div>



				<!-- 2차 비밀번호 -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="password" id="pwconfirm" name="pwconfirm"
							placeholder="비밀번호재입력" class="input-large" maxlength="16" size="7"
							onchange="pwcheck()" />
						<p id="pwconfirmcomment" style="color: red"></p>
					</div>
				</div>


				<!-- 닉네임(2~8자) -->



				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">

						<input type="text" name="id" id="id" placeholder="닉네임(2~8자)"
							class="input-large" maxlength="8" size="7" />
						<p id="idcomment" style="color: red"></p>
						<!-- <input type="button" value="중복확인" onclick="Search()"/> -->
						<!-- <button class="btn" type="button" id="check" onclick="Search()">중복체크</button> -->
					</div>
				</div>


				<!-- 이메일 인증 폼 시작 -->
				<!-- <form class="form-horizontal" method="post" action="/AkinatorApp/reg.action" name="join"> -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<fieldset>
							<input type="email" id="email" name="email" placeholder="이메일 주소"
								class="input-large" /> 
								<input type="button" value="이메일 인증"
								onClick="fnSubmit()" />

							<!-- 이메일 폼 끝 -->
							<div id="emailcomment"></div>
						</fieldset>
					</div>
				</div>
				<!--  인증코드 입력 -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="text" id="authno" name="authno" placeholder="인증번호 입력"
							class="input-large" maxlength="16" size="7" /> <input
							type="button" id="auth" name="auth" value="인증번호 확인 "
							class="input-large" maxlength="16" size="7" onClick="fnAuth()" />
						<p id="pwconfirmcomment" style="color: red"></p>
					</div>
				</div>
				<input type="text" id="interest1_keyword" name="interest1_keyword" placeholder="관심키워드1"
				class="input-large" maxlength="16" size="7"/>
				<input type="text" id="interest2_keyword" name="interest2_keyword" placeholder="관심키워드2"
				class="input-large" maxlength="16" size="7"/>
				<input type="text" id="interest3_keyword" name="interest3_keyword" placeholder="관심키워드3"
				class="input-large" maxlength="16" size="7"/>
				<!--  가입하기 버튼 위인증번호 확인 버튼 끝-->

				<p class="text-info">
					이미 가입중이세요? <a href="Login.jsp">로그인 하기</a>
				</p>
				<p class="text-info">
					비밀번호를 잊어버리셨나요? <a href="javascript:find()">비밀번호 찾기</a>
				</p>
			</div>
			<input type="button" value="가입하기" id="btn_join" />
			<!-- onclick="fnsubmit()" -->
		</div>
	</form>





</body>
</html>