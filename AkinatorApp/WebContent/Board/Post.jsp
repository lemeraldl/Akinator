<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function check(){
    var temp = document.f.phone.value;
    if(document.f.subject.value == ""){
        alert( "제목을 입력하세요" );
        document.f.subject.focus();
         return;
   }
    else if(isNaN(temp) == true) {

      alert( "폰 번호는 숫자로 입력" );
      document.f.phone.focus();
      return;
  }
    else{
    	if(confirm("등록하시겠습니까?")==true){
          document.f.submit();
    	}
    	else{
    		return false;
    	}
    	}
   }


</script>
</head>
   <style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);;
   /*min-height: 700px;*/
   </style>
<body>

<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor= gray height=25 align=center>글쓰기</td>
  
 </tr>
</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>
<form name="f" method="post" action="/AkinatorApp/board.do" >
<%-- <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"> --%>
<input type="hidden" name="command" value="POST" />

 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
    <tr>
     <td width=10%>닉네임</td>
     <td width=90%><input type=text name=name size=10 maxlength=8 value="${requestScope.id}" readonly="readonly"></td>
    </tr>
    <tr>
	 <td width=10%>EMail</td>
	 <td width=90%><input type=text name=email size=30 maxlength=30 value="${requestScope.email}" readonly="readonly"></td>
    </tr>
    <tr>
     <td width=10%>폰 번호</td>
     <td width=90%><input type=text name=phone  size=40 maxlength=30 placeholder="숫자로만입력" value="${requestScope.phone}" readonly="readonly"></td>
    </tr>
	<tr>
     <td width=10%>제 목</td>
     <td width=90%><input type=text name=subject size=50 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name=content rows=10 cols=50></textarea></td>
    </tr>
<!--     <tr>
     <td width=10%>비밀 번호</td> 
     <td width=90% ><input type=password name=pass size=15 maxlength=15></td>
    </tr> -->
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
    <tr>
     <td><input type=button value="등록"  onclick="check()"/>&nbsp;&nbsp;
         <input type=reset value="다시쓰기">&nbsp;&nbsp;
     </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>
