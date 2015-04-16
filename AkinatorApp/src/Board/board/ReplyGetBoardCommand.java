package Board.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AkinatorDB.DBConnectionMgr;

public class ReplyGetBoardCommand implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		BoardDto dto = new BoardDto();
		int num = (int) req.getAttribute("num");
		
		Vector v = new Vector();
		
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			if(con != null){
				System.out.println("ReplyGetBoard DB 연결 성공");
			}
			
		// 글 번호로 조회 후 글 정보를 dto에 담는다
		sql = "select * from tblboard where num=?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, num);
		rs = stmt.executeQuery();
		while(rs.next()){
			dto.setNum(rs.getInt("num"));
			dto.setUsernum(rs.getInt("usernum"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setPhone(rs.getString("phone"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			v.add(dto);
			
			req.setAttribute("reply_getboard", v);
			}
		
		}
		catch(Exception err){
			System.out.println("ReplyGetBoard 오류" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return "/Board/Reply.jsp";
	}

}
