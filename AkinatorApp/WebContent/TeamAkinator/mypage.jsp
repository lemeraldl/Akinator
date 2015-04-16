 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="Member.UpdateMemberDao"></jsp:useBean>
<jsp:useBean id="dto" class="Member.MemberDto"></jsp:useBean>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ggg</title>
<!-- <link rel="shortcut icon" href="https://sslimage.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico"> -->
<!-- <link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/_Net/css/myg/ssl/head_reset.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/_Net/css/myg/ssl/head_layout.css"> -->
<link rel="stylesheet" type="text/css" href="https://script.gmarket.co.kr/_Net/css/myg/ssl/mysetting.css">
<script>
function home(){
   location.href="/AkinatorApp/TeamAkinator/Index.jsp";
}
function fnsubmit(){
   if(confirm("수정하시겠습니까?")){   
   document.getElementById("command").value = "UPDATE";
   document.f.submit();
   }
   else{
      return;
   }
}

function del1(){     
   if(confirm("정말 탈퇴하시겠습니까?") == true){      
      document.getElementById("command").value = "DELETE";
      document.f.submit();
      }
   else{
      return;
   }
   }



</script>
</head>
<body>

<form name="f" id="f" method="post" action="/AkinatorApp/reg.action">
      <input type="hidden" name="command" id="command" /> <!-- 주석이  IDEA -->
      
      
<div class="bx_gray" align="center" >   
   <table class="myg_tab">   
      <tr>
         <td class="on" >
         <a class="first short" href="MemberInfo" style="color:red;"><span>회원정보 설정</span></a>
         </td>   
      </tr>
   </table>
   
   <h5 class="list1">회원정보 설정</h5>
   <div class="my_info_setting">
   
   <!-- 회원 탈퇴 -->

      
   
      <a class="member_quit btn_s_gray10" id="CustomerWithdraw" onclick="del1()"><span>회원탈퇴</span></a>
      
      <table class="myinfo" summary="이름, 사용자아이디,  비밀번호, E-mail> 
               <caption>회원정보 설정</caption>
         <colgroup>
            <col style="width:17%; " />
            <col />
         </colgroup>
         <tbody>                     
            
            <!--폰번호 -->
<tr>
   <th scope="row"><label for="name">폰 번호</label></th>
   <td>
      <div id="CustNAEditShow" class="nameCell">
      <ul>										
   <%--    <li><input type="text"  name="phone" value="<%=dto.getMem_phone()%>" title="휴대폰 번호" placeholder="폰번호" /></li> --%>
     	<li><input type="text"  name="phone" value="${requestScope.mvcMypage.mem_phone}" title="휴대폰 번호" placeholder="폰번호" /></li>
      </ul>									
         <div class="pop_layer_wrapB black inline">
            <!--a href="javascript:ToogleLayer('popChangeName1');" class="btn_s_gray"><span>이름변경</span></a-->
            <a id="popChangeName" class="btn_s_gray" onclick="window.open('mypage1.jsp?chkvl=5', '네이버', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500px, height=500px')"><span>번호 변경</span></a>   
                  
            <iframe class="pop_layerB pop_change_name" id="popChangeName1" frameborder="0" scrolling="no" src="/Popup/ChangeCustName" style="display:none;" title=""></iframe>
         </div>
      </div>
   </td>
</tr>
<tr>
   <th scope="row">닉네임</th>
   <td><input type="text" name="id" value="${requestScope.mvcMypage.mem_id}" class="txt" title="닉네임" placeholder="닉네임" /></td>
   <p id="idcomment"></p>
</tr>      
            <!-- 비밀번호 -->            
<tr>
   <th scope="row">비밀번호</th>
   <td>
   <ul>
   <!-- 현재 비밀번호는 DB의 비밀번호와 일치해야한다 -->
   
   <li><input type="password" class="txt" name="nowpass" id="nowpass" placeholder="현재 비밀번호" /></li>   
   <li><input type="password" class="txt" name="newpass" id="newpass" placeholder="새로운 비밀번호" /></li>   
   <li><input type="password" class="txt" name="pwconfirm" id="pwconfirm" placeholder="비밀번호 확인" /></li>
   </td>
   
   </ul>

   </td>
</tr>                        
            <!-- 개인정보 기타 리스트 -->
            
<tr>
   <th scope="row"><label for="email">E-mail</label></th>
   <td>
      <input type="text" class="txt" id="email" name="email" title="이메일 아이디" value="${requestScope.mvcMypage.mem_email}" placeholder="Email" /> 
	 
      	
      	  	  
      <!-- <a id="EmailChange" class="btn_acccount btn_s_gray"><span>수정하기</span></a> -->
      
   </td>
</tr>

<tr>
	<th scope="row"><label for="interesting">관심상품 </label></th>
	<td>
	<ul>
	<li><input type="text" class="txt" id="INTEREST1_KEYWORD" name="interest1_keyword" title="관심상품1"  value="${requestScope.mvcMypage.interest1_keyword}"/></li>
	<li><input type="text" class="txt" id="INTEREST2_KEYWORD" name="interest2_keyword" title="관심상품2"  value="${requestScope.mvcMypage.interest2_keyword}"/></li>
	<li><input type="text" class="txt" id="INTEREST2_KEYWORD" name="interest3_keyword" title="관심상품3"  value="${requestScope.mvcMypage.interest3_keyword}"/></li>
	
	</ul>
	</td>
</tr>

   </td>
</tr>                  
                        
         </tbody>
      </table>
   </div>
   
   <!-- 수정하기 버튼 -->
   <div class="btn_center">
      <a class="btn_blue_style2" id="img_submit" name="img_submit" onclick="fnsubmit()"><span>수정하기</span></a>
      
      <a id="popChangeName" class="btn_blue_style2" onclick="home()"><span>Home</span></a>
   </div>
</div>

</form >   




</body>
</html>