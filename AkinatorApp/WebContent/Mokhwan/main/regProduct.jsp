 <%@page import="oracle.sql.ConverterArchive"%>
<%@page import="java.util.Vector"%>
<%@page import="akinator.DataDto"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!
	public String getParam(HttpServletRequest req, String param) throws ServletException, IOException{
		if(req.getParameter(param)!=null){
			req.setCharacterEncoding("euc-kr");
			return req.getParameter(param);
		}
		else
			return "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="../script/jquery-2.1.1.min.js"></script>
<script src="../script/bootstrap.js"></script>
<style type="text/css">
</style>
<style>
#home_outline_body .article {
	width: 800px;
	height: 600px;
	margin-left: 60px;
	margin-top: 30px;
}

#cont {
	width: 500px;
	margin: auto;
}

#cont table {
	width: 100%;
	border: 1px dotted #000;
	text-align: center;
	height: 150px
}

#cont table th {
	font-size: 20px;
	color: gray;
}
</style>
<script>
	var fileIndex = 1;
	window.onload = function() {
		addFileForm();
	};
	function addFileForm() {
		if (this.fileIndex > 1) {
			document.getElementById("multipartFile[" + (this.fileIndex - 1)
					+ "]").style.display = "none";
		}
		var file = document.createElement("input");
		file.type = "file";
		file.id = "multipartFile[" + this.fileIndex + "]";

		file.name = "multipartFile[" + (this.fileIndex++) + "]";

		file.onchange = function() {
			addFileForm();
			drawFileList(file);
		};
		document.getElementById("cont").appendChild(file);

		//readURL(this,fileIndex);
	}
	var cntv = -1;
	function drawFileList(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				$('#imgs' + cntv).attr('src', e.target.result);
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				//(아래 코드에서 읽어들인 dataURL형식)
			}
			reader.readAsDataURL(input.files[0]); 
			cntv++;
		}
	}
	function optChange(obj){
	    var opt = document.getElementById('opt');
	    opt.options.length = 0;
	    if(obj.selectedIndex==0){return;};
	    var oitems = new Array();
	    oitems['digital'] = [['모바일','mobile'],['컴퓨터','computer'],['카메라','camera'],['음향, 음악','music'],['영상','video']];
	    oitems['beauty'] = [['여성의류','wClothes'],['여성잡화','wShoes'],['남성의류','mClothes'],['남성잡화','mShoes'],['뷰티, 화장품','cosmetic']];
	    oitems['sports'] = [['스포츠','sport'],['차량','car'],['게임','game']];
	    oitems['interesting'] = [['도서','book'],['취미','interest'],['티켓','ticket']];
	    oitems['living'] = [['가전제품','appliance'],['생활용품','dailySupplies'],['가구','furniture']];
	    oitems['baby'] = [['식품','food'],['유아, 아동','babySupplies']];
	    oitems['art'] = [['예술, 미술','artSupplies'],['수제','handmade']];
	    var current = oitems[obj.options[obj.selectedIndex].value];
	    opt.options.length = current.length;
	    for(var i=0;i<current.length;i++){
	        opt.options[i].text = current[i][0];
	        opt.options[i].value = current[i][1];
	    }
	}
	function nullCheck(){
		//alert("밸류값은?"+document.upload.goodsName.value);
		
		if(document.upload.goodsname.value==null||document.upload.goodsname.value==""){
			alert("물품이름을 입력하세요!");
			document.upload.goodsname.focus();
			return;
		}
		else if(document.upload.quantity.value==null||document.upload.quantity.value==""){
			alert("물품수량을 입력하세요!");
			document.upload.quantity.focus();
			return;
		}
		else if(document.upload.price.value==null||document.upload.price.value==""){
			alert("물품가격을 입력하세요!");
			document.upload.price.focus();
			return;
		}
		else if(document.upload.productcontents.value==null||document.upload.productcontents.value==""){
			alert("상세설명을 입력하세요!");
			document.upload.productcontents.focus();
			return;
		}
		else if(document.upload.useddegree.value=="물품상태"||document.upload.useddegree.value==""){
			alert("물품 상태를 선택하세요!");
			document.upload.useddegree.focus();
			return;
		}
		else if(document.upload.opt.value=="sbasic"||document.upload.opt.value==""){
			alert("카테고리를 선택하세요!");
			document.upload.bigCategory.focus();
			return;
		}
		else{
			//alert("밸류값은?"+document.upload.opt.value);
			//서블릿으로 접근할때 앞에 /다음오는것은 서버에 저장된 path명과 일치시켜야한다.
			document.upload.action="/AkinatorApp/front.do";
			document.upload.submit();
		}
		
	}
	function home(){
		location.href="/AkinatorApp/TeamAkinator/Index.jsp";
	}
</script>
</head>
<body background="../img/background_gray.jpg">
<form   method="post" name="upload" id="upload" 
		enctype="multipart/form-data">
		<div style="margin-left: 100px">
			<div class="span8">
				<h3 class="">상품 사진 업로드</h3>
				<hr/>
	<img src="" id="imgs0" style="width: 160px; height: 120px;">
	<img src="" id="imgs1" style="width: 160px; height: 120px;">
	<img src="" id="imgs2" style="width: 160px; height: 120px;">
	<img src="" id="imgs3" style="width: 160px; height: 120px;">
	<img src="" id="imgs4" style="width: 160px; height: 120px;">
	<img src="" id="imgs5" style="width: 160px; height: 120px;">
	<div id="fileList"></div>
				
				<div>
					<!-- 사용자 : <input type="text" name="user" /><br />
				<br /> 제목 : <input type="text" name="title" /><br /> -->
<%/*
String check=null;
String sessionId=null;
if((String)session.getAttribute("upCheck")!=null){
	check = (String)session.getAttribute("upCheck");
}
if((String)session.getAttribute("id")!=null){
	sessionId = (String)session.getAttribute("id");
}
DataDto dto = new DataDto();
if(check=="next"){
	Vector v = new Vector();
	v= (Vector)request.getAttribute("data");
	for(int i=0;i<v.size();i++){
		dto = (DataDto)v.get(i);
	}
}
System.out.println("경로값 : " + dto.getDataPath1());
System.out.println("아이디 : " + sessionId);
session.setAttribute("upCheck","null");
*/
%>
<%
//아이디 주기
/*
	String sessionNum=null;
	int realSessionNum=0;
	if(session.getAttribute("usernum")!=null){
		sessionNum = (String)session.getAttribute("usernum");
		//realSessionNum=Integer.parseInt(sessionNum);
	}
	*/
%>
<input type="hidden" name="usernum" value="<%=session.getAttribute("usernum")%>"/>
<input type="hidden" name="id" value="<%=session.getAttribute("id")%>"/>

				<hr/>
				<h5>파일 선택<br/></h5>
				<div id="cont" class="pull-left"></div>
				</div>
			</div>
			<div class="span4">
				<h3 class="">상품 정보</h3>
				<hr />
				<div class="container">
					<div class="span6">
						<div class="row">
							<select name="bigCategory" onchange="optChange(this)">
								<option value="basic">상위카테고리</option>
								<option value="digital">컴퓨터 디지털 가전</option>
								<option value="beauty">패션 잡화 뷰티</option>
								<option value="sports">스포츠 차량 게임</option>
								<option value="interesting">도서 취미 티켓</option>
								<option value="living">생활 가구</option>
								<option value="baby">식품 유아 아동</option>
								<option value="art">예술 수제 기타</option>
							</select><br/>
							<select name="opt" id="opt">
								<option value="sbasic">하위카테고리</option>
							</select>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<select name="useddegree" placeholder="물품상태">
									<option value="">물품상태는?</option>
									<option value="상">상</option>
									<option value="중">중</option>
									<option value="하">하</option>
								</select>
							</div>
						</div>
						
						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="buydate" placeholder="구입일자" />
							</div>
						</div>
						
						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="goodsname" placeholder="상품명 (50자)" />
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="quantity" placeholder="수량" />
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="price" placeholder="가격"/>
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<textarea rows="3" name="productcontents" placeholder="상세설명"></textarea>
							</div>
						</div>

						<div class="row">
							<div class="form-inline">
								<input type="text" name="tag" placeholder="태그"/>
							</div>
						</div>

						<div class="row">
							<div class="form-inline">
								<label class="checkbox"><input type="checkbox"
									name="sepaycheck" value='y'/>안전결제</label> <label class="checkbox"><input
									type="checkbox" name="delipaycheck" value='y'/>택배비포함</label> <label
									class="checkbox"><input type="checkbox" name="tradecheck"
									value='y'/>교환가능</label>
							</div>
						</div>

						<div class="row">
							<input type="button" class="btn btn-info" value="홈으로" onclick="home()"/>
							<input type="button" class="btn btn-info" value="판매등록" onclick="nullCheck()"/> 
							<input type="reset" class="btn btn-info span1" value="취소" />
						</div>

					</div>
				</div>
			</div>
		</div>
	</form>
	</body>
</html>
