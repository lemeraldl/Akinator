package NewSpeed;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;
// 7월 4일 금요일 작업하다 때려침 월요일날 마무리 짓기 쿼리문ㅇㅇ

public class NewSpeedMainCommand implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private String sql;
	private ResultSet rs;
	int productnum = 0;
	int prousernum = 0;
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		
		try{
		pool = pool.getInstance();
		con = pool.getConnection();
		
		if(con != null){
			System.out.println("NewSpeedMainCommand DB연결 성공!");
			}
		
		// 1. 회원번호로 팔로우 테이블을 조회해서 상품 번호를 빼낸다.
		sql = "select * from followboard where usernum=" + usernum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			productnum = rs.getInt("productnum");
		}
		
		// 2. 빼낸 상품번호를 다시 조회
		sql = "select * from productboard where productnum=" + productnum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			prousernum = rs.getInt("usernum");
		}
		
		}
		catch(Exception err){
			System.out.println("NewSpeedMainCommand 오류" + err);
		}
		finally{
			pool.freeConnection(con);
		}
		
		return null;
	}

}
