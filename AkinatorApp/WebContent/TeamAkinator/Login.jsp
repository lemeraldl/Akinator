 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title> 
<link href="/AkinatorApp/TeamAkinator/File/css/style.css" rel="stylesheet" />
 <link href="/AkinatorApp/TeamAkinator/File/css/quicket-bundle.css" rel="stylesheet" /> 
<link href="/AkinatorApp/TeamAkinator/File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/AkinatorApp/TeamAkinator/File/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="/AkinatorApp/TeamAkinator/File/script/jquery-2.1.1.min.js"></script>
<script src="/AkinatorApp/TeamAkinator/File/script/bootstrap.js"></script>
<script>
$(document).ready(function(){
   $("#btn_login").click(function(){
      var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
   
      if($("#phone").val() == ""){
         alert("�޴���ȭ ��ȣ�� �Է��ϼ���");
         $("#phone").focus();      
      }
      else if($("#pass").val() == ""){
         alert("��й�ȣ�� �Է��ϼ���");
         $("#pass").focus();
      } 
      else if(!regExp.test($("#phone").val())){
         alert("�޴���ȭ �������� �Է��ϼ���");
         $("#phone").val() == "";
         $("#phone").focus();         
      }
      else{
         $("#login").submit();
      }
      
   });
});
/* 
   function fnLogin(){
      if(document.f.phone.value ==""){
         alert("�޴���ȭ��ȣ�� �Է��ϼ���");
            document.f.phone.focus();
            return;
         }   
      else if(document.f.pass.value == ""){
         alert("��й�ȣ�� �Է��ϼ���");
            document.f.pass.focus();
            return;
         }      
      document.f.submit();
   }
 */
 </script>

<style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);;
   /*min-height: 700px;*/
}
   #menu-wrapper{margin:0 auto;width:825px;left:60px;top:300px;}
</style>
<meta name="robots" content="noindex,follow" />
</head>
<body>
<jsp:useBean id="dao" class="main.testDao" />

<%
   String searchField = request.getParameter("searchField");
%>
<div style="position:absolute; left: 450px; top: 200px;">
<a href="/AkinatorApp/TeamAkinator/Index.jsp">
   <img src="/AkinatorApp/TeamAkinator/File/img/2.PNG" width=300 height="300" alt="Akinator#" ">
</a>
</div>

<nav class="navbar navbar-fixed-top"><!-- ��� �޴��� �Ӽ� ����, ��ܸ޴��� ���� -->
   
   <div class="navbar-inner">   
      <a href="/AkinatorApp/TeamAkinator/Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- ��� �� �����ʿ� ���� Ȩ -->               
         <div class="navbar-form pull-left" >
         </div>         
      
      <!-- ��� �޴���1  -->
      <div class="navbar-inner" id="sidang">   
         <form class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
               <li><a href="#">�ܻ�ǰ���</a></li>
               <li class="divider-vertical"></li> <!-- ���м� -->
               <li><a href="http://www.naver.com">������ ã�Ƶ帳�ϴ�</a></li>
               <li class="divider-vertical"></li> <!-- ���м� -->
               <li><a href="#">�˸�</a></li>
               <li class="divider-vertical"></li>
                 <c:if test="${sessionScope.id == null}">
               <li><a href="Login.jsp">�α���</a></li>
               <li class="divider-vertical"></li>
               <li><a href="/AkinatorApp/TeamAkinator/regForm.jsp">ȸ������</a></li>
               <li class="divider-vertical"></li>         
                   </c:if>
          <c:if test="${sessionScope.id != null}">
               <li><a href="Logout.jsp">�α׾ƿ�</a></li>
               <li class="divider-vertical"></li>
               </c:if>
            </ul>
         </form>
      </div>
   </div>
  <!-- ������츦 ��ư� ����� ���״°� -->
<div id="menu-wrapper container-fluid" align="center" style="height:40px">
   <nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="/AkinatorApp/TeamAkinator/Index.jsp">Ȩ</a>
         <div>
            <div class="nav-mega-column">
            </div>
   
      </li>
      <li class="divider-vertical"></li>
      
      <li><a href="#">ī�װ�</a>
      <div>
            <div class="nav-mega-column">
               <h3>��ǻ�� ������ ����</h3>
               <ul>
                  <li><a href="#">�����</a></li>
                  <li><a href="#">��ǻ��</a></li>
                  <li><a href="#">ī�޶�</a></li>
                  <li><a href="#">����.����</a></li>
                  <li><a href="#">����</a></li>
               </ul>
                  
            
               <h3>��Ȱ ����</h3>
                  <ul>
                     <li><a href="#">������ǰ</a></li>
                     <li><a href="#">��Ȱ��ǰ</a></li>
                     <li><a href="#">����</a></li>   
                  </ul>
            </div>
               <div class="nav-mega-column">
                  <h3>�м� ��ȭ ��Ƽ</h3>
                  <ul>
                     <li><a href="#">�����Ƿ�</a></li>   
                     <li><a href="#">������ȭ</a></li>   
                     <li><a href="#">�����Ƿ�</a></li>   
                     <li><a href="#">������ȭ</a></li>   
                     <li><a href="#">��Ƽ, ȭ��ǰ</a></li>   
                  </ul>
               
                  <h3>��ǰ ���� �Ƶ�</h3>
                  <ul>
                     <li><a href="#">��ǰ</a></li>   
                     <li><a href="#">����, �Ƶ�</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>������ ���� ����</h3>
                  <ul>
                     <li><a href="#">������</a></li>   
                     <li><a href="#">����</a></li>   
                     <li><a href="#">����</a></li>   
               
                  </ul>
               
                  <h3>���� ���� ��Ÿ</h3>
                  <ul>
                     <li><a href="#">����, �̼�</a></li>   
                     <li><a href="#">����</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>���� ��� Ƽ��</h3>
                  <ul>
                     <li><a href="#">����</a></li>   
                     <li><a href="#">���</a></li>   
                     <li><a href="#">Ƽ��</a></li>   
                  </ul>
               
                  <h3>���� Ŀ�´�Ƽ<h3>
                  <ul>
                     <li><a href="#">��������</a></li>   
                     <li><a href="#">Ŀ�´�Ƽ</a></li>   
                  </ul>
               
               </div>
            </li>
         
      
      <li class="divider-vertical"></li>
      <li>
         <a href="#">����</a>
         <div>
            <div class="nav-mega-column">
               <h3 class="orange">Related Categories</h3>
               <ul>
                  <li><a href="#">�α����</a></li>
                  
               </ul>
               
      </li>
       <li class="divider-vertical"></li>
      <li><a href="#">�����</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">Ŀ�´�Ƽ</a></li>
          <li class="divider-vertical"></li>
         <li class="nav-mega-search">
         
         
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value=""/>            
            <button class="btn btn-primary" type="button" onclick="textSearch()">�˻�</button>
         </form>
      
   
   </ul>

</div>
</nav>   

<!-- �α��� -->

<form class="form-horizontal" action="/AkinatorApp/reg.action" method="post" name="f" id="login">
   <input type="hidden" name="command" value="LOGIN" />
 <div style="position:absolute; left: 300px; top: 300px;">
   <div class= "control-group">   
           <div class= "controls">
               <input type= "text" name ="phone" id="phone" placeholder="����ȣ" maxlength="11" size="7" class="input-medium"/>
             </div>
     </div>
    

    <div>
       <div class= "control-group">
           <label class= "control-label"></label>
              <div class= "controls">
                  <input type= "password" name ="pass" id="pass" placeholder="�н�����"  size="3"class="input-medium span2">
                  <span class="add-on"><a href="" class="icon-search" title="��й�ȣ�� �ؾ� �����̳���?" 
                     data-toggle="tooltip" id="theTooltip" data-placement="right" data-animation="false"></a></span>
               </div>
      </div>
   </div>
       <div class= "controls">                    
            <input type="button" value="�α���" onclick="fnLogin()" id="btn_login"/>                                  
        </div>      
   
   </form>
   
      
      



<!-- ������ -->
<nav class="navbar navbar-fixed-bottom">
<div class="navbar-inner">
    <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; ">
    <!-- <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; background: url(/quicket/images/popbg.png)"> -->
        <div style="font-size:15px">���� : akinator@co.kr</div>
        <div style="font-size:12px">��ȭ : 02.123.1234</div>
        <div style="font-size:11px; color:#E0624D; margin-top: 3px">���Ϸ� �����ֽø�, ���� ���� �亯�� ������ �� �ֽ��ϴ�.</div>
    </div>
    <div id="footer" style="font-size: 0.85em; margin: 0 auto;">

        <div style="padding-top: 18px;">
            <span style="margin-left: 5px;"><img style="margin-top: -15px;" src=""/></span>
            <span style="margin-left: 5px;">Akinator#  </span>
            <span style="margin-left: 5px;">����ڵ��: 369-3699-369</span>
            <span style="margin-left: 5px;">����� ���α� ���͵� 10-1 ��Ƹ�4��</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 15px;">
                <a href="javascript:;" id="aaa" onclick="javascript: $('#foot_pop').css('left',this.offsetLeft - 67); $('#foot_pop').toggle(); " target="_blank">������</a>
            </span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;">|</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;"><a href="http://bunjang.co.kr/m/terms/" target="_blank">�̿���/����������޹�ħ</a></span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;">|</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;"><a href="/marketing" target="_blank">������</a></span>
        </div>
    </div>
    </div>
</nav>
</body>
</html>