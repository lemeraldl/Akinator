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
         <a href="Index.jsp">Ȩ</a>
         <div>
            <div class="nav-mega-column">
               <!-- <h3>Ȩ</h3> -->
       <!--         <ul>
                  <li><a href="#">�α� ��ǰ</a></li>
                  <li><a href="#">�ֽ� ��ǰ</a></li>
               
               </ul> -->
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
      <li><a href="javascript:tblboard('community')">Ŀ�´�Ƽ</a></li>
      <li class="divider-vertical"></li>
   		<li class="nav-mega-search">
   		
   		
         <form name="searchf" action="Index.jsp">
            <input type="text" placeholder="Search..." name="searchField" value='<%=getParam(request, "searchField")%>'>            
            <button class="btn btn-primary" type="button" onclick="textSearch()">�˻�</button>
         </form>
      </li>
   </ul>
</body>
</html>