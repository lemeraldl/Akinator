<%@ page contentType="text/html; charset=euc-kr" errorPage="DBError.jsp" %>
<%@ page import="java.sql.*"%>
<%
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	String sql=null;
	String test=null;
	
	String url="jdbc:oracle:thin:@localhost:1522:orcl";
	String id="akinator";
	String pw="1111";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 메모리에 올리깅
		con = DriverManager.getConnection(url, id, pw);//디비연결
		
		sql = "select * from userboard";
		stmt = con.prepareStatement(sql);//포장지 준비
		rs = stmt.executeQuery(sql);//디비전달, 결과값가져오기
	
		while(rs.next()){
			test = rs.getString("phonenum");
		}
	}
	catch(Exception e){
		System.out.println("dataReceiver 오류 "+e);
	}
	finally{
		if(rs!=null)try{rs.close();}catch(Exception err){}
		if(stmt!=null)try{rs.close();}catch(Exception err){}
		if(con!=null)try{rs.close();}catch(Exception err){}
		
	}
	
	
	String userId = request.getParameter("userId");
	System.out.println("인간병기 반병기 번호 "+test);
	out.println(test);
%>