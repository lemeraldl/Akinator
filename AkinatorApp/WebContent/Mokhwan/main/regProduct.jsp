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
			var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
			reader.onload = function(e) {
				//���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
				$('#imgs' + cntv).attr('src', e.target.result);
				//�̹��� Tag�� SRC�Ӽ��� �о���� File������ ����
				//(�Ʒ� �ڵ忡�� �о���� dataURL����)
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
	    oitems['digital'] = [['�����','mobile'],['��ǻ��','computer'],['ī�޶�','camera'],['����, ����','music'],['����','video']];
	    oitems['beauty'] = [['�����Ƿ�','wClothes'],['������ȭ','wShoes'],['�����Ƿ�','mClothes'],['������ȭ','mShoes'],['��Ƽ, ȭ��ǰ','cosmetic']];
	    oitems['sports'] = [['������','sport'],['����','car'],['����','game']];
	    oitems['interesting'] = [['����','book'],['���','interest'],['Ƽ��','ticket']];
	    oitems['living'] = [['������ǰ','appliance'],['��Ȱ��ǰ','dailySupplies'],['����','furniture']];
	    oitems['baby'] = [['��ǰ','food'],['����, �Ƶ�','babySupplies']];
	    oitems['art'] = [['����, �̼�','artSupplies'],['����','handmade']];
	    var current = oitems[obj.options[obj.selectedIndex].value];
	    opt.options.length = current.length;
	    for(var i=0;i<current.length;i++){
	        opt.options[i].text = current[i][0];
	        opt.options[i].value = current[i][1];
	    }
	}
	function nullCheck(){
		//alert("�������?"+document.upload.goodsName.value);
		
		if(document.upload.goodsname.value==null||document.upload.goodsname.value==""){
			alert("��ǰ�̸��� �Է��ϼ���!");
			document.upload.goodsname.focus();
			return;
		}
		else if(document.upload.quantity.value==null||document.upload.quantity.value==""){
			alert("��ǰ������ �Է��ϼ���!");
			document.upload.quantity.focus();
			return;
		}
		else if(document.upload.price.value==null||document.upload.price.value==""){
			alert("��ǰ������ �Է��ϼ���!");
			document.upload.price.focus();
			return;
		}
		else if(document.upload.productcontents.value==null||document.upload.productcontents.value==""){
			alert("�󼼼����� �Է��ϼ���!");
			document.upload.productcontents.focus();
			return;
		}
		else if(document.upload.useddegree.value=="��ǰ����"||document.upload.useddegree.value==""){
			alert("��ǰ ���¸� �����ϼ���!");
			document.upload.useddegree.focus();
			return;
		}
		else if(document.upload.opt.value=="sbasic"||document.upload.opt.value==""){
			alert("ī�װ��� �����ϼ���!");
			document.upload.bigCategory.focus();
			return;
		}
		else{
			//alert("�������?"+document.upload.opt.value);
			//�������� �����Ҷ� �տ� /�������°��� ������ ����� path��� ��ġ���Ѿ��Ѵ�.
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
				<h3 class="">��ǰ ���� ���ε�</h3>
				<hr/>
	<img src="" id="imgs0" style="width: 160px; height: 120px;">
	<img src="" id="imgs1" style="width: 160px; height: 120px;">
	<img src="" id="imgs2" style="width: 160px; height: 120px;">
	<img src="" id="imgs3" style="width: 160px; height: 120px;">
	<img src="" id="imgs4" style="width: 160px; height: 120px;">
	<img src="" id="imgs5" style="width: 160px; height: 120px;">
	<div id="fileList"></div>
				
				<div>
					<!-- ����� : <input type="text" name="user" /><br />
				<br /> ���� : <input type="text" name="title" /><br /> -->
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
System.out.println("��ΰ� : " + dto.getDataPath1());
System.out.println("���̵� : " + sessionId);
session.setAttribute("upCheck","null");
*/
%>
<%
//���̵� �ֱ�
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
				<h5>���� ����<br/></h5>
				<div id="cont" class="pull-left"></div>
				</div>
			</div>
			<div class="span4">
				<h3 class="">��ǰ ����</h3>
				<hr />
				<div class="container">
					<div class="span6">
						<div class="row">
							<select name="bigCategory" onchange="optChange(this)">
								<option value="basic">����ī�װ�</option>
								<option value="digital">��ǻ�� ������ ����</option>
								<option value="beauty">�м� ��ȭ ��Ƽ</option>
								<option value="sports">������ ���� ����</option>
								<option value="interesting">���� ��� Ƽ��</option>
								<option value="living">��Ȱ ����</option>
								<option value="baby">��ǰ ���� �Ƶ�</option>
								<option value="art">���� ���� ��Ÿ</option>
							</select><br/>
							<select name="opt" id="opt">
								<option value="sbasic">����ī�װ�</option>
							</select>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<select name="useddegree" placeholder="��ǰ����">
									<option value="">��ǰ���´�?</option>
									<option value="��">��</option>
									<option value="��">��</option>
									<option value="��">��</option>
								</select>
							</div>
						</div>
						
						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="buydate" placeholder="��������" />
							</div>
						</div>
						
						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="goodsname" placeholder="��ǰ�� (50��)" />
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="quantity" placeholder="����" />
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<input type="text" name="price" placeholder="����"/>
							</div>
						</div>

						<div class="row">
							<div class="form-horizontal">
								<textarea rows="3" name="productcontents" placeholder="�󼼼���"></textarea>
							</div>
						</div>

						<div class="row">
							<div class="form-inline">
								<input type="text" name="tag" placeholder="�±�"/>
							</div>
						</div>

						<div class="row">
							<div class="form-inline">
								<label class="checkbox"><input type="checkbox"
									name="sepaycheck" value='y'/>��������</label> <label class="checkbox"><input
									type="checkbox" name="delipaycheck" value='y'/>�ù������</label> <label
									class="checkbox"><input type="checkbox" name="tradecheck"
									value='y'/>��ȯ����</label>
							</div>
						</div>

						<div class="row">
							<input type="button" class="btn btn-info" value="Ȩ����" onclick="home()"/>
							<input type="button" class="btn btn-info" value="�Ǹŵ��" onclick="nullCheck()"/> 
							<input type="reset" class="btn btn-info span1" value="���" />
						</div>

					</div>
				</div>
			</div>
		</div>
	</form>
	</body>
</html>
