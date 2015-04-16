 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% 
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:useBean id="dao" class="main.testDao" />


<%
   String searchField = request.getParameter("searchField");
	String best = request.getParameter("best");
	Vector productInfo=null;
	Vector sellerInfo=null;
	String cate= request.getParameter("categ");
	if(best=="best"||"best".equals(best)){
	productInfo = dao.getProductInfo(searchField,"countnum");
	sellerInfo= dao.getSellerInfo();
}
else if(cate!=null){
	productInfo = dao.getProductInfoForCate(cate);
	sellerInfo= dao.getSellerInfoForCate(cate);
}
else{
   productInfo = dao.getProductInfo(searchField);
   sellerInfo= dao.getSellerInfo();
}

%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Insert title here</title>
<link href="File/css/style.css" rel="stylesheet" />
 <link href="File/css/quicket-bundle.css" rel="stylesheet" /> 
<link href="File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="File/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="File/script/jquery-2.1.1.min.js"></script>
<script src="File/script/bootstrap.js"></script>

<script>	
      function check(param){
         if(param==("null")||null==param){
            alert("�α����ϼ���");
            return;
            //document.ch.action="../Mokhwan/main/regProduct.jsp";         
         }
         
         else if(param!=null||null!=param){
            location.href="/AkinatorApp/Mokhwan/main/regProductProc.jsp";
         }
      }
      
      function category(param){
         location.href="IndexProc.jsp?cate="+param+"&&category=checked";
      }
  
      // �˻����
	  function textSearch(){
         if(document.searchf.searchField.value == ""){
            alert("�˻�� �Է��ϼ���");
            document.searchf.searchField.focus();
            return;
         }
         document.searchf.submit();
      }
      function tblboard(){
    	  location.href="/AkinatorApp/board.do?command=BOARDMAIN";
      }
      

   

</script>

   <style>
   html,body{height:100%}
   body{margin:0;
   background: rgba(222, 211, 216, 1);
   /*min-height: 700px;*/
}
   #menu-wrapper{margin:0 auto;width:825px;left:60px;top:300px;}
   </style>
<meta name="robots" content="noindex,follow" />
   </head>
   
   
<body>

   
<nav class="navbar navbar-fixed-top"><!-- ��� �޴��� �Ӽ� ����, ��ܸ޴��� ���� -->
   
   <div class="navbar-inner">   
      <a href="Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- ��� �� �����ʿ� ���� Ȩ -->               
         <form class="navbar-form pull-left" >         
            <input type="text" name="txtSearch" value="" placeholder="�˻�� �Է��ϼ���!" class="search-query"/>         
            <!-- <input type="submit" name="search" value="�˻�" class="btn btn-info"></input> -->         
         </form>         
      
      <!-- ��� �޴���1  -->
      <div class="navbar-inner" id="sidang">   
         <div class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
            
   			<li><a href="../admin/adminLogin.jsp">������ ����</a></li>
            <li><a href="javascript:check('<%=session.getAttribute("usernum")%>')">�ܻ�ǰ���</a></li>
         
               <!-- <li><a href="../Mokhwan/main/regProduct.jsp" >�ܻ�ǰ���</a></li> -->                  
               
            
               <li class="divider-vertical"></li> <!-- ���м� -->
                <li><a href="http://www.naver.com">������ ã�Ƶ帳�ϴ�</a></li>
                <li class="divider-vertical"></li>
               <li><a href="#">�˸�</a></li>
               <li class="divider-vertical"></li>
               <%if(session.getAttribute("usernum") == null){%>            
               <li><a href="Login.jsp">�α���</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.jsp">ȸ������</a></li>
               <li class="divider-vertical"></li>       
              
                     <%}
               else{ %>
               <%String id = (String)session.getAttribute("id");%>
               
               <li><a href="mypage.jsp"><%=id%>���� mypage</a></li>            
               <li class="divider-vertical"></li>
                  <li><a href="Logout.jsp?logout=bye">�α׾ƿ�</a></li>
                          
               
                  <li class="divider-vertical"></li>
                  <%} %>      
                  
            </ul>      
         </div>
      </div>
   </div>
   </nav>
   
<!-- <div id="menu-wrapper container-fluid" align="center" style="height:40px"> -->

<div id="menu-wrapper container" align="center" style="height:40px">
   <nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="Index.jsp">Ȩ</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>Ȩ</h3> -->
       			<ul>
                  <li><a href="javascript:category('best')">�α� ��ǰ</a></li>
                  <li><a href="Index.jsp">�ֽ� ��ǰ</a></li>
               
               </ul>
            </div>
   
      </li>
      <li class="divider-vertical"></li>
      
      <li><a href="#">ī�װ�</a>
      <div>
            <div class="nav-mega-column">
               <h3>��ǻ�� ������ ����</h3>
               <ul>
                 <li><a href="javascript:category('mobile')">�����</a></li>
                  <li><a href="javascript:category('computer')">��ǻ��</a></li>
                  <li><a href="javascript:category('camera')">ī�޶�</a></li>
                  <li><a href="javascript:category('music')">����.����</a></li>
                  <li><a href="javascript:category('video')">����</a></li>
               </ul>
                  
            
               <h3>��Ȱ ����</h3>
                  <ul>
                      <li><a href="javascript:category('appliance')">������ǰ</a></li>
                     <li><a href="javascript:category('dailySupplies')">��Ȱ��ǰ</a></li>
                     <li><a href="javascript:category('furniture')">����</a></li>   
                  </ul>
            </div>
               <div class="nav-mega-column">
                  <h3>�м� ��ȭ ��Ƽ</h3>
                  <ul>
                     <li><a href="javascript:category('wClothes')">�����Ƿ�</a></li>   
                     <li><a href="javascript:category('wShoes')">������ȭ</a></li>   
                     <li><a href="javascript:category('mClothes')">�����Ƿ�</a></li>   
                     <li><a href="javascript:category('mShoes')">������ȭ</a></li>   
                     <li><a href="javascript:category('cosmetic')">��Ƽ, ȭ��ǰ</a></li>   
                  </ul>
               
                  <h3>��ǰ ���� �Ƶ�</h3>
                  <ul>
                    <li><a href="javascript:category('food')">��ǰ</a></li>   
                     <li><a href="javascript:category('babySupplies')">����, �Ƶ�</a></li>   
                </ul>
               </div>
               
               <div class="nav-mega-column">
                  <h3>������ ���� ����</h3>
                  <ul>
                      <li><a href="javascript:category('sport')">������</a></li>   
                     <li><a href="javascript:category('car')">����</a></li>   
                     <li><a href="javascript:category('game')">����</a></li>     
               
                  </ul>
               
                  <h3>���� ���� ��Ÿ</h3>
                  <ul>
                    <li><a href="javascript:category('artSupplies')">����, �̼�</a></li>   
                     <li><a href="javascript:category('handmade')">����</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>���� ��� Ƽ��</h3>
                  <ul>
                             <li><a href="javascript:category('book')">����</a></li>   
                     <li><a href="javascript:category('interest')">���</a></li>   
                     <li><a href="javascript:category('ticket')">Ƽ��</a></li>      
                  </ul>
               
                  <h3>���� Ŀ�´�Ƽ</h3>
                  <ul>
                    <li><a href="javascript:category('nanum')">��������</a></li>   
                     <li><a href="javascript:category('community')">Ŀ�´�Ƽ</a></li>   
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
                  <li><a href="javascript:category('hit')">�α����</a></li>
                  
               </ul>
               
      </li>
       <li class="divider-vertical"></li>
      <li><a href="#">�����</a></li>
      <li class="divider-vertical"></li>
      <li><a href="javascript:tblboard('community')">Ŀ�´�Ƽ</a></li> <!-- �Խ��� -->
      <li class="divider-vertical"></li>
   		<li class="nav-mega-search">
   		
   		
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value="">            
            <button class="btn btn-primary" type="button" onclick="textSearch()">�˻�</button>
         </form>
      </li>
   </ul>

</div>
<!-- ���̵��(���� ����) -->
<div id="sidebar">
   <a href="#" class="scrollup">
   <img src="File/img/arrow-up.png" height="100%" style="opacity:0.6"/>
</a>

</div>
<!-- �α��ǰ / �ֽŻ�ǰ + ��ǰ ��� ���̱� -->
<!-- 
<div id="container">
    <div class="main_tab_fix" style="margin-top:19px;">
        <ul class="tab tab_space">
            <li>
                <a class="on" style="font-size:1.3em" href="#">

                    �α��ǰ

                </a>
            </li>
            <li>
                <a class="" style="font-size:1.3em" href="/#/items/recent">

                    �ֽŻ�ǰ

                </a>
            </li> 
           

             <li><a href="#/todaydeal" class="">�����ǵ�</a></li> 

           
        </ul>
    </div>
    

     ��ǰ ��� 

   
    </div>
 -->
<!-- ��ǰ ���� ���̺�� �ѷ��ֱ� -->

<ul class="productlist" style="width: 1470px;">
<%
// productInfo ������� sellerInfo ������� ����..
// ���� ��� ���̺��� ���...�ФѤ�
for(int i = 0; i<productInfo.size() ; i++){
   
   //��ǰ ����Ʈ ��ü ����
   testDto dto = (testDto)productInfo.get(i);
   //�Ǹ��� ���� ����Ʈ ��ü ����
   testDto dto_seller = (testDto)sellerInfo.get(i);

%>
<


    <li class="item" data-info="{"pid":29988508,"uid":2250167,"cdn":1,"max":1,"current":1,"loaded":1}">
        <div class="flexslider" style="overflow:hidden;">
            <ul class="price_area">
                <li class="lft_price"></li>
                <li class="center_price">

                   <%=dto.getPrice() %>&nbsp;��

                </li>
                <li class="rgt_price"></li>
            </ul>
            <ul class="slides" style="width: 1400%;cursor:pointer;">
                <li style="margin-bottom: 0;margin-left:0px;padding:0;">
                     
                  <a href="productdetail.jsp?num=<%=dto.getProduct_num()%>">
                  <img  width="215" height="215" alt="��ǰ �̹���1"  src="../Mokhwan/upload/<%=dto.getProductImage()%>"  onerror="this.src='File/img/noimage.jpg'"></img></a>
                    
                   
                </li>
            
            </ul>
            <ul class="btn_product_v3 btn_overlay" style="display: none;">
                <li>
                    <a class="item_favorite" href="#">
                        <img width="60" height="24" alt="��" src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_heart_off.png"></img>
                    </a>
                </li>
               
            </ul>
            <ul class="flex-direction-nav btn_overlay" style="display: none;">
                <li>
                    <a class="prev" href="#">

                        Previous

                    </a>
                </li>
                <li>
                    <a class="next" href="#">

                        Next

                    </a>
                </li>
            
           </ul>
        </div>
        <div class="productInfo">
            <p class="productInfo_name" style="">
                <a class="productInfo_link" href="productdetail.jsp?num=<%=dto.getProduct_num()%>">
                <%=dto.getSubject() %>
                </a>
            </p>
            <p>
                <a href="#">
                    <img class="heaertloc" width="12" height="11" alt="��" src="http://www.bunjang.co.kr/quicket/images/common/icon/ico_heart3.gif"></img>
                </a>
                <span>

                    10

                </span>
                <a href="#">
                    <img class="heaertloc" width="12" height="11" alt="���" src="http://www.bunjang.co.kr/quicket/images/common/icon/ico_ballon3.gif"></img>
                </a>
                <span>

                    12

                </span>
                <span style="float:right">
                    <a style="font-size:10px;color:rgb(200,200,200)" href="#">

                        <%=dto.getRegdate() %>

                    </a>
                </span>
            </p>
 
           <!-- 0613 �ּ� �����ֱ� -->
             <p class="productInfo_seller">
                <%-- <img width="16" height="16" alt="" src="<%=dto.getSellerImage() %>"></img> --%>
                    <%=dto.getSellerName() %>���� ����

                </a>
            </p> 
<!-- 0613 �ּ� �����ֱ� -->
            
        </div>
    </li>
    <% } %>
    </ul>
<nav class="navbar navbar-fixed-bottom">
<div class="navbar-inner">
    <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; background: url(/quicket/images/popbg.png)">
        <div style="font-size:15px">���� : akinator@co.kr</div>
        <div style="font-size:12px">��ȭ : 02.123.1234</div>
        <div style="font-size:11px; color:#E0624D; margin-top: 3px">���Ϸ� �����ֽø�, ���� ���� �亯�� ������ �� �ֽ��ϴ�.</div>
    </div>
    <div id="footer" style="font-size: 0.85em; margin: 0 auto;">

        <div style="padding-top: 18px;" align="center">
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