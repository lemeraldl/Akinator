<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String check=null;
	
	if(request.getParameter("category")!=null){
		check = request.getParameter("category");
		System.out.println(check);
	}
	
	if(request.getParameter("cate")!=null){
		String value=request.getParameter("cate");
		session.setAttribute("value", value);
		
	if(session.getAttribute("value")=="best"||session.getAttribute("value").equals("best")){
		%>
		<script>
			location.href="/AkinatorApp/TeamAkinator/Index.jsp?best=best";
		</script>
		<%
	}
	}
	if(check=="checked"||"checked"==check||"checked".equals(check)){
		response.sendRedirect("/AkinatorApp/TeamAkinator/Index.jsp?categ="+session.getAttribute("value"));
		session.setAttribute("value", "null");
	}
	else{
	%>
		<script>
		alert("메인으로");
		location.href="/AkinatorApp/TeamAkinator/Index.jsp";
		</script>
	<%
	}
%>
