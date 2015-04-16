package Admin;

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
import Board.board.BoardDao;
import Board.board.BoardDto;
import Member.AdminDao;

public class AdminArticle implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	public AdminArticle(){
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		HttpSession session =req.getSession();
		
		
		//Vector v = dao.getBoardList();
		
		Vector v = new Vector();
		String sql;
		
		try{
			con = pool.getConnection();

			sql = "select * from tblBoard order by pos";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("Content"));
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
			}
		}
		catch(Exception err){
			System.out.println("getBoardList : " + err);
		}
		finally{
			pool.freeConnection(con);
		}
		
		req.setAttribute("adminarticle_articleinfovector", v);
		
		return "/admin/adminArticle.jsp";
	}

}