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
   if(confirm("�����Ͻðڽ��ϱ�?")){   
   document.getElementById("command").value = "UPDATE";
   document.f.submit();
   }
   else{
      return;
   }
}

function del1(){     
   if(confirm("���� Ż���Ͻðڽ��ϱ�?") == true){      
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
      <input type="hidden" name="command" id="command" /> <!-- �ּ���  IDEA -->
      
      
<div class="bx_gray" align="center" >   
   <table class="myg_tab">   
      <tr>
         <td class="on" >
         <a class="first short" href="MemberInfo" style="color:red;"><span>ȸ������ ����</span></a>
         </td>   
      </tr>
   </table>
   
   <h5 class="list1">ȸ������ ����</h5>
   <div class="my_info_setting">
   
   <!-- ȸ�� Ż�� -->

      
   
      <a class="member_quit btn_s_gray10" id="CustomerWithdraw" onclick="del1()"><span>ȸ��Ż��</span></a>
      
      <table class="myinfo" summary="�̸�, ����ھ��̵�,  ��й�ȣ, E-mail> 
               <caption>ȸ������ ����</caption>
         <colgroup>
            <col style="width:17%; " />
            <col />
         </colgroup>
         <tbody>                     
            
            <!--����ȣ -->
<tr>
   <th scope="row"><label for="name">�� ��ȣ</label></th>
   <td>
      <div id="CustNAEditShow" class="nameCell">
      <ul>										
   <%--    <li><input type="text"  name="phone" value="<%=dto.getMem_phone()%>" title="�޴��� ��ȣ" placeholder="����ȣ" /></li> --%>
     	<li><input type="text"  name="phone" value="${requestScope.mvcMypage.mem_phone}" title="�޴��� ��ȣ" placeholder="����ȣ" /></li>
      </ul>									
         <div class="pop_layer_wrapB black inline">
            <!--a href="javascript:ToogleLayer('popChangeName1');" class="btn_s_gray"><span>�̸�����</span></a-->
            <a id="popChangeName" class="btn_s_gray" onclick="window.open('mypage1.jsp?chkvl=5', '���̹�', 'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500px, height=500px')"><span>��ȣ ����</span></a>   
                  
            <iframe class="pop_layerB pop_change_name" id="popChangeName1" frameborder="0" scrolling="no" src="/Popup/ChangeCustName" style="display:none;" title=""></iframe>
         </div>
      </div>
   </td>
</tr>
<tr>
   <th scope="row">�г���</th>
   <td><input type="text" name="id" value="${requestScope.mvcMypage.mem_id}" class="txt" title="�г���" placeholder="�г���" /></td>
   <p id="idcomment"></p>
</tr>      
            <!-- ��й�ȣ -->            
<tr>
   <th scope="row">��й�ȣ</th>
   <td>
   <ul>
   <!-- ���� ��й�ȣ�� DB�� ��й�ȣ�� ��ġ�ؾ��Ѵ� -->
   
   <li><input type="password" class="txt" name="nowpass" id="nowpass" placeholder="���� ��й�ȣ" /></li>   
   <li><input type="password" class="txt" name="newpass" id="newpass" placeholder="���ο� ��й�ȣ" /></li>   
   <li><input type="password" class="txt" name="pwconfirm" id="pwconfirm" placeholder="��й�ȣ Ȯ��" /></li>
   </td>
   
   </ul>

   </td>
</tr>                        
            <!-- �������� ��Ÿ ����Ʈ -->
            
<tr>
   <th scope="row"><label for="email">E-mail</label></th>
   <td>
      <input type="text" class="txt" id="email" name="email" title="�̸��� ���̵�" value="${requestScope.mvcMypage.mem_email}" placeholder="Email" /> 
	 
      	
      	  	  
      <!-- <a id="EmailChange" class="btn_acccount btn_s_gray"><span>�����ϱ�</span></a> -->
      
   </td>
</tr>

<tr>
	<th scope="row"><label for="interesting">���ɻ�ǰ </label></th>
	<td>
	<ul>
	<li><input type="text" class="txt" id="INTEREST1_KEYWORD" name="interest1_keyword" title="���ɻ�ǰ1"  value="${requestScope.mvcMypage.interest1_keyword}"/></li>
	<li><input type="text" class="txt" id="INTEREST2_KEYWORD" name="interest2_keyword" title="���ɻ�ǰ2"  value="${requestScope.mvcMypage.interest2_keyword}"/></li>
	<li><input type="text" class="txt" id="INTEREST2_KEYWORD" name="interest3_keyword" title="���ɻ�ǰ3"  value="${requestScope.mvcMypage.interest3_keyword}"/></li>
	
	</ul>
	</td>
</tr>

   </td>
</tr>                  
                        
         </tbody>
      </table>
   </div>
   
   <!-- �����ϱ� ��ư -->
   <div class="btn_center">
      <a class="btn_blue_style2" id="img_submit" name="img_submit" onclick="fnsubmit()"><span>�����ϱ�</span></a>
      
      <a id="popChangeName" class="btn_blue_style2" onclick="home()"><span>Home</span></a>
   </div>
</div>

</form >   




</body>
</html>