<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
            
   
            <li><a href="javascript:check('<%=session.getAttribute("usernum")%>')">￦상품등록</a></li>
         
               <!-- <li><a href="../Mokhwan/main/regProduct.jsp" >￦상품등록</a></li> -->                  
               
            
               <li class="divider-vertical"></li> <!-- 구분선 -->
                <li><a href="http://www.naver.com">정보를 찾아드립니다</a></li>
                <li class="divider-vertical"></li>
               <li><a href="#">알림</a></li>
               <li class="divider-vertical"></li>
               <%if(session.getAttribute("usernum") == null){%>            
               
               <li><a href="Login.jsp">로그인</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.jsp">회원가입</a></li>
               <li class="divider-vertical"></li>       
              
                     <%}
               else{ %>
               <%String id = (String)session.getAttribute("id");%>    
               
               <li><a href="mypageincludever.jsp"><%=id%>님의 mypage</a></li>            
               <li class="divider-vertical"></li>
                  <li><a href="Logout.jsp?logout=bye">로그아웃</a></li>
                          
               
                  <li class="divider-vertical"></li>
                  <%} %>      
                  
            </ul>      
         </div>
      </div>
   </div>
</body>
</html>