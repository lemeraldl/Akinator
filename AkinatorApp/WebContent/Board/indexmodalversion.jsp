 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<jsp:useBean id="dto1" class="main.testDto"/>
<jsp:useBean id="dat" class="main.testDao"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title> 
<!-- <link rel="stylesheet" type="text/css" href="productselect.css" />-->
<link href="File/css/style.css" rel="stylesheet" />
 <link href="File/css/quicket-bundle.css" rel="stylesheet" /> 
<link href="File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="File/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="File/script/jquery-2.1.1.min.js"></script>
<script src="File/script/bootstrap.js"></script>
<style>
div#pop_wrap{
   
   background-color: white
   margin: 0 auto; 
}
.btnContact{
   position: absolute;
   top: 5%;
   left: 30%;

}
.btnFollow{
   position: absolute;
   top:5%;
   left:50%;
}


</style>
<script>
// overflow modal 바디랑 header쪽 스타일로 접근해서  적용해주면 된다 

      <% String param = (String)session.getAttribute("id"); %>   
   var s=1;
      function check(param){
      if(param == ("null") || null == param){
         alert("로그인하세요");
         return;
         //document.ch.action="../Mokhwan/main/regProduct.jsp";         
      }
      else if(param!=null || null != param){
         location.href="../Mokhwan/main/regProduct.jsp";
      }
      
   } 

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
<body class="modal-enabled">
<jsp:useBean id="dao" class="main.testDao" />
<%
   Vector sellerInfo = dao.getSellerInfo(); // 이것을 써야한다 
   Vector productInfo = dao.getSellerInfo();
   
System.out.println("아무거나"+productInfo.size());
   
%>

<nav class="navbar navbar-fixed-top"><!-- 상단 메뉴바 속성 지정, 상단메뉴바 고정 -->
   
   <div class="navbar-inner">   
      <a href="" class="brand" style="margin-left: 1000">Akinator</a><!-- 상단 맨 오른쪽에 오는 홈 -->               
         <form class="navbar-form pull-left" >         
            <input type="text" name="txtSearch" value="" placeholder="검색어를 입력하세요!" class="search-query"/>         
            <!-- <input type="submit" name="search" value="검색" class="btn btn-info"></input> -->         
         </form>         
      
      <!-- 상단 메뉴바1  -->
      <div class="navbar-inner" id="sidang">   
         <div class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
            
   
            <!-- <li><a href="javascript:check('<%=session.getAttribute("1")%>')">￦상품등록</a></li> -->
            <a href="../Mokhwan/main/regProduct.jsp">아아</a>
         
               <!-- <li><a href="../Mokhwan/main/regProduct.jsp" >￦상품등록</a></li> -->                  
               
            
               <li class="divider-vertical"></li> <!-- 구분선 -->
               <li><a href="#">알림</a></li>
               <li class="divider-vertical"></li>
               <%if(session.getAttribute("id") == null){%>            
               <li><a href="Login.jsp">로그인</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.html">회원가입</a></li>
               <li class="divider-vertical"></li>         
                     <%}
            else{ %>
               <li><a href="Logout.jsp?logout=bye">로그아웃</a></li>
               <li class="divider-vertical"></li>
               <%} %>      
                  
            </ul>      
         </div>
      </div>
   </div>
   </nav>
   
<div id="menu-wrapper container-fluid" align="center" style="height:40px">
   <nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="#">홈</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>홈</h3> -->
               <ul>
                  <li><a href="#">인기 상품</a></li>
                  <li><a href="#">최신 상품</a></li>
               
               </ul>
            </div>
   
      </li>
      <li class="divider-vertical"></li>
      
      <li><a href="#">카테고리</a>
      <div>
            <div class="nav-mega-column">
               <h3>컴퓨터 디지털 가전</h3>
               <ul>
                  <li><a href="#">모바일</a></li>
                  <li><a href="#">컴퓨터</a></li>
                  <li><a href="#">카메라</a></li>
                  <li><a href="#">음향.음악</a></li>
                  <li><a href="#">영상</a></li>
               </ul>
                  
            
               <h3>생활 가구</h3>
                  <ul>
                     <li><a href="#">가전제품</a></li>
                     <li><a href="#">생활용품</a></li>
                     <li><a href="#">가구</a></li>   
                  </ul>
            </div>
               <div class="nav-mega-column">
                  <h3>패션 잡화 뷰티</h3>
                  <ul>
                     <li><a href="#">여성의류</a></li>   
                     <li><a href="#">여성잡화</a></li>   
                     <li><a href="#">남성의류</a></li>   
                     <li><a href="#">남성잡화</a></li>   
                     <li><a href="#">뷰티, 화장품</a></li>   
                  </ul>
               
                  <h3>식품 유아 아동</h3>
                  <ul>
                     <li><a href="#">식품</a></li>   
                     <li><a href="#">유아, 아동</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>스포츠 차량 게임</h3>
                  <ul>
                     <li><a href="#">스포츠</a></li>   
                     <li><a href="#">차량</a></li>   
                     <li><a href="#">게임</a></li>   
               
                  </ul>
               
                  <h3>예술 수제 기타</h3>
                  <ul>
                     <li><a href="#">예술, 미술</a></li>   
                     <li><a href="#">수제</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>도서 취미 티켓</h3>
                  <ul>
                     <li><a href="#">도서</a></li>   
                     <li><a href="#">취미</a></li>   
                     <li><a href="#">티켓</a></li>   
                  </ul>
               
                  <h3>나눔 커뮤니티<h3>
                  <ul>
                     <li><a href="#">번개나눔</a></li>   
                     <li><a href="#">커뮤니티</a></li>   
                  </ul>
               
               </div>
            </li>
         
      
      <li class="divider-vertical"></li>
      <li>
         <a href="#">상점</a>
         <div>
            <div class="nav-mega-column">
               <h3 class="orange">Related Categories</h3>
               <ul>
                  <li><a href="#">인기상점</a></li>
                  
               </ul>
               
      </li>
       <li class="divider-vertical"></li>
      <li><a href="#">모바일</a></li>
      <li class="divider-vertical"></li>
      <li><a href="#">커뮤니티</a></li>
      <li class="divider-vertical"></li>
   
   </ul>

</div>
<!-- 사이드바(위로 가기) -->
<div id="sidebar">
   <a href="#" class="scrollup">
   <img src="../img/arrow-up.png" height="100%" style="opacity:0.6">
</a>

</div>
<!-- 인기상품 / 최신상품 + 상품 목록 보이기 -->
<!-- 
<div id="container">
    <div class="main_tab_fix" style="margin-top:19px;">
        <ul class="tab tab_space">
            <li>
                <a class="on" style="font-size:1.3em" href="#">

                    인기상품

                </a>
            </li>
            <li>
                <a class="" style="font-size:1.3em" href="/#/items/recent">

                    최신상품

                </a>
            </li>
           

             <li><a href="#/todaydeal" class="">오늘의딜</a></li> 

           
        </ul>
    </div>
    

     제품 목록 

   
    </div>
 -->
<!-- 상품 사진 테이블로 뿌려주기 -->

<ul class="productlist" style="width: 1470px;">
<%

// productInfo 사이즈와 sellerInfo 사이즈는 같음..
// 실제 사용 테이블에선 어떨지...ㅠㅡㅠ
for(int i = 0; i<productInfo.size() ; i++){
   
   //상품 리스트 객체 생성
   testDto dto = (testDto)productInfo.get(i);
   //판매자 정보 리스트 객체 생성
   testDto dto_seller = (testDto)sellerInfo.get(i);
//dto_seller 이것을 써야한다 

%>


    <li class="item" data-info="{"pid":29988508,"uid":2250167,"cdn":1,"max":1,"current":1,"loaded":1}">
        <div class="flexslider" style="overflow:hidden;">
            <ul class="price_area">
                <li class="lft_price"></li>
                <li class="center_price">

                   <%=dto.getPrice() %>

                </li>
                <li class="rgt_price"></li>
            </ul>
            <ul class="slides" style="width: 1400%;cursor:pointer;">
                <li style="margin-bottom: 0;margin-left:0px;padding:0;">
                     <!-- <img width="215" height="215" alt="제품 이미지1" src="<%=dto.getProductImage()%>"></img> -->
                     
                  <a href="#" data-toggle="modal" data-target=".product<%=dto.getProduct_num()%>"><img  width="215" height="215" alt="제품 이미지1"  src="../Mokhwan/upload/<%=dto.getProductImage()%>"></img></a>
                   <%System.out.println("이미지 경로다" + dto.getProductImage()); %>
                   <!-- <img width="215" height="215" alt="제품 이미지1" src="D:\dongli\HTA\Bootstrap\AkinatorApp\WebContent\Mokhwan\upload\Chrysanthemum.jpg"/> -->
                 
                   <!-- <img src="../Mokhwan/upload/Chrysanthemum.jpg" />-->
                   
                </li>
                <!--

                 <li><a href="#"><img src="static/home/images/foll…

                -->
            </ul>
            <ul class="btn_product_v3 btn_overlay" style="display: none;">
                <li>
                    <a class="item_favorite" href="#">
                        <img width="60" height="24" alt="찜" src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_heart_off.png"></img>
                    </a>
                </li>
                <!--

                 <li><a href="#"><img src="http://www.bunjang.co.k…

                -->
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
                <a class="productInfo_link" href="/#/items/29988508">
                <%=dto.getSubject() %>
                </a>
            </p>
            <p>
                <a href="#">
                    <img class="heaertloc" width="12" height="11" alt="찜" src="http://www.bunjang.co.kr/quicket/images/common/icon/ico_heart3.gif"></img>
                </a>
                <span>

                    10

                </span>
                <a href="#">
                    <img class="heaertloc" width="12" height="11" alt="댓글" src="http://www.bunjang.co.kr/quicket/images/common/icon/ico_ballon3.gif"></img>
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
            <p class="productInfo_seller">
                <img width="16" height="16" alt="" src="<%=dto_seller.getSellerImage() %>"></img>
                <a style="color:#749AAE" href="/#/user/2250167/products">

                    <%=dto_seller.getSellerName() %>

                </a>
            </p>
        </div>
    </li>
    <% } %>
    </ul>

    




<nav class="navbar navbar-fixed-bottom">
<div class="navbar-inner">
    <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; background: url(/quicket/images/popbg.png)">
        <div style="font-size:15px">메일 : akinator@co.kr</div>
        <div style="font-size:12px">전화 : 02.123.1234</div>
        <div style="font-size:11px; color:#E0624D; margin-top: 3px">메일로 연락주시면, 보다 빠른 답변을 받으실 수 있습니다.</div>
    </div>
    <div id="footer" style="font-size: 0.85em; margin: 0 auto;">

        <div style="padding-top: 18px;" align="center">
            <span style="margin-left: 5px;"><img style="margin-top: -15px;" src=""/></span>
            <span style="margin-left: 5px;">Akinator#  </span>
            <span style="margin-left: 5px;">사업자등록: 369-3699-369</span>
            <span style="margin-left: 5px;">서울시 종로구 봉익동 10-1 디아망4층</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 15px;">
                <a href="javascript:;" id="aaa" onclick="javascript: $('#foot_pop').css('left',this.offsetLeft - 67); $('#foot_pop').toggle(); " target="_blank">고객센터</a>
            </span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;">|</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;"><a href="http://bunjang.co.kr/m/terms/" target="_blank">이용약관/개인정보취급방침</a></span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;">|</span>
            <span style="color: #888; font-size: 1.1em; text-decoration: none; margin-left: 3px;"><a href="/marketing" target="_blank">광고센터</a></span>
        </div>
    </div>
    </div>
</nav>
   
<%
   for(int i=0; i<productInfo.size(); i++){
      testDto dto = (testDto)productInfo.get(i);
%>

<div class="modal fade product<%=dto.getProduct_num() %>" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<div id="pop_wrap" xmlns="http://www.w3.org/1999/html">
<div id="pop_header">
    <ul>
        <li class="pr">
            <a href="/#/user/652950/products" class="userinfo">
                <span class="profileImg">
                    <img src="http://www.bunjang.co.kr/quicket/images/popup/bg_stroeinfoArea.png" width="69" height="69" alt="">
                </span>
            </a>
            <!-- <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_stroeinfoArea.png" width="69" height="69" alt="" /></span> -->

            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="69" height="69" alt="">
        </li>
        <li>
            <dl class="storeinfo">
                <dt><a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950"><%=dto.getSellerName() %></a></dt>
                <dd>상품수: 46 / 팔로워: 2120</dd>
                <dd>오픈한지 485일</dd>
            </dl>
        </li>
        <li class="marginT40" style="padding-left:150px">
            <!-- <a href="#" class="btnFollow"><img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_follow02_off.gif" width="80" height="30" alt="팔로우" class="hover" /></a> -->
            <a href="#" class="btnFollow" data-target_uid="652950">
                <img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_follow02_off.gif" width="80" height="30" alt="팔로우" class="hover">
            </a>
            <a href="#" class="btnContact"><img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_call_off.gif" width="94" height="30" alt="연락하기" class="hover"></a>
            
            <!-- <a  href="#patentEye" onclick="" onfocus="wdLyr()"><img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_product.gif" width="138" height="30" alt="상점 다른상품" /></a>-->
        </li>

    </ul>
</div>
</div>
      <div class="modal-body">
      <div id="pop_container">
<div id="pop_content">
<div class="section30">
    <h1 class="pop_productTit"><%=dto.getSubject()%></h1>
    <div class="overflow_h">
        <div class="pop_productInfo">
            <div style="position:relative; height:500px; width:500px;">
                
                <img id="pop_productImage" src="../Mokhwan/upload/<%=dto.getProductImage() %>" width="500" height="500" alt="">
                

                
            </div>
            <ul>
            
                <li>
                <img class="pop_ProductThumb" src="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_1_1401269043_w152.jpg" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_1_1401269043_w640.jpg" width="80" height="80" alt=""><!-- <li> Tag from template -->
                </li><li>
                <img class="pop_ProductThumb" src="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_2_1401269043_w152.jpg" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_2_1401269043_w640.jpg" width="80" height="80" alt=""><!-- <li> Tag from template -->
                </li><li>
                <img class="pop_ProductThumb" src="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_3_1401269043_w152.jpg" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_3_1401269043_w640.jpg" width="80" height="80" alt=""><!-- <li> Tag from template -->
                </li><li>
                <img class="pop_ProductThumb" src="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_4_1401269043_w152.jpg" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_4_1401269043_w640.jpg" width="80" height="80" alt=""><!-- <li> Tag from template -->
                </li><li class="last">
                <img class="pop_ProductThumb" src="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_5_1401269043_w152.jpg" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_5_1401269043_w640.jpg" width="80" height="80" alt=""><!-- <li> Tag from template -->
                </li>
            

                <!-- <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_1.jpg" data-image="" width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_2.jpg" data-image="" width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_3.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_4.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_5.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li class="last"><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_6.jpg" width="80" height="80" alt="" /></a></li>-->
            </ul>
            <div class="pop_productTxt" style="height:300px;overflow-y: scroll">
                <%=dto.getSubject() %>
            </div>
        </div>
        <div class="pop_productInfo02">
            <ul>
                <li>
                    <dl>
                        <dt class="ico_inquiry">조회수</dt>
                        <dd></dd><!-- dto.getcount() -->
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">등록날짜</dt>
                        <dd><%=dto.getRegdate() %></dd>
                    </dl>
                </li>
                <li>
                    <h2 class="pop_h2Tit ico_region">거래지역</h2>
                    <div class="pop_regionTxt">
                        위치정보 없음
                    </div>
                </li>
                <li>
                    <h2 class="pop_h2Tit ico_tag">태그</h2>
                    <ul class="pop_tagarea">
                        <li>240</li><li>235</li><li>나이키</li>
                        <!-- <li>240,235,나이키</li>
                        <li>태그1</li>
                        <li>태그1</li>
                        <li>태그1</li> -->
                    </ul>
                </li>
            </ul>
            <ul class="pop_btnArea">
                <li class="pop_price" style="font-family: Helvetica">₩<%=dto.getPrice()%></li>
                <li>
                    <a href="#" class="btnFavorite" data-target_pid="29835033"><span>21</span><!-- zzimnumber -->
                        <img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_steam_off.gif" width="190" height="40" alt="찜" class="hover">
                    </a>
                </li>
                <!--<li><a href="#"><span>12</span><img src="../static/home/images/common/btn/btn_cart_off.gif" width="190" height="40" alt="카트에 넣기" class="hover" /></a></li>-->
                <li>
                    <a href="#" class="btnIpay">
                        <img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_buy_off.gif" alt="구매하기" width="190" height="40" class="hover">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 상품문의 -->
<form name="a" id="a" action="productdetail_proc.jsp">
<input type="hidden" name="product_num" value="<%= dto.getProduct_num()%>">
<div id="pop_comments" class="section30">
    <div class="pop_productqa">
        <div class="pop_titlearea">
            <h1 class="h1_tit fl">상품문의</h1>
            <dl class="pop_qa">
                <dt>문의하기</dt>
                <dd>13개</dd>
            </dl>
        </div>
        
        <ul class="pop_qaList">
            
            <li class="pop_qaInput">
                <ul style="display:inline-block;position:relative">
                    <li class="pr">
                        <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
                        <img src="http://www.bunjang.co.kr/quicket/images/person_small.png" width="40" height="40" alt="">
                    </li>
                    <li class="marginR0" style="border-style:solid;border-width:1px;border-color:#C8C8C8;padding:5px">
                        <textarea id="product_comment" class="pop_commentTextArea" name="textara" style="overflow: hidden; x: break-word; resize: horizontal; height: 28px;" onkeypress="check()"></textarea>
                    </li>
                    <li id="wait_comment" style="position:absolute;top:11px;left:180px;display: none;">
                        <img src="http://www.bunjang.co.kr/quicket/images/wait_comment.gif" style="vertical-align: middle;">
                        <span>&nbsp;댓글을 저장중입니다.</span>
                    </li>
                </ul>
            </li>
            
          
            <li class="pop_qaComments">
                <!-- from qaComments -->
            <div>


    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1/products" style="color:#749AAE" data-uid="1" class="userinfo">번장알림센터</a>
                    <span style="font-weight: normal;">방금</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
[공지글] 1) 안전한 거래를 위해 5만원 이상의 물건은 직거래나 안전결제를 통해 구매하시길 권장합니다. 만약의 경우를 위해 판매자의 휴대폰번호는 꼭 알아두시길 바랍니다. 2) 판매 금지 물품: www.bunjang.co.kr/policy
</dd>
</dl>
</li>
</ul>


<!-- 여기서 부터 돌아가면서 뿌려줘야한다  -->

    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1094168_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1094168/products" style="color:#749AAE" data-uid="1094168" class="userinfo">XE</a>
                    <span style="font-weight: normal;">5 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
@XE : 허라취터프라고도불리죠
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1094168_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1094168/products" style="color:#749AAE" data-uid="1094168" class="userinfo">XE</a>
                    <span style="font-weight: normal;">6 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
허라취 테크네요 보통9만원이면삽니다
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950" class="userinfo">밍밍zz</a>
                    <span style="font-weight: normal;">8 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
@yoon1818 : ㅋㅋㅋ오키!
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950" class="userinfo">밍밍zz</a>
                    <span style="font-weight: normal;">8 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
글고 글안보ㅇ1나 님들ㅋㅋㅋㅇ난독증단체손님.코스프레?ㅋ
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/692353_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/692353/products" style="color:#749AAE" data-uid="692353" class="userinfo">yoon1818</a>
                    <span style="font-weight: normal;">8 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ화이팅!
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950" class="userinfo">밍밍zz</a>
                    <span style="font-weight: normal;">9 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
위 댓글처럼 정보달란사람들 다 차단할거임
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://www.bunjang.co.kr/quicket/images/person_small.png" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/961001/products" style="color:#749AAE" data-uid="961001" class="userinfo">빵슨</a>
                    <span style="font-weight: normal;">17 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
신발이름이ㅠㅠ
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950" class="userinfo">밍밍zz</a>
                    <span style="font-weight: normal;">30 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
@윤윙크 : 아녀ㅋ~
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1747780_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1747780/products" style="color:#749AAE" data-uid="1747780" class="userinfo">윤윙크</a>
                    <span style="font-weight: normal;">31 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
정보알려주실수있으세요ㅠㅠㅠ?
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/652950_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950" class="userinfo">밍밍zz</a>
                    <span style="font-weight: normal;">33 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
다들 글이.안보이시나봐요.ㅋㅋ댓글로 이러시는거.보면ㅋ
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1567631_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1567631/products" style="color:#749AAE" data-uid="1567631" class="userinfo">다있오요</a>
                    <span style="font-weight: normal;">37 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
워 이쁜데...남자245신는대..작을라나요
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/692353_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/692353/products" style="color:#749AAE" data-uid="692353" class="userinfo">yoon1818</a>
                    <span style="font-weight: normal;">53 분</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
사용기간이
</dd>
</dl>
</li>
</ul>



    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1083828_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1083828/products" style="color:#749AAE" data-uid="1083828" class="userinfo">쮸쀼쮸쀼2</a>
                    <span style="font-weight: normal;">1 시간</span>
                    <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span>
                </dt>
                <dd>
제품명이 뭔가요?
</dd>
</dl>
</li>
</ul>



</div></li>
            <!-- <li class="pop_commentAll">
                <a href="#">123개 댓글 전체보기</a>
            </li> -->

        </ul>
    </div>
</div>
</from>
<!-- //상품문의 -->

</div>
</div>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>   
</div>
<%} %>
   
</body>

</html>