package Board.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;

public class ReadCommand implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		res.setCharacterEncoding("EUC-KR");
			BoardDto dto = new BoardDto();
//			HttpSession session = req.getSession();
			Vector v = new Vector();
//			int usernum= Integer.parseInt((String)session.getAttribute("usernum"));
		try{
			
			int num = (int) req.getAttribute("num");
			String keyField = (String) req.getAttribute("keyField");
			String keyWord = (String) req.getAttribute("keyWord");
//			System.out.println("ReadCommand 글 번호" + num);
//			System.out.println("ReadCommand keyField" + keyField);
//			System.out.println("ReadCommand keyWord" + keyWord);
			
			pool = pool.getInstance();
			con = pool.getConnection();
			if(con != null){
				System.out.println("ReadCommand DB연결 성공");
			}
			
		
			con = pool.getConnection();

			sql = "update tblboard set count=count+1 where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();

			sql = "select * from tblboard where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if(rs.next()){
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
				dto.setUsernum(rs.getInt("usernum"));
				System.out.println("들어갓니?");				
				v.add(dto);
				req.setAttribute("read", v);
				
			}
		}
		catch(Exception err){
			System.out.println("ReadCommand 오류" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return "/Board/Read.jsp";
	}

}
