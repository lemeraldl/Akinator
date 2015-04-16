package Board.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;
import Member.MemberDto;
// Post.jsp에서 제목과 내용 입력 후 완료 버튼 눌렀을 때의 처리 Bean
public class PostCommand  implements ICommand{
	private Connection con;
	private ResultSet rs;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private String sql;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Vector v = new Vector();
		
		
		try{
		pool = pool.getInstance();
		con = pool.getConnection();
		if(con != null){
			System.out.println("PostCommand DB 연결 성공");
			}
				int usernum= Integer.parseInt((String)session.getAttribute("usernum"));
				System.out.println(usernum);
								
				// 글 쓰기
				sql = "update tblBoard set pos = pos+1";
				stmt = con.prepareStatement(sql);
				stmt.executeUpdate();
				System.out.println("포스 올라갔으려나");				
				
				// 
				BoardDto dto = new BoardDto();
				v = (Vector) req.getAttribute("board_info");
				
				for(int i=0; i<v.size(); i++){
					dto = (BoardDto)v.get(i);
					System.out.println(dto.getName());
				}
		
		 		sql = "insert into tblBoard(num, name, email, phone,"
				+ "subject, content, pos, depth, regdate, count, ip, usernum) "
				+ "values(seq_numboard.nextVal, ?,?,?,?,?,0,0,sysdate,0,?, ?)";

							System.out.println("여기는 두번째 쿼리문");
							
				stmt = con.prepareStatement(sql);
				stmt.setString(1, dto.getName());
				stmt.setString(2, dto.getEmail());
				stmt.setString(3, dto.getPhone());			
				stmt.setString(4, dto.getSubject());
				stmt.setString(5, dto.getContent());				
				stmt.setString(6, dto.getIp());
				stmt.setInt(7, usernum);
				stmt.executeUpdate();
				
				req.setAttribute("id", dto.getName());
				req.setAttribute("email", dto.getEmail());
				req.setAttribute("phone", dto.getPhone());
				req.setAttribute("subject", dto.getSubject());
				req.setAttribute("content", dto.getContent());
				req.setAttribute("ip", dto.getIp());
				
			}
			catch(Exception err){
				System.out.println("insertBoard : " + err);
			}			
			finally{
				pool.freeConnection(con);
			}
		
		return "/board.do?command=BOARDMAIN"; 
//		return "/Board/ListProc.jsp?p=ok";
		
	}	

}
