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

var authOK="�̸��� ������ ���ּ���.";
//ajax �ҽ� ����
/*
var httpRequest =null;
	
	function getXMLHttpRequest() {
		return new XMLHttpRequest();
		
	}
	*/
	function fnSubmit() {
		//httpRequest = getXMLHttpRequest() ;
		//httpRequest.onreadystatechange=callback;
		alert("���°�?");
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
				
				alert("���������� �߼۵Ǿ����ϴ�. ������ Ȯ���� �ּ���.");
			}
			else {
				alert(httpRequest.status);
			}
		}
	}
	
	function fnAuth() {
		
		// AUTH ���̺� �Էµ� ������ȣ�� authno �ؽ�Ʈ�ʵ忡 �Է¹��� ������ȣ�� 
		//������ Ȯ��
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
	

// ajax �ҽ� ��
$(document).ready(function(){
   $("#btn_join").click(function(){
      var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
      
      if($("#phone").val() == ""){
         alert("�� ��ȣ�� �ݵ�� �Է��ؾ� �մϴ�");
         //document.getElementById("phonecomment").innerHTML = "�� ��ȣ�� �ݵ�� �Է��ؾ� �մϴ�";
         $("#phone").focus();   
         return;
      }      
      else if($("#pass").val() == ""){
         alert("1�� �н����带 �Է��ϼ���");
         $("#pass").focus();
      }
      else if($("#pwconfirm").val() == ""){
         alert("2�� �н����带 �Է��ϼ���");
         $("#pwconfirm").focus();
      }
      else if($("#pass").val() != $("#pwconfirm").val()){
         alert("��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
         $("#pass").val("");
         $("#pwconfirm").val("");
         $("#pass").focus();
      }
      else if($("#email").val() == ""){
         alert("�̸����� �Է��ϼ���");
         $("#email").focus();
      }
      else if($("#id").val() == ""){
         alert("�г����� �Է��ϼ���");
         $("#id").focus();
      }
     /*  else if(!regExp.test($("#phone").val())){
         alert("�޴��� �������� �Է��ϼ���");
         $("#phone").val("");
         $("#phone").focus();
      }  */
      else if(authOK=="�̸��� ������ ���ּ���.") {
     	  alert("�̸��� ������ ���ּ���.");
       }
      else if(authOK=="������ȣ�� Ʋ���ϴ�.") {
     	  alert("������ȣ�� �����!!");
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

	<!-- Ȩ ���� -->
	<div style="position: absolute; left: 450px; top: 100px;">
		<a href="/AkinatorApp/TeamAkinator/Index.jsp"> <img src="File/img/2.PNG" width=300
			height="300" alt="Akinator#" />
		</a>
	</div>


	<!-- ȸ������ -->

	<form class="form-horizontal" method="post"
		action="/AkinatorApp/reg.action" name="join" id="join"
		enctype="multipart/form-data">
		<input type="hidden" name="command" value="REGCONFIRM" />
		<!-- REGCONFIRM -->
		<div style="position: absolute; left: 300px; top: 200px;">
			<div class="control-group">
				<label class="control-label"></label>
				<!-- ����ȣ -->
				<div class="controls">
					<input type="text" name="phone" id="phone"
						placeholder="�� ��ȣ(��:01012345678)" class="input-large"
						maxlength="11" size="7" /> <a class="icon-edit"
						title="-(������)�� �����ϰ� �Է��ϼ���" data-toggle="tooltip" id="theTooltip"
						data-placement="right" data-animation="false"></a>
					<p id="phonecomment" style="color: red"></p>
				</div>
			</div>
			<div>

				<!-- 1�� ��й�ȣ -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="password" id="pass" name="pass"
							placeholder="��й�ȣ(6~16��)" class="input-large" maxlength="16"
							size="7" />
						<p id="pwcomment" style="color: red"></p>
					</div>
				</div>



				<!-- 2�� ��й�ȣ -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="password" id="pwconfirm" name="pwconfirm"
							placeholder="��й�ȣ���Է�" class="input-large" maxlength="16" size="7"
							onchange="pwcheck()" />
						<p id="pwconfirmcomment" style="color: red"></p>
					</div>
				</div>


				<!-- �г���(2~8��) -->



				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">

						<input type="text" name="id" id="id" placeholder="�г���(2~8��)"
							class="input-large" maxlength="8" size="7" />
						<p id="idcomment" style="color: red"></p>
						<!-- <input type="button" value="�ߺ�Ȯ��" onclick="Search()"/> -->
						<!-- <button class="btn" type="button" id="check" onclick="Search()">�ߺ�üũ</button> -->
					</div>
				</div>


				<!-- �̸��� ���� �� ���� -->
				<!-- <form class="form-horizontal" method="post" action="/AkinatorApp/reg.action" name="join"> -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<fieldset>
							<input type="email" id="email" name="email" placeholder="�̸��� �ּ�"
								class="input-large" /> 
								<input type="button" value="�̸��� ����"
								onClick="fnSubmit()" />

							<!-- �̸��� �� �� -->
							<div id="emailcomment"></div>
						</fieldset>
					</div>
				</div>
				<!--  �����ڵ� �Է� -->
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input type="text" id="authno" name="authno" placeholder="������ȣ �Է�"
							class="input-large" maxlength="16" size="7" /> <input
							type="button" id="auth" name="auth" value="������ȣ Ȯ�� "
							class="input-large" maxlength="16" size="7" onClick="fnAuth()" />
						<p id="pwconfirmcomment" style="color: red"></p>
					</div>
				</div>
				<input type="text" id="INTEREST1_KEYWORD" name="INTEREST1_KEYWORD" placeholder="����Ű����1"
				class="input-large" maxlength="16" size="7"/>
				<input type="text" id="INTEREST2_KEYWORD" name="INTEREST2_KEYWORD" placeholder="����Ű����2"
				class="input-large" maxlength="16" size="7"/>
				<input type="text" id="INTEREST3_KEYWORD" name="INTEREST3_KEYWORD" placeholder="����Ű����3"
				class="input-large" maxlength="16" size="7"/>
				<!--  �����ϱ� ��ư ��������ȣ Ȯ�� ��ư ��-->
				<input type="file" name="profile" id="profile" />������ ������ �־��ּ��� 	
					
				<p class="text-info">
					�̹� �������̼���? <a href="Login.jsp">�α��� �ϱ�</a>
				</p>
				<p class="text-info">
					��й�ȣ�� �ؾ�����̳���? <a href="javascript:find()">��й�ȣ ã��</a>
				</p>
			</div>
			<input type="button" value="�����ϱ�" id="btn_join" />
			<!-- onclick="fnsubmit()" -->
		</div>
	</form>


<!-- <form   method="post" name="profile" id="profile" 
		enctype="multipart/form-data">
		
		
		
		</form> -->


</body>
</html>