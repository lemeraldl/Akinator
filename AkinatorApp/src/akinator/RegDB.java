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

import mail.Gmail;
import AkinatorDB.DBConnectionMgr;

public class RegDB implements ICommand{
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;
	public RegDB(){
		 try {
	         pool = DBConnectionMgr.getInstance();
	         con = (Connection) pool.getConnection();
	      } catch (Exception err) {
	         System.out.println("���� : " + err);
	      }
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		req.setCharacterEncoding("euc-kr");
		

		String goodsname=null;
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
	        // ���⼭���� ���� ������  
			goodsname=dto.getGoodsname();
			
			System.out.println(goodsname);
			sql="select email,INTEREST1_KEYWORD,INTEREST2_KEYWORD,INTEREST3_KEYWORD from userboard"; 
	         System.out.println("regdb�� "+sql);
			stmt=con.prepareStatement(sql);
			System.out.println("rs����");
			rs=stmt.executeQuery();
			
			System.out.println("while�� ");
			
			while(rs.next()){
				System.out.println("while�� �� ");
				
			try{
				
			
			String interest1_keword	=rs.getString("INTEREST1_KEYWORD");
			String interest2_keword	=rs.getString("INTEREST2_KEYWORD");
			String interest3_keword	=rs.getString("INTEREST3_KEYWORD");
			String email=rs.getString("email");
			System.out.println("interest1_keword"+interest1_keword);
			System.out.println("interest2_keword"+interest2_keword);
			System.out.println("interest3_keword"+interest3_keword);
			System.out.println("email"+email);
			
			if(goodsname.contains(interest1_keword)){
			
				System.out.println("interest1_keword��");
				Gmail	mail=new Gmail();
				mail.favoritemail(email, interest1_keword);
			}
			else if(goodsname.contains(interest2_keword)){
				System.out.println("interest2_keword��");
				Gmail	mail=new Gmail();
				mail.favoritemail(email, interest2_keword);
			}
			else if(goodsname.contains(interest3_keword)){
				System.out.println("interest3_keword��");
				Gmail	mail=new Gmail();
				mail.favoritemail(email, interest3_keword);
			}
			//if(goodsname��  rs.getstring("INTEREST1_KEYWORD")�Ǵ� 2 3�� ������� �� ���� 
			
			
				//sql = "select * from tabel where like ''"
				// ������ Ű���带 �������ִ� ����� ������ ��������Ѵ� 
				
		         /*while(rs.next()){*/
		        	 //���� ȣ�� rs.getString(mail), �����Ѵܾ� 
		        	// mail(rs.getString(mail),�ܾ�);
		     /*    }*/
			}catch (NullPointerException err){
				
			}
			}
			
			// ���� ���� ���Ϻ����� 
		
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
