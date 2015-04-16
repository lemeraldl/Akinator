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

public class ListCommand implements ICommand{
	private String keyField, keyWord;
	private Vector v = new Vector();
	private String sql;
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
			try{
				pool = pool.getInstance();
				con = pool.getConnection();
				if(con != null){
					System.out.println("ListCommand DB 연결 성공");
				}
				if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
					sql = "select * from tblBoard order by pos";
					System.out.println("여기 오냐 18");
				}
				else{
					sql = "select * from tblboard where " + keyField + 
						" like '%" + keyWord + "%' order by pos";
					System.out.println("여긴 else");
				}
				
//				String result = "";
//				for(int i=0; i<dto.getDepth()*3; i++){
//					result += "&nbsp;";
//				}

				
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				while(rs.next()){
					System.out.println("while문 안");
					BoardDto dto = new BoardDto();
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
					req.setAttribute("List", v);
					}	
				}
			catch(Exception err){
				System.out.println("ListCommand 에러" + err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
		
		
		return "/Board/List.jsp";
	}
}
