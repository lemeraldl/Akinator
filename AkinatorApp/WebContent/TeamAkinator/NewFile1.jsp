<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
<nav class="navbar navbar-inner navbar-fixed-top" style="height:40px;margin-top:40px">
   <ul class="nav-mega">
      <li>
         <a href="Index.jsp">홈</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>홈</h3> -->
       <!--         <ul>
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
      <li><a href="#">모바일</a></li>
      <li class="divider-vertical"></li>
      <li><a href="javascript:tblboard('community')">커뮤니티</a></li>
      <li class="divider-vertical"></li>
   		<li class="nav-mega-search">
   		
   		
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value='<%=getParam(request, "searchField")%>'>            
            <button class="btn btn-primary" type="button" onclick="textSearch()">검색</button>
         </form>
      </li>
   </ul>
</body>
</html>