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

public class ReplyCommand implements ICommand{
		private Connection con;
		private DBConnectionMgr pool;
		private PreparedStatement stmt;
		private ResultSet rs;
		private String sql;
		private int depth;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
				Vector v = new Vector();
				BoardDto dto = new BoardDto();
				HttpSession session = req.getSession();
				int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
				int num = (int)req.getAttribute("num");
				System.out.println("ReplyCommand"+num);
			try{
				pool = pool.getInstance();
				con = pool.getConnection();
				if(con != null){
					System.out.println("ReplyCommand DB 연결 성공");
				}
				v = (Vector) req.getAttribute("reply");
				for(int i=0; i<v.size(); i++){
					dto = (BoardDto) v.get(i);
				}
				
				sql = "update tblboard set pos=pos+1 where pos>?";					
					stmt = con.prepareStatement(sql);
					stmt.setInt(1, dto.getPos());
					System.out.println("포스" + dto.getPos());
					stmt.executeUpdate();
					
					
				sql = "insert into tblboard(num, usernum, name, email, phone,"
						+ "subject, content, pos, depth, regdate, count, ip) "
						+ "values(seq_numboard.nextVal,?,?,?,?,?,?,?,?,sysdate,?,?)";
					
					stmt = con.prepareStatement(sql);
					
					
					stmt.setInt(1, usernum);
					stmt.setString(2, dto.getName());
					stmt.setString(3, dto.getEmail());
					stmt.setString(4, dto.getPhone());
					stmt.setString(5, "\t" + dto.getSubject());
					stmt.setString(6, dto.getContent());
					stmt.setInt(7, dto.getPos()+1);
					stmt.setInt(8, dto.getDepth()+1);
					stmt.setInt(9, dto.getCount());
					stmt.setString(10, dto.getIp());					
					stmt.executeUpdate();	
					System.out.println("리플커맨드 작성자 : "+dto.getName());			
					System.out.println("Depth는 얼마? ReplyCommand  :" +  dto.getDepth());		
					

					
					
					
			}
			catch(Exception err){
				System.out.println("ReplyCommand 오류" + err);
			}
//		return "/Board/ReplyProc.jsp?reply=ok";
//		return "/AkinatorApp/board.do?command=BOARDMAIN";
		return "/board.do?command=BOARDMAIN";
	}

}
