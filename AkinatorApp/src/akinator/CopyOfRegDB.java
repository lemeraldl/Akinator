package akinator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import AkinatorDB.DBConnectionMgr;

public class CopyOfRegDB implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public CopyOfRegDB(){
		try {
			//Ȯ��
			System.out.println("�����");
			Context ctx = new InitialContext();
			ds= (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");    //context���� ������ ��Ī      
			System.out.println("���Ἲ��");
		} catch (Exception e) {
			System.out.println("DB ���� ����: "+e);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		req.setCharacterEncoding("euc-kr");
		
		
		DataDto dto = new DataDto();
		Vector v = new Vector();
		v= (Vector)req.getAttribute("data");
		for(int i=0;i<v.size();i++){
			dto = (DataDto)v.get(i);
		}
		HttpSession session = req.getSession();
		session.setAttribute("category", "null");
		//sql��..test���� �ּ�ó����..
		String sql = "insert into productBoard(productnum, goodsname, quantity, price, productcontents, tag, "
	            + "sepaycheck, delipaycheck, tradecheck, producimg1, producimg2, producimg3, producimg4, producimg5, producimg6, useddegree, "
	            + "bigCategory, smallCategory, usernum, regDate, buydate, countnum, zzimnum, id) values(productnum.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,0,0,?)";
	      
	      try{
	         con = ds.getConnection();
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, dto.getGoodsname());
	         stmt.setInt(2, dto.getQuantity());
	         stmt.setInt(3, dto.getPrice());
	         stmt.setString(4, dto.getProductcontents());
	         stmt.setString(5, dto.getTag());
	         stmt.setString(6, dto.getSepaycheck());
	         stmt.setString(7, dto.getDelipaycheck());
	         stmt.setString(8, dto.getTradecheck());
	         stmt.setString(9, dto.getProducimg1());         
	         stmt.setString(10, dto.getProducimg2());         
	         stmt.setString(11, dto.getProducimg3());         
	         stmt.setString(12, dto.getProducimg4());         
	         stmt.setString(13, dto.getProducimg5());         
	         stmt.setString(14, dto.getProducimg6());         
	         stmt.setString(15, dto.getUseddegree());         
	         stmt.setString(16, dto.getBigCategory());         
	         stmt.setString(17, dto.getSmallCategory());         
	         stmt.setInt(18, dto.getUsernum());         
	         stmt.setString(19, dto.getBuydate());         
	         stmt.setString(20, dto.getId());		
	 
			stmt.executeUpdate();
	        //���� ���� �ܾ� ���� �ϰ� �״ܾ�� ����ũ�� ���ְ�
	         
	         //sql = "select * from tabel where like ''"
	         /*while(rs.next()){*/
	        	 //���� ȣ�� rs.getString(mail), �����Ѵܾ� 
	        	// mail(rs.getString(mail),�ܾ�);
	     /*    }*/
			System.out.println("���ԿϷ�");// ���Ⱑ �Ǹ������̴� 
		}
		catch(Exception err){
			System.out.println("���� ���� : " + err);
		}
		finally{
			freeCon();
		}
		return "/TeamAkinator/IndexProc.jsp";
	}

	public void freeCon(){
		if(con != null)try {con.close();} catch (Exception e) {}
		if(stmt != null)try {stmt.close();} catch (Exception e) {}
		if(rs != null)try {rs.close();} catch (Exception e) {}
	}
}
