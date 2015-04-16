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
		System.out.println("세션 유저번호" + usernum);
		
		Vector v = new Vector();
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			con1 = pool.getConnection();
			if(con != null){
				System.out.println("GetNewSpeedCommand DB연결 성공");
			}
			
			System.out.println("1");
			System.out.println(con);
			System.out.println(con1);
			// 1. 세션에 저장되어있는 회원번호를 조회하여 상품 번호를 뽑아낸다.
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
				System.out.println("시발" + productnum);
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
					System.out.println("아이디는 두 개나와야되" + rs1.getString("id"));
					
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

			// 2. 뽑아낸 상품 번호를 조회하여 상품을 올린 회원번호를 뽑아낸다.
/*			sql = "select * from productboard where productnum=" + productnum;
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				productusernum = rs.getInt("usernum");

				dto.setSellerName(rs.getString("id"));
				System.out.println("2. 여기도 와야하는데"+ dto.getSellerName());
				*/
						
			// 20번
			
			// 3. 뽑아낸 회원번호로 다시 조회하여 판매자가 판매중인 모든 물품을 다 뽑아낸다
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
//			System.out.println("판매자 이름 나오면 된다" + dto.getSellerName());
//			System.out.println("제목" + dto.getSubject());			
			
		}
		catch(Exception err){
			System.out.println("GetNewSpeedCommand 에러" + err);
		}
		finally{
			pool.freeConnection(con);
		}
		req.setAttribute("newspeed", v);
		return "/NewSpeed/NewSpeed.jsp";
	}	
}
