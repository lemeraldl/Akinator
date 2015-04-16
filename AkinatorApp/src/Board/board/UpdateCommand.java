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

public class UpdateCommand implements ICommand {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	private String sql;
	private int depth;
	private String result = "";
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Vector v = new Vector();
		BoardDto dto = new BoardDto(); 
		HttpSession session = req.getSession();
		
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		v = (Vector) req.getAttribute("board_update");		
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}
		req.setAttribute("result", result);
		
		for(int i=0; i < v.size(); i++){			
			dto = (BoardDto) v.get(i);	
			
			try{
				pool = pool.getInstance();
				con = pool.getConnection();
				
				if(con != null){
					System.out.println("UpdateCommand DB연결 성공");
				}
				sql = "select usernum from tblboard where num=?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, dto.getNum());
				rs = stmt.executeQuery();
				while(rs.next()){
					if(usernum != rs.getInt("usernum")){
						System.out.println("회원번호가 다름 수정 불가능");
						return "/Board/Updateproc.jsp?update=no";
					}
					else{
						System.out.println("글 수정 가능");
					}				
				}					
					
					String sql = "update tblboard set name=?, email=?, " +
							"subject=?, content=? where num=?";
						con = pool.getConnection();
						stmt = con.prepareStatement(sql);
						stmt.setString(1, dto.getName());
						stmt.setString(2, dto.getEmail());
						stmt.setString(3, dto.getSubject());
						stmt.setString(4, dto.getContent());
						stmt.setInt(5, dto.getNum());
						
						System.out.println("Update"+dto.getNum());

						stmt.executeUpdate();	
						
				
			}
			catch(Exception err){
				System.out.println("UpdateCommand 수정 실패" + err);
			}
		}
		System.out.println(dto.getContent());
		return "/Board/Updateproc.jsp?update=ok";
	}

}
