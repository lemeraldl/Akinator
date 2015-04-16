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
  <jsp:useBean id="dao" class="main.testDao"/>
    <jsp:useBean id="dto" class="main.testDto"/>
<%
   String searchField = request.getParameter("searchField");
   Vector sellerInfo = dao.getSellerInfo();
   Vector productInfo = dao.getProductInfo(searchField);   
%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Insert title here</title>
<link href="/AkinatorApp/TeamAkinator/File/css/style.css" rel="stylesheet" />
 <link href="/AkinatorApp/TeamAkinator/File/css/quicket-bundle.css" rel="stylesheet" /> 
<link href="/AkinatorApp/TeamAkinator/File/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/AkinatorApp/TeamAkinator/File/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script src="/AkinatorApp/TeamAkinator/File/script/jquery-2.1.1.min.js"></script>
<script src="/AkinatorApp/TeamAkinator/File/script/bootstrap.js"></script>

<script>
      function check(param){
         if(param==("null")||null==param){
            alert("로그인하세요");
            return;
            //document.ch.action="../Mokhwan/main/regProduct.jsp";         
         }
         
         else if(param!=null||null!=param){
            location.href="/AkinatorApp/Mokhwan/main/regProductProc.jsp";
         }
      }
      
      function category(param){
         <%session.setAttribute("category", "checked");%>
         location.href="IndexProc.jsp?cate="+param;
         //location.href="IndexProc.jsp";
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
    	  location.href="/AkinatorApp/Board/List.jsp";
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
<link rel="stylesheet" type="text/css" href="/AkinatorApp/TeamAkinator/pay.css" />
    <script>
        function home(){
      	  location.href="/AkinatorApp/TeamAkinator/Index.jsp";
        }
        </script>
       
   </head>
   
   
<body>
<nav class="navbar navbar-fixed-top"><!-- 상단 메뉴바 속성 지정, 상단메뉴바 고정 -->
 		<jsp:include page="/TeamAkinator/NewFile.jsp" />
   </nav>
<div id="menu-wrapper container" align="center" style="height:40px">
   		<jsp:include page="/TeamAkinator/NewFile1.jsp" />
</div>
<div style="height:50px"></div>
<!-- 본문 -->
 <div id="form-wrapper" class="myform">
            <form id="form" name="form" method="post" action="/AkinatorApp/Pay.action" accept-charset="UTF-8">
 				
 				
 				<input type="hidden" name="usernum"value="${requestScope.usernum}"/>
 				<input type="hidden" name="command"value="PAY"/>
                <h1>상품 안전 구매창</h1>
                <p>Please complete the form bellow.</p>
 
                <label for="Inname">받는 이
                    <span class="small">your name</span>
                </label>
                <input type="text" name="Inname" value="asd" value="asd" id="Inname"  />
 
                <label for="goods">상품 명
                    <span class="small">you want goods?.</span>
                </label>
                
                <input type="text" name="goods" value="${requestScope.payviewdto.subject}" id="goods" />
                
                <label for="amount">수 량
                    <span class="small">선택한 수량</span>
                </label>
                
                <input type="text" name="amount" value="${requestScope.payviewdto.countnum}" id="amount" />
 
 				<label for="money">금 액
                    <span class="small">pay money</span>
                </label>
                
                <input type="text" value="${requestScope.payviewdto.price}" name="price" id="price"/>
 
                <label for="message">Message
                    <span class="small">Write something to us</span>
                </label>
                
                <textarea value="${requestScope.payviewdto.productcontents}" name="message" id="message"  rows="5"></textarea>
                <input type="button" value="홈으로" onclick="home()"/>
 
            	<input type="submit" value="주문하기 "/> 
            <a href="http://ipay.auction.co.kr/orders/IpayOrderInfo.aspx?sellerID=vkdldjqntm&TagNo=7440" target="_blank"><img src="http://pics.auction.co.kr/ipay/2013/web/btn_safePayment_w.gif" border="0"></a>	
            	<a href="http://pics.auction.co.kr/ipay/btn/btn_ipay01.gif">
            	<a href=https://ssl.auction.co.kr/ipay/IpayStdOrder.aspx?cartnos=123456&sellerid=test&price=32500></a>
                
                <div class="spacer"></div>
 
            </form>
            	
        </div>
<!-- 본문 끝 -->
        <div style="height:50px"></div>
<nav class="navbar navbar-fixed-bottom">
<div class="navbar-inner">
    <jsp:include page="/TeamAkinator/NewFile2.jsp" />
    </div>
</nav>
</body>

</html>