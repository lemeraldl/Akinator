 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title> 
<link href="File/css/style.css" rel="stylesheet" />
 <link href="File/css/quicket-bundle.css" rel="stylesheet" /> 
<link href="File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="File/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="File/script/jquery-2.1.1.min.js"></script>
<script src="File/script/bootstrap.js"></script>
<script>
$(document).ready(function(){
   $("#btn_login").click(function(){
      if($("#phone").val() == ""){
         alert("�޴���ȭ ��ȣ�� �Է��ϼ���");
         $("#phone").focus();      
      }
      else if($("#pass").val() == ""){
         alert("��й�ȣ�� �Է��ϼ���");
         $("#pass").focus();
      }
      else{
         $("#login").submit();
      }
      
   });
});
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
<%!
   public String getParam(HttpServletRequest req, String pName){
   if("null".equals(req.getParameter("searchField")))
      return "";
   else if(req.getParameter("searchField") != null)
      return req.getParameter("searchField");
   else
      return "";
}      
%>

<%
   String searchField = request.getParameter("searchField");
   Vector sellerInfo = dao.getSellerInfo();
   Vector productInfo = dao.getProductInfo(searchField);   
%>

<div style="position:absolute; left: 480px; top: 220px;">
<h1>������ ���</h1>
</div>
<nav class="navbar navbar-fixed-top"><!-- ��� �޴��� �Ӽ� ����, ��ܸ޴��� ���� -->
   
   <div class="navbar-inner">   
      <a href="/AkinatorApp/TeamAkinator/Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- ��� �� �����ʿ� ���� Ȩ -->               
         <div class="navbar-form pull-left" >         
            <!-- <input type="text" name="txtSearch" value="" placeholder="�˻�� �Է��ϼ���!" class="search-query"/> -->         
            <!-- <input type="submit" name="search" value="�˻�" class="btn btn-info"></input>       -->   
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
               <%if(session.getAttribute("usernum") == null){%>
               <li><a href="Login.jsp">�α���</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.jsp">ȸ������</a></li>
               <li class="divider-vertical"></li>         
            <%}
            else{ %>
               <li><a href="Logout.jsp">�α׾ƿ�</a></li>
               <li class="divider-vertical"></li>
               <%} %>               
            </ul>      
         </form>
      </div>
   </div>
   </nav>
   
<div id="menu-wrapper container-fluid" align="center" style="height:40px">
   <nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="/AkinatorApp/TeamAkinator/Index.jsp">Ȩ</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>Ȩ</h3> -->
            <!--    <ul>
                  <li><a href="#">�α� ��ǰ</a></li>
                  <li><a href="#">�ֽ� ��ǰ</a></li>
               
               </ul> -->
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
            <input type="text" placeholder="Search..." name="searchField" value='<%=getParam(request, "searchField")%>'>            
            <button class="btn btn-primary" type="button" onclick="textSearch()">�˻�</button>
         </form>
      
   
   </ul>

</div>
</nav>   

<!-- �α��� -->

<form class="form-horizontal" action="/AkinatorApp/admin.do" method="post" name="f" id="login">
   <input type="hidden" name="COMMAND" value="LOGIN" />
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
    <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; background: url(/quicket/images/popbg.png)">
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