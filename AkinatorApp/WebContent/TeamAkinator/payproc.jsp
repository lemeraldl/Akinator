 <%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- payproc.jsp -->
<title>Insert title here</title>
     <jsp:useBean id="paydto" class="main.payDto"/>
      <jsp:useBean id="paydao" class="main.payDao"/>
      
<%
   request.setCharacterEncoding("euc-kr");

String Inname=request.getParameter("Inname");
String   goods=request.getParameter("goods");
int   amount=Integer.parseInt(request.getParameter("amount"));
int price=Integer.parseInt(request.getParameter("price"));

String message=request.getParameter("message");

   paydto.setOrdname(Inname);
   paydto.setOrdaccountnum(goods);
   paydto.setBuynumber(amount);
   paydto.setPrice(price);

   
   int usernum=Integer.parseInt(request.getParameter("usernum"));
   
   
   
   paydao.insertpay(paydto,usernum);   
   //response.sendRedirect("ok.jsp");
%>
 
</head>
<body>
   <script>
   alert("주문을 완료하였습니다. 감사합니다.");
   location.href="/AkinatorApp/TeamAkinator/Index.jsp";
   
</script>
</body>
</html>