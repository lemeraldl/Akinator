package Board.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;
import Member.MemberDto;
// Post.jsp에서 로그인 한 회원의 정보 뿌려주는 Bean
public class PostGetBoardCommand implements ICommand{
	private String sql;
	private ResultSet rs;
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private MemberDto dto = new MemberDto();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		int usernum= Integer.parseInt((String)session.getAttribute("usernum"));
		System.out.println(usernum);
		
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			if(con != null){
				System.out.println("PostGetBoardCommand DB 연결 성공");
			}		
		
		sql = "select * from userboard where usernum=" + usernum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){			
			dto.setMem_id(rs.getString("id"));
			dto.setMem_phone(rs.getString("phonenum"));
			dto.setMem_email(rs.getString("email"));	
			dto.setMem_pass(rs.getString("pass"));		
		}	
		System.out.println(dto.getMem_id());
		req.setAttribute("id", dto.getMem_id());
		req.setAttribute("phone", dto.getMem_phone());
		req.setAttribute("email", dto.getMem_email());
		
		
		
		
		}
		catch(Exception err){
			System.out.println("PostGetBoardCommand 에러" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}		
		return "/Board/Post.jsp";
	}
}
