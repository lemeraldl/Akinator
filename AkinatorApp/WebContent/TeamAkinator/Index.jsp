 <%@page import="main.testDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            alert("로그인하세요");
            return;    
         }
         
         else if(param!=null||null!=param){
            location.href="/AkinatorApp/Mokhwan/main/regProductProc.jsp";
         }
      }
      
      function category(param){
         location.href="IndexProc.jsp?cate="+param+"&&category=checked";
      }
  
      // 검색기능
	  function textSearch(){
         if(document.searchf.searchField.value == ""){
            alert("검색어를 입력하세요");
            document.searchf.searchField.focus();
            return;
         }
         document.searchf.submit();
      }
      function tblboard(){
    	  location.href="/AkinatorApp/board.do?command=BOARDMAIN";
      }
      
      function newspeed(){
    	 alert("로그인 후 이용가능합니다");
    	 location.href="/AkinatorApp/TeamAkinator/Login.jsp";
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

   
<nav class="navbar navbar-fixed-top"><!-- 상단 메뉴바 속성 지정, 상단메뉴바 고정 -->
   <div class="navbar-inner">   
      <a href="Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- 상단 맨 오른쪽에 오는 홈 -->               
         <form class="navbar-form pull-left" >         
            <input type="text" name="txtSearch" value="" placeholder="검색어를 입력하세요!" class="search-query"/>         
            <!-- <input type="submit" name="search" value="검색" class="btn btn-info"></input> -->         
         </form>         
      
      <!-- 상단 메뉴바1  -->
      <div class="navbar-inner" id="sidang">   
         <div class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
            
   			<li><a href="../admin/adminLogin.jsp">관리자 접속</a></li>
            <li><a href="javascript:check('<%=session.getAttribute("usernum")%>')">￦상품등록</a></li>
         
               <!-- <li><a href="../Mokhwan/main/regProduct.jsp" >￦상품등록</a></li> -->                  
               
            
               <li class="divider-vertical"></li> <!-- 구분선 -->
                <li><a href="http://www.naver.com">정보를 찾아드립니다</a></li>
                <li class="divider-vertical"></li>
                 <%if(session.getAttribute("usernum") != null){
                 String id = (String)session.getAttribute("id");%>
               <li><a href="/AkinatorApp/Alim/adminArticle.jsp?id=<%=id%>">알림</a></li>
               <li class="divider-vertical"></li>
                <%} %>
                
                <%if(session.getAttribute("usernum") == null){%>            
           <li><a href="/AkinatorApp/loginview.action?command=LOGINVIEW">로그인</a></li>
               <li class="divider-vertical"></li>
<!--                <li><a href="/AkinatorApp/reg.action?command=REGFORM">회원가입</a></li> -->
               <li><a href="/AkinatorApp/TeamAkinator/regForm.jsp">회원가입</a></li>
               <li class="divider-vertical"></li>
                     <%}
               else{ %>
               <%String id = (String)session.getAttribute("id");%>
               <li><a href="/AkinatorApp/reg.action?command=MYPAGE"><%=id%>님의 mypage</a></li>            
               <li class="divider-vertical"></li>
                  <li><a href="/AkinatorApp/TeamAkinator/Logout.jsp?logout=bye">로그아웃</a></li>
                  <li class="divider-vertical"></li>
                  <%} %>
            </ul>      
         </div>
      </div>
   </div>
   </nav>
<div id="menu-wrapper container" align="center" style="height:40px">
   <nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="Index.jsp">홈</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>홈</h3> -->
       			<ul>
                  <li><a href="javascript:category('best')">인기 상품</a></li>
                  <li><a href="Index.jsp">최신 상품</a></li>
               
               </ul>
            </div>
   
      </li>
      <li class="divider-vertical"></li>
      
      <li><a href="#">카테고리</a>
      <div>
            <div class="nav-mega-column">
               <h3>컴퓨터 디지털 가전</h3>
               <ul>
                 <li><a href="javascript:category('mobile')">모바일</a></li>
                  <li><a href="javascript:category('computer')">컴퓨터</a></li>
                  <li><a href="javascript:category('camera')">카메라</a></li>
                  <li><a href="javascript:category('music')">음향.음악</a></li>
                  <li><a href="javascript:category('video')">영상</a></li>
               </ul>
                  
            
               <h3>생활 가구</h3>
                  <ul>
                      <li><a href="javascript:category('appliance')">가전제품</a></li>
                     <li><a href="javascript:category('dailySupplies')">생활용품</a></li>
                     <li><a href="javascript:category('furniture')">가구</a></li>   
                  </ul>
            </div>
               <div class="nav-mega-column">
                  <h3>패션 잡화 뷰티</h3>
                  <ul>
                     <li><a href="javascript:category('wClothes')">여성의류</a></li>   
                     <li><a href="javascript:category('wShoes')">여성잡화</a></li>   
                     <li><a href="javascript:category('mClothes')">남성의류</a></li>   
                     <li><a href="javascript:category('mShoes')">남성잡화</a></li>   
                     <li><a href="javascript:category('cosmetic')">뷰티, 화장품</a></li>   
                  </ul>
               
                  <h3>식품 유아 아동</h3>
                  <ul>
                    <li><a href="javascript:category('food')">식품</a></li>   
                     <li><a href="javascript:category('babySupplies')">유아, 아동</a></li>   
                </ul>
               </div>
               
               <div class="nav-mega-column">
                  <h3>스포츠 차량 게임</h3>
                  <ul>
                      <li><a href="javascript:category('sport')">스포츠</a></li>   
                     <li><a href="javascript:category('car')">차량</a></li>   
                     <li><a href="javascript:category('game')">게임</a></li>     
               
                  </ul>
               
                  <h3>예술 수제 기타</h3>
                  <ul>
                    <li><a href="javascript:category('artSupplies')">예술, 미술</a></li>   
                     <li><a href="javascript:category('handmade')">수제</a></li>   
                  </ul>            
               </div>
               
               <div class="nav-mega-column">
                  <h3>도서 취미 티켓</h3>
                  <ul>
                             <li><a href="javascript:category('book')">도서</a></li>   
                     <li><a href="javascript:category('interest')">취미</a></li>   
                     <li><a href="javascript:category('ticket')">티켓</a></li>      
                  </ul>
               
                  <h3>나눔 커뮤니티</h3>
                  <ul>
                    <li><a href="javascript:category('nanum')">번개나눔</a></li>   
                     <li><a href="javascript:category('community')">커뮤니티</a></li>   
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
                  <li><a href="javascript:category('hit')">인기상점</a></li>
                  
               </ul>
               
      </li>
       <li class="divider-vertical"></li>
      <c:if test="${sessionScope.usernum == dto.usernum}">
      <li><a href="javascript:newspeed()">뉴스피드</a></li>
      </c:if>
      
      <c:if test="${sessionScope.usernum != dto.usernum}">
      <li><a href="/AkinatorApp/newspeed.do?command=GETNEWSPEED">뉴스피드</a></li>
      </c:if>
      
      <li class="divider-vertical"></li>
      <li><a href="/AkinatorApp/board.do?command=BOARDMAIN">커뮤니티</a></li> <!-- 게시판 -->
      <li class="divider-vertical"></li>
   		<li class="nav-mega-search">
   		
   		
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value="">            
            <button class="btn btn-primary" type="button" onclick="textSearch()">검색</button>
         </form>
      </li>
   </ul>

</div>
<!-- 사이드바(위로 가기) -->
<div id="sidebar">
   <a href="#" class="scrollup">
   <img src="File/img/arrow-up.png" height="100%" style="opacity:0.6"/>
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

%>


    <li class="item" data-info="{"pid":29988508,"uid":2250167,"cdn":1,"max":1,"current":1,"loaded":1}">
        <div class="flexslider" style="overflow:hidden;">
            <ul class="price_area">
                <li class="lft_price"></li>
                <li class="center_price">

                   <%=dto.getPrice() %>&nbsp;원

                </li>
                <li class="rgt_price"></li>
            </ul>
            
            <ul class="slides" style="width: 1400%;cursor:pointer;">
                <li style="margin-bottom: 0;margin-left:0px;padding:0;">
                    <!-- <img width="215" height="215" alt="제품 이미지1" src="<%=dto.getProductImage()%>"></img> -->
         		  <form method="post" action="/AkinatorApp/productdetailview.action" id="form" name="form">
	              <input type="hidden" name="num" value="<%=dto.getProduct_num()%>" />
	              <input type="hidden" name="command"value="PRODUCTDETAILVIEW"/>
	              <input type="image" src="/AkinatorApp/Mokhwan/upload/<%=dto.getProductImage()%>" width="215" height="215" alt="제품 이미지1"/>
	              </form>
                   
                </li>
            
            </ul>
            	
            <ul class="btn_product_v3 btn_overlay" style="display: none;">
                <li>
                    <a class="item_favorite" href="#">
                        <img width="60" height="24" alt="찜" src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_heart_off.png"></img>
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
 
           <!-- 0613 주석 열어주기 -->
             <p class="productInfo_seller">
                <%-- <img width="16" height="16" alt="" src="<%=dto.getSellerImage() %>"></img> --%>
                    <%=dto.getSellerName() %>님의 상점

                </a>
            </p> 
<!-- 0613 주석 열어주기 -->
            
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

   
</body>

</html>