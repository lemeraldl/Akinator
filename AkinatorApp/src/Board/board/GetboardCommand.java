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

public class GetboardCommand implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	private String sql;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			int num = (int) req.getAttribute("num");
			
			BoardDto dto = new BoardDto();
			Vector v = new Vector();
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			if(con != null){
				System.out.println("GetboardCommand DB 연결 성공");
			}
			sql = "update tblboard set count=count+1 where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();
			System.out.println("GetBoardCommand pos올리는 중");

			sql = "select * from tblboard where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));				
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				
				v.add(dto);
				req.setAttribute("getBoard", v);
			}			
		}
		catch(Exception err){
			System.out.println("GetboardCommand 에러" + err);
		}
		
		return "/Board/Update.jsp";
	}

}
