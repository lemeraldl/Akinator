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
         alert("휴대전화 번호를 입력하세요");
         $("#phone").focus();      
      }
      else if($("#pass").val() == ""){
         alert("비밀번호를 입력하세요");
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
<h1>관리자 모드</h1>
</div>
<nav class="navbar navbar-fixed-top"><!-- 상단 메뉴바 속성 지정, 상단메뉴바 고정 -->
   
   <div class="navbar-inner">   
      <a href="/AkinatorApp/TeamAkinator/Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- 상단 맨 오른쪽에 오는 홈 -->               
         <div class="navbar-form pull-left" >         
            <!-- <input type="text" name="txtSearch" value="" placeholder="검색어를 입력하세요!" class="search-query"/> -->         
            <!-- <input type="submit" name="search" value="검색" class="btn btn-info"></input>       -->   
         </div>         
      
      <!-- 상단 메뉴바1  -->
      <div class="navbar-inner" id="sidang">   
         <form class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
               <li><a href="#">￦상품등록</a></li>
               <li class="divider-vertical"></li> <!-- 구분선 -->
               <li><a href="http://www.naver.com">정보를 찾아드립니다</a></li>
               <li class="divider-vertical"></li> <!-- 구분선 -->
               <li><a href="#">알림</a></li>
               <li class="divider-vertical"></li>
               <%if(session.getAttribute("usernum") == null){%>
               <li><a href="Login.jsp">로그인</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.jsp">회원가입</a></li>
               <li class="divider-vertical"></li>         
            <%}
            else{ %>
               <li><a href="Logout.jsp">로그아웃</a></li>
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
         <a href="/AkinatorApp/TeamAkinator/Index.jsp">홈</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>홈</h3> -->
            <!--    <ul>
                  <li><a href="#">인기 상품</a></li>
                  <li><a href="#">최신 상품</a></li>
               
               </ul> -->
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
         <li class="nav-mega-search">
         
         
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value='<%=getParam(request, "searchField")%>'>            
            <button class="btn btn-primary" type="button" onclick="textSearch()">검색</button>
         </form>
      
   
   </ul>

</div>
</nav>   

<!-- 로그인 -->

<form class="form-horizontal" action="/AkinatorApp/admin.do" method="post" name="f" id="login">
   <input type="hidden" name="COMMAND" value="LOGIN" />
 <div style="position:absolute; left: 300px; top: 300px;">
   <div class= "control-group">   
           <div class= "controls">
               <input type= "text" name ="phone" id="phone" placeholder="폰번호" maxlength="11" size="7" class="input-medium"/>
             </div>
     </div>
    

    <div>
       <div class= "control-group">
           <label class= "control-label"></label>
              <div class= "controls">
                  <input type= "password" name ="pass" id="pass" placeholder="패스워드"  size="3"class="input-medium span2">
                  <span class="add-on"><a href="" class="icon-search" title="비밀번호를 잊어 버리셨나요?" 
                     data-toggle="tooltip" id="theTooltip" data-placement="right" data-animation="false"></a></span>
               </div>
      </div>
   </div>
       <div class= "controls">                    
            <input type="button" value="로그인" onclick="fnLogin()" id="btn_login"/>                                  
        </div>      
   
   </form>
   
      
      



<!-- 꼬릿말 -->
<nav class="navbar navbar-fixed-bottom">
<div class="navbar-inner">
    <div id="foot_pop" style="display: none; color:#555555; position:fixed; width: 162px; height: 87px; padding: 10px; font-size: 12px; z-index: 5001; bottom:33px; background: url(/quicket/images/popbg.png)">
        <div style="font-size:15px">메일 : akinator@co.kr</div>
        <div style="font-size:12px">전화 : 02.123.1234</div>
        <div style="font-size:11px; color:#E0624D; margin-top: 3px">메일로 연락주시면, 보다 빠른 답변을 받으실 수 있습니다.</div>
    </div>
    <div id="footer" style="font-size: 0.85em; margin: 0 auto;">

        <div style="padding-top: 18px;">
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