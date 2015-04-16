package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;
import Board.board.BoardDao;
import Member.UpdateMemberDao;

public class AdminArticleDel implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	public AdminArticleDel(){
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
		BoardDao dao = new BoardDao();
		HttpSession session =req.getSession();
		
		int delArticle = Integer.parseInt((String)session.getAttribute("delArticle"));
		session.setAttribute("delArticle", null);
		
		try{
			String sql = "delete from tblboard where num=?";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, delArticle);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteBoard : " + err);
		}
		finally{
			pool.freeConnection(con);
		}
		return "/admin.do?COMMAND=ARTICLE";
	}

}