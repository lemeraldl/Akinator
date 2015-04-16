package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AkinatorDB.DBConnectionMgr;

public class SearchCommand implements ICommand{
	private Connection con = null;
	private PreparedStatement stmt = null;
	private DBConnectionMgr pool = null;
	private ResultSet rs = null;
	private String sql = null;
	private String result = null;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			String id = (String) req.getAttribute("ids"); // 클라이언트에게 아이디 받은 값
			String phone = (String) req.getAttribute("phones");
//			System.out.println(id);
			try{
				pool = pool.getInstance();
				con = pool.getConnection();			
				if(con != null){
					System.out.println("SearchCommand");
					System.out.println("DB연결 완료");
				}
				
				
			if(id.equals(req.getAttribute("ids"))){
				sql = "select id from UserBoard where id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				//System.out.println(rs.getString("mem_id"));
				if(rs.next()){ 
					if(id.equals(rs.getString("id"))){ // 아이디 존재
						System.out.println("ID생성불가");						
						return "/TeamAkinator/SearchProc.jsp?result=false";
					}	
				}
				else{ // 아이디 없음 만들어도 되!
					System.out.println("ID생성가능");
					return "/TeamAkinator/SearchProc.jsp?result=true";
				}
				req.setAttribute("idx", id);
				} // 닉네임 중복 조회 끝
				
				
			else if(phone.equals(req.getAttribute("phones"))){
				sql = "select phonenum from UserBoard where phonenum=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, phone);
				
			} // 폰 번호 중복 조회 끝
		}
			catch(Exception err){
				System.out.println("SearchCommand : " + err);				
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
				
//		return "/TeamAkinator/Search.jsp";
			return null;
	
	}
}
