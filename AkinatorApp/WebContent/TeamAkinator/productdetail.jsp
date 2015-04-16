 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="main.Replydto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script >
function check(){
	   if(window.event.keyCode == '13'){
	      document.a.submit();
	   }
	}
function home(){
	location.href="/AkinatorApp/TeamAkinator/Index.jsp";
}
//NewSPEED by 동리
function fnSubmit(){    		
	document.follow.action="/AkinatorApp/newspeed.do?command=NEWSPEED";
	document.follow.submit(); 	

}
</script>
<script type="text/javascript" 
    src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    
<script type="text/javascript">
  $(document).ready(function() {
      $('.thumbnail').live("click", function() {
          $('#mainImage').hide();
          $('#imageWrap').css('background-image', "url('ajax-loader.gif')");
          var i = $('<img />').attr('src',this.href).load(function() {
              $('#mainImage').attr('src', i.attr('src'));
              $('#imageWrap').css('background-image', 'none');
              $('#mainImage').fadeIn();
          });
          return false;
      });
      $('#mainImage').width(480);

$('#mainImage').mouseover(function()

{

	$(this).css("cursor", "pointer");

	$(this).animate({
		width : "580px",
		height : "500px"				
	}, 'fast');

});

$('#mainImage').mouseout(function()
{
	$(this).animate({
		width : "480px",
		height : "400px"
	}, 'fast');
});
  });
  
  function mouseover(){
      document.getElementById("follow1").setAttribute('src', '/AkinatorApp/TeamAkinator/File/img/follow_btn2.gif');
   }
   
   function mouseout(){
      document.getElementById("follow1").setAttribute('src', '/AkinatorApp/TeamAkinator/File/img/follow_btn.gif');
   }
   
   function mouseclick(){
      document.getElementById("follow1").setAttribute('src', '/AkinatorApp/TeamAkinator/File/img/follow_btnselect.png');
   }

   function callmouseover(){
      document.getElementById("call").setAttribute('src', '/AkinatorApp/TeamAkinator/File/img/btn_call_on.gif');
   }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="/AkinatorApp/TeamAkinator/productselect.css" /> 
</head>
<body>
<c:set var="dto" value="${requestScope.productdetailviewdto }" ></c:set>

<div id="pop_wrap" xmlns="http://www.w3.org/1999/html">
<div id="pop_header">
<p onclick="home()" style="font-weight:normal;font-size: 30px;">&gt;&gt;&gt;HOME&lt;&lt;&lt;</p><hr/><br/>
<ul>
<br/>
</ul>
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
                <dt><a href="/#/user/652950/products" style="color:#749AAE" data-uid="652950">
                ${requestScope.productdetailviewdto.sellerName} <!-- 아이디 팔사람 -->
                </a></dt>
                <dd>상품수: ${requestScope.productdetail_productcount.productcount} / 팔로워: ${requestScope.productdetail_followcount.followcount}</dd>
                <dd>오픈한지 485일</dd>
            </dl>
        </li>
         <li class="marginT40" style="padding-left:150px">
            <form name=follow method="post">
            	<!-- follow 동리 -->
	             <input type="hidden" name="productnum" value="${requestScope.productdetailviewproductnum}" />    
	           <%--  <a href="/AkinatorApp/newspeed.do?productnum=<%=productnum%>" class="btnFollow" data-target_uid="652950" name="follow" id="follow" onclic="fnSubmit()"> --%>
	                      
	      
  			
  			<a href="javascript:fnSubmit()" class="btnFollow" data-target_uid="652950" name="follow" id="follow" onmouseover="mouseover()" onmouseout="mouseout()" onclick="mouseclick()">
           <input type="hidden" name="productnum" value="${requestScope.productdetailviewdto.product_num}" />
           </form>
  			
            <img class="hover" width="80" height="30" alt="팔로우1" src="/AkinatorApp/TeamAkinator/File/img/follow_btn.gif" id="follow1" ></img></a>
                  <br/>
            <!-- 연락하기 -->
            <a href="#" class="btnContact"><img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_call_off.gif" width="94" height="30" alt="연락하기" class="hover" id="call" onmouseover="callmouseover()" onmouseout="callmouseout()"></a>
            <a href="#" class="onClose" style="top:7px;right:-10px;position:absolute"><img src="http://www.bunjang.co.kr/quicket/images/firstpp/bt/bt_close.png" width="42" height="42" alt="닫기"></a>

            <!-- <a  href="#patentEye" onclick="" onfocus="wdLyr()"><img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_product.gif" width="138" height="30" alt="상점 다른상품" /></a>-->
        </li>

    </ul>
</div>
<!-- <div id="pop_navigate">
    <div id="pop_navi_left" style="position: absolute;left:-80px;top:300px;z-index:1000">
        <a href="#"><img src="http://www.bunjang.co.kr/quicket/images/bt_prev_shot.png" width="46" height="46" alt="제품 이미지" /></a>
    </div>
    <div id="pop_navi_right"  style="position: absolute;width:56px;height:56px;right:-100px;top:300px;z-index:1000">
        <a href="#"><img src="http://www.bunjang.co.kr/quicket/images/bt_next_shot.png" width="46" height="46" alt="제품 이미지" /></a>
    </div>
</div> -->
<div id="pop_container">
<div id="pop_content">
<div class="section30"> 
    <h1 class="pop_productTit">${requestScope.productdetailviewdto.subject}</h1>
    <div class="overflow_h">
        <div class="pop_productInfo">
        <div id="imageWrap"">
            <!-- <div style="position:relative; height:500px; width:500px;"> -->
                	
                	<!-- 상품사진  -->												
                <img id="mainImage" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage}" width="480" height="400" alt="" onerror="this.src='/AkinatorApp/TeamAkinator/File/img/noimage.jpg'">
                

                
            </div>
            <ul>
               
              <li>
                <a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage}" width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a></li>
                <li>
                <a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage1}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage1}" width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a>
                </li>
                
                <li>
                <a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage2}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage2}" width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a>
                </li>
                
                <li>
                <a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage3}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage3}" width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a>
                </li>
                
                <li>
                <a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage4}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage4}"  width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a>
                </li>
                <%-- <li><a href="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage5}" class="thumbnail"><img class="pop_ProductThumb" src="/AkinatorApp/Mokhwan/upload/${requestScope.productdetailviewdto.productImage5}" data-src-big="http://cdn.gscdn.bunjang.co.kr/p0029/835/033/29835033_5_1401269043_w640.jpg" width="80" height="80" alt="" onerror="this.src='File/img/noimage.jpg'"><!-- <li> Tag from template -->
                </img></a></li> --%><li class="last"></li>
            

                <!-- <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_1.jpg" data-image="" width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_2.jpg" data-image="" width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_3.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_4.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_5.jpg" data-image width="80" height="80" alt="" /></a></li>
     <li class="last"><a href="#"><img src="http://cdn.gscdn.bunjang.co.kr/product/29835033_6.jpg" width="80" height="80" alt="" /></a></li>-->
            </ul>
            <div class="pop_productTxt" style="height:300px;overflow-y: scroll">
                
                ${requestScope.productdetailviewdto.productcontents}
            </div>
        </div>
        <div class="pop_productInfo02">
            <ul>
                <li>
                    <dl>
                        <dt class="ico_inquiry">조회수</dt>
                        <dd>${requestScope.productdetailviewdto.countnum}</dd><!-- dto.getcount() -->
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">등록날짜</dt>
                        
                        <dd>${requestScope.productdetailviewdto.regdate}</dd>
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">구입시기${testnum}</dt>
                       
                        <dd> ${requestScope.productdetailviewdto.buydate}</dd>
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">수량</dt>
                        
                        <dd> ${requestScope.productdetailviewdto.quantity}개</dd>
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">물품상태</dt>
                        
                        <dd>${requestScope.productdetailviewdto.useddegree}</dd>
                    </dl>
                </li>
                <li>
                    <dl class="paddingT7">
                        <dt class="ico_day">태그</dt>
                        
                 
                        <dd>       <c:if test="${requestScope.productdetailviewdto.tag != null}">
                        ${requestScope.productdetailviewdto.tag}
              </c:if>
              <c:if test="${requestScope.productdetailviewdto.tag == null}">
               </c:if></dd>
               
                    </dl>
                </li>
                <!-- 체크들 y로 체크해서 맞으면 어떤변수에 가능 저장해서 뿌려주기 -->
               
            </ul>
            <ul class="pop_btnArea"> 
                <li class="pop_price" style="font-family: Helvetica">${requestScope.productdetailviewdto.price} 원</li>
                <li>
                	
                    <a href="/AkinatorApp/TeamAkinator/zzimProc.jsp?num=${requestScope.productdetailviewdto.product_num}&&usernum=${requestScope.productdetailviewusernum}" class="btnFavorite" data-target_pid="29835033">
                    
                    <span>${requestScope.productdetaildto_zzim.zzimnum}</span><!-- zzimnumber -->
                        <img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_steam_off.gif" width="190" height="40" alt="찜" class="hover">
                    </a>
                </li>
                <!--<li><a href="#"><span>12</span><img src="../static/home/images/common/btn/btn_cart_off.gif" width="190" height="40" alt="카트에 넣기" class="hover" /></a></li>-->
             
              <c:if test="${sessionScope.id == null}">
              </c:if>
                 <c:if test="${sessionScope.id !=null }">
               
               <form method="post" action="/AkinatorApp/Payview.action">
                <li>
                	<input  type="hidden" name="productNum" value="${requestScope.productdetailviewdto.product_num}"/>
                	<input type="hidden" name="usernum" value="${requestScope.productdetailviewusernum}"/>
                	<input  type="hidden" name="command" value="PAYVIEW"/>
                   <input type="image" src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_buy_off.gif" alt="구매하기" width="190" height="40" class="hover">
                    
                   
                    <%-- <a href="pay1.jsp?productNum=${requestScope.productdetailviewdto.product_num}&usernum=${requestScope.productdetailviewusernum}" class="btnIpay">
                        <img src="http://www.bunjang.co.kr/quicket/images/common/btn/btn_buy_off.gif" alt="구매하기" width="190" height="40" class="hover">
                    </a> --%>
                    
                    
                </li>
                </form>
              </c:if>
            </ul>
        </div>
    </div>
</div>
<!-- 상품문의 -->  

<form name="a" id="a" action="/AkinatorApp/Productdetail.action" method="post">



<input type="hidden" name="pnum" id="pnum" value="${requestScope.productdetailviewproductnum}"/>
<input type="hidden" name="num" value="${requestScope.productdetailviewproductnum}"/>
<input type="hidden" name="command" value="PRODUCTDETAIL"/>
<div id="pop_comments" class="section30">
    <div class="pop_productqa">
        <div class="pop_titlearea">
            <h1 class="h1_tit fl">상품문의</h1>
            <dl class="pop_qa">
                <dt>문의하기</dt>
                <dd>13개</dd>
            </dl>
        </div>
          <c:if test="${sessionScope.id == null}">
            
        <ul class="pop_qaList">
           </c:if> 
            <c:if test="${sessionScope.id !=null }">
            <li class="pop_qaInput">
                <ul style="display:inline-block;position:relative">
                    <li class="pr">
                        <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
                        <img src="http://www.bunjang.co.kr/quicket/images/person_small.png" width="40" height="40" alt="">
                     <a style="font-size:18px;color: olive;">${sessionScope.id} 님</a>
                    </li>
                    <li class="marginR0" style="border-style:solid;border-width:1px;border-color:#C8C8C8;padding:5px">
                        <textarea id="product_comment" class="pop_commentTextArea" name="textarea" style="overflow: hidden; x: break-word; resize: horizontal; height: 28px;" onkeypress="check()" placeholder="댓글을 입력하세요."></textarea>
                    </li>
                    <li id="wait_comment" style="position:absolute;top:11px;left:180px;display: none;">
                        <img src="http://www.bunjang.co.kr/quicket/images/wait_comment.gif" style="vertical-align: middle;">
                        <span>&nbsp;댓글을 저장중입니다.</span>
                    </li>
                </ul>
            </li>
            
           </c:if> 
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
                  <!--   <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">@답글</span> -->
                </dt>
                <dd>
[공지글] 안전한 거래를 위해 5만원 이상의 물건은 직거래나 안전결제를 통해 구매하시길 권장합니다. 만약의 경우를 위해 판매자의 휴대폰번호는 꼭 알아두시길 바랍니다.
</dd>
</dl>
</li>
</ul>


<!-- 댓글시작 -->

<c:forEach var="dto" begin="0" items="${requestScope.productdetailrepvector}" step="1">
	

<%-- <%
for(int i = 0; i<getReply.size() ; i++){
   Replydto rDto = (Replydto)getReply.get(i);
%> --%>
    <ul>
        <li class="pr">
            <span class="profileImg"><img src="http://www.bunjang.co.kr/quicket/images/popup/bg_qaarea.png" width="40" height="40" alt=""></span>
            <img src="http://image.bunjang.co.kr/profile/1094168_c.jpg" width="40" height="40" alt="">
        </li>
        <li>
            <dl>
                <dt>
                    <a href="/#/user/1094168/products" style="color:#749AAE" data-uid="1094168" class="userinfo">${dto.id}&nbsp;님</a>
                    <span style="font-weight: normal;">&nbsp;&nbsp;&nbsp;${dto.repregdate} 에 입력</span>
                    <!-- <span style="font-weight: normal;color: blue;cursor:pointer;" class="reply">&nbsp;&nbsp;&nbsp;@답글</span> -->
                </dt>
                <dd>
${dto.contents}
</dd>
</dl>
</li>
</ul>
<hr/>
</c:forEach>
<!-- 댓글끝 -->


 </div></li>
            <!-- <li class="pop_commentAll">
                <a href="#">123개 댓글 전체보기</a>
            </li> -->

        </ul>
    </div>
</div>

<!-- //상품문의 -->

</div>
</div>
</div>
</form>
</body>
</html>