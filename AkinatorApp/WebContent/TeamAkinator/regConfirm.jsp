  <%@page import="encrypt.AES128"%>
<%@page import="java.util.Vector"%>
<%@page import="Member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="enc" class="encrypt.AES128" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript"></script>
</head>
<script type="text/javascript">
   function fnCheck(){
      if(confirm("가입하시겠습니까?") == true){
      document.f.submit();
      }
      
      else{
    	  return;
      }
   }
   function fnBack(){
	   history.back();
   }
   
</script>

<style type="text/css">   
	#jointable table{width:600px; border:1px solid black}
	#jointable th{text-align: right; background-color:#DCDCDC;}
	#jointable td input {border:1px solid seagreen;}
</style>
<style>
body{background-color: #f4f4f0
</style>
</head>
<body>
<!-- 홈 사진 -->
<div style="position:absolute; left: 450px; top: 100px; ">
<a href="Index.jsp">
   <img src="/AkinatorApp/TeamAkinator/File/img/2.PNG" width="300" height="60" alt="Akinator#" ">
</a>
</div>


<!-- 회원가입 -->   

<c:forEach var="dto" begin="0" items="${requestScope.regconfirmedcommand_memberinfovector}" step="1">


   <form class="form-horizontal" method="post" action="/AkinatorApp/reg.action"  name="f">   
      <input type="hidden" name="command" value="REGCOMPLETE" />
      ${requsetScope.regconfirmedcommand_memberinfovector }
   <input type="hidden" name="phone" value="${dto.mem_phone}" />
   <input type="hidden" name="pass" value="${requestScope.regconfirmedcommand_passenc}" />
   <input type="hidden" name="id" value="${dto.mem_id}" />
   <input type="hidden" name="email" value="${dto.mem_email}" />
   <input type="hidden" name="interest1_keyword" value="${dto.interest1_keyword}" />
   <input type="hidden" name="interest2_keyword" value="${dto.interest2_keyword}" />
   <input type="hidden" name="interest3_keyword" value="${dto.interest3_keyword}" />
   
   <div style="position:absolute; left: 500px; top: 230px;">    
      <div class= "control-group">
         <label class="control-label" ></label>
         <!-- 폰번호 -->
            <div class= "controls">               
               <table id="jointable">
                  <tr>
                     <th align="left">휴대전화 번호</th>
                        <td>${dto.mem_phone}</td>
                  </tr>
                  <tr>
                     <th align="left">닉네임</th>
                        <td>${dto.mem_id}</td>
                  </tr>
                  <tr>
                     <th align="left">Email</th>
                        <td>${dto.mem_email}</td>
                  </tr>
               </table>
  </c:forEach>             
            </div>         
      </div>
   <div>      
   
      <!-- 닉네임(2~8자) -->
      <div class= "control-group">
         <label class= "control-label"></label>
            <div class= "controls">
            </div>
      </div>
      
      <!-- 이메일 주소 -->
      
      <div class= "control-group">
         <label class= "control-label"></label>
            <div class= "controls">
            
            </div>
      </div>      
   
   </div>    
        <input type="button" value="가입" onclick="fnCheck()"/>       
        <input type="button" value="뒤로가기" onclick="fnBack()" />                          
       </div>
    </form>
   <div style="position:absolute; left: 550px; top: 600px;">
   <p class="text-info">이미 가입중? <a href="Login.jsp">로그인 하기</a></p>
</div>

</body>
</html>