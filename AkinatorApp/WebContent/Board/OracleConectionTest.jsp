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
<h1>����Ŭ ���� �׽�Ʈ</h1>
<%
	
   		try{
      		Class.forName("oracle.jdbc.driver.OracleDriver");
      		//�ش� Ŭ������ �ּҰ��� �����´�. ������Ʈ�� �����´�. ������Ʈ�� �ֻ��� �̹Ƿ� ��� ��밡��, ������Ʈ�� ��𼭵� ��밡��   
      		String url ="jdbc:oracle:thin:@localhost:1521:orcl"; // 
       		Connection con = DriverManager.getConnection(url,"scott","1111"); //����Ŭ�� ��ġ
      	if(con != null){
         	out.println("����Ŭ DB�� ���Ἲ��");
      }
      
   }
   catch(Exception err){
      out.print(err);
   }


%>
</body>
</html>