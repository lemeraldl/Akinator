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

public class DeleteCommand implements ICommand{
		private Connection con;
		private PreparedStatement stmt;
		private DBConnectionMgr pool;
		private ResultSet rs;
		private String sql;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		int num = (int) req.getAttribute("num");
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		
		try{
			pool = pool.getInstance();
			con = pool.getConnection();
			if(con != null){
				System.out.println("DeleteCommand DB 연결 성공");
			}
			sql = "select usernum from tblboard where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			while(rs.next()){
				if(usernum != rs.getInt("usernum")){
					System.out.println("회원번호가 다름 삭제 불가능");
					return "/Board/Delete.jsp?delete=no";
				}
				else{
					System.out.println("글 삭제 가능");
				}				
			}					
			sql = "delete from tblboard where num=?";			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();			
		}
		catch(Exception err){
			System.out.println("DeleteCommand 에러" + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
		return "/Board/Delete.jsp?delete=ok";
	}

}
