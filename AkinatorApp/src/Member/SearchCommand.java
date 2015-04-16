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
			String id = (String) req.getAttribute("ids"); // Ŭ���̾�Ʈ���� ���̵� ���� ��
			String phone = (String) req.getAttribute("phones");
//			System.out.println(id);
			try{
				pool = pool.getInstance();
				con = pool.getConnection();			
				if(con != null){
					System.out.println("SearchCommand");
					System.out.println("DB���� �Ϸ�");
				}
				
				
			if(id.equals(req.getAttribute("ids"))){
				sql = "select id from UserBoard where id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				//System.out.println(rs.getString("mem_id"));
				if(rs.next()){ 
					if(id.equals(rs.getString("id"))){ // ���̵� ����
						System.out.println("ID�����Ұ�");						
						return "/TeamAkinator/SearchProc.jsp?result=false";
					}	
				}
				else{ // ���̵� ���� ���� ��!
					System.out.println("ID��������");
					return "/TeamAkinator/SearchProc.jsp?result=true";
				}
				req.setAttribute("idx", id);
				} // �г��� �ߺ� ��ȸ ��
				
				
			else if(phone.equals(req.getAttribute("phones"))){
				sql = "select phonenum from UserBoard where phonenum=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, phone);
				
			} // �� ��ȣ �ߺ� ��ȸ ��
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
