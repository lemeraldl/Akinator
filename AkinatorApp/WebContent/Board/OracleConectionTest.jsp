<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>오라클 연결 테스트</h1>
<%
	
   		try{
      		Class.forName("oracle.jdbc.driver.OracleDriver");
      		//해당 클래스의 주소값을 가져온다. 오브젝트를 가져온다. 오브젝트는 최상위 이므로 모두 사용가능, 오브젝트는 어디서든 사용가능   
      		String url ="jdbc:oracle:thin:@localhost:1521:orcl"; // 
       		Connection con = DriverManager.getConnection(url,"scott","1111"); //오라클의 위치
      	if(con != null){
         	out.println("오라클 DB와 연결성공");
      }
      
   }
   catch(Exception err){
      out.print(err);
   }


%>
</body>
</html>