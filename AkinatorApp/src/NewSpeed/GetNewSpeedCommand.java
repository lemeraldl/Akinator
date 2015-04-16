package NewSpeed;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.testDto;
import AkinatorDB.DBConnectionMgr;

public class GetNewSpeedCommand implements ICommand{
	private Connection con, con1;
	private PreparedStatement stmt, stmt1;
	
	private ResultSet rs, rs1;
	private DBConnectionMgr pool;
	private String sql;
	
    int productusernum;
	int productnum;
	String friend;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		System.out.println("���� ������ȣ" + usernum);
		
		Vector v = new Vector();
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			con1 = pool.getConnection();
			if(con != null){
				System.out.println("GetNewSpeedCommand DB���� ����");
			}
			
			System.out.println("1");
			System.out.println(con);
			System.out.println(con1);
			// 1. ���ǿ� ����Ǿ��ִ� ȸ����ȣ�� ��ȸ�Ͽ� ��ǰ ��ȣ�� �̾Ƴ���.
			sql = "select * from followboard where usernum=" + usernum;
			System.out.println("2");
			stmt = con.prepareStatement(sql);
			System.out.println("3");
			rs = stmt.executeQuery();
			System.out.println("4");
			while(rs.next()){
				System.out.println("5");
				productnum = rs.getInt("productnum");
				System.out.println("6");
				System.out.println("�ù�" + productnum);
				System.out.println("7");
				friend = rs.getString("followfriend");
				System.out.println("8");
				
				
				
				sql = "select * from productboard where id='"+ friend+"'";
				System.out.println("9");
				stmt1 = con1.prepareStatement(sql);
				System.out.println("10");
				rs1 = stmt1.executeQuery();				
				System.out.println("11");
				
				while(rs1.next()){
					testDto dto = new testDto();
					System.out.println("12");
					System.out.println("���̵�� �� �����;ߵ�" + rs1.getString("id"));
					
					dto.setSellerName(rs1.getString("id"));
					dto.setSubject(rs1.getString("goodsname"));
					dto.setProductImage(rs1.getString("PRODUCIMG1"));
					dto.setPrice(rs1.getString("price"));
					dto.setRegdate(rs1.getString("REGDATE"));
					dto.setProduct_num(productnum);
					System.out.println(dto.getPrice());
					
						v.add(dto);				
					
				}
			}
			System.out.println(friend);

			// 2. �̾Ƴ� ��ǰ ��ȣ�� ��ȸ�Ͽ� ��ǰ�� �ø� ȸ����ȣ�� �̾Ƴ���.
/*			sql = "select * from productboard where productnum=" + productnum;
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				productusernum = rs.getInt("usernum");

				dto.setSellerName(rs.getString("id"));
				System.out.println("2. ���⵵ �;��ϴµ�"+ dto.getSellerName());
				*/
						
			// 20��
			
			// 3. �̾Ƴ� ȸ����ȣ�� �ٽ� ��ȸ�Ͽ� �Ǹ��ڰ� �Ǹ����� ��� ��ǰ�� �� �̾Ƴ���
//			sql = "select * from productboard where usernum=" + productusernum;
//			}
//			stmt = con.prepareStatement(sql);
//			rs = stmt.executeQuery();
//			
//			while(rs.next()){
//				dto.setSellerName(rs.getString("id"));
//				dto.setSubject(rs.getString("goodsname"));
//				dto.setProductImage(rs.getString("PRODUCIMG1"));
//				dto.setPrice(rs.getString("price"));
//				dto.setRegdate(rs.getString("REGDATE"));
//				v.add(dto);				
//			}
//			System.out.println("�Ǹ��� �̸� ������ �ȴ�" + dto.getSellerName());
//			System.out.println("����" + dto.getSubject());			
			
		}
		catch(Exception err){
			System.out.println("GetNewSpeedCommand ����" + err);
		}
		finally{
			pool.freeConnection(con);
		}
		req.setAttribute("newspeed", v);
		return "/NewSpeed/NewSpeed.jsp";
	}	
}
