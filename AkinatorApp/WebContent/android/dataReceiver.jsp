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
		Class.forName("oracle.jdbc.driver.OracleDriver"); //����̹� �޸𸮿� �ø���
		con = DriverManager.getConnection(url, id, pw);//��񿬰�
		
		sql = "select * from userboard";
		stmt = con.prepareStatement(sql);//������ �غ�
		rs = stmt.executeQuery(sql);//�������, �������������
	
		while(rs.next()){
			test = rs.getString("phonenum");
		}
	}
	catch(Exception e){
		System.out.println("dataReceiver ���� "+e);
	}
	finally{
		if(rs!=null)try{rs.close();}catch(Exception err){}
		if(stmt!=null)try{rs.close();}catch(Exception err){}
		if(con!=null)try{rs.close();}catch(Exception err){}
		
	}
	
	
	String userId = request.getParameter("userId");
	System.out.println("�ΰ����� �ݺ��� ��ȣ "+test);
	out.println(test);
%>