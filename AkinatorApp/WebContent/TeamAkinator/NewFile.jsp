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
      <a href="Index.jsp" class="brand" style="margin-left: 1000">Akinator</a><!-- ��� �� �����ʿ� ���� Ȩ -->               
         <form class="navbar-form pull-left" >         
            <input type="text" name="txtSearch" value="" placeholder="�˻�� �Է��ϼ���!" class="search-query"/>         
            <!-- <input type="submit" name="search" value="�˻�" class="btn btn-info"></input> -->         
         </form>         
      
      <!-- ��� �޴���1  -->
      <div class="navbar-inner" id="sidang">   
         <div class="navbar-form pull-right">
            <ul  class="nav">
               <li class="divider-vertical"></li>
            
   
            <li><a href="javascript:check('<%=session.getAttribute("usernum")%>')">�ܻ�ǰ���</a></li>
         
               <!-- <li><a href="../Mokhwan/main/regProduct.jsp" >�ܻ�ǰ���</a></li> -->                  
               
            
               <li class="divider-vertical"></li> <!-- ���м� -->
                <li><a href="http://www.naver.com">������ ã�Ƶ帳�ϴ�</a></li>
                <li class="divider-vertical"></li>
               <li><a href="#">�˸�</a></li>
               <li class="divider-vertical"></li>
               <%if(session.getAttribute("usernum") == null){%>            
               
               <li><a href="Login.jsp">�α���</a></li>
               <li class="divider-vertical"></li>
               <li><a href="regForm.jsp">ȸ������</a></li>
               <li class="divider-vertical"></li>       
              
                     <%}
               else{ %>
               <%String id = (String)session.getAttribute("id");%>    
               
               <li><a href="mypageincludever.jsp"><%=id%>���� mypage</a></li>            
               <li class="divider-vertical"></li>
                  <li><a href="Logout.jsp?logout=bye">�α׾ƿ�</a></li>
                          
               
                  <li class="divider-vertical"></li>
                  <%} %>      
                  
            </ul>      
         </div>
      </div>
   </div>
</body>
</html>