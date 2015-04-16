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
import Member.MemberDto;
import encrypt.AES128;

public class LoginCommand implements ICommand{
		private Connection con = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		private DBConnectionMgr pool = null;
		private String sql = null;
		private String confirm = null;
		AES128 enc = new AES128();
		
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession(); // 세션
		
		MemberDto dto = new MemberDto();
		Vector v = new Vector();			
		v = (Vector)req.getAttribute("login");
		
		for(int i=0; i<v.size(); i++){
			dto = (MemberDto) v.get(i);
		}
		String phone = dto.getMem_phone();
		
//		String id = dto.getMem_id();	
//		System.out.println(id);
		try{
			
			pool = pool.getInstance();
			con = pool.getConnection();			
			if(con != null){
				System.out.println("DB연결 완료");
			}
				sql = "select * from UserBoard where phonenum=?";			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, phone);
//			System.out.println(phone);
			rs = stmt.executeQuery();
			
			
		
			if(rs.next()){	// 해당 아이디가 있을 때
				System.out.println("첫번째if문 안");
				String aa=enc.decrypt(rs.getString("pass"));
				if(!dto.getMem_pass().equals(aa)){ // 아이디는 있는데 아이디와 비밀번호가 일치하지 않을 때
					confirm = "false";
					
					System.out.println("폰번호는 존재하나 비밀번호가 틀림");
					return "/admin/adminLoginProc.jsp?confirm=false";
				}
		
				
				else{	// 아이디가 있고 아이디와 비밀번호가 일치 할 때
					confirm = "true";		
					int num = rs.getInt("usernum");
					String id = rs.getString("id");
					System.out.println("아이디 비밀 번호 일치 할때 ");
					//session.setAttribute("usernum", num);
					session.setAttribute("usernum", Integer.toString(num));
					session.setAttribute("id", id);
					return "/admin/adminLoginProc.jsp?confirm=true";
				}							
			}
			else{
				return "/admin/adminLoginProc.jsp?confirm=no id";
			}			
		}		
		catch(Exception err){
			System.out.println("LoginCommand : " + err);				
		}
		
		finally{
			pool.freeConnection(con, stmt, rs);
		}			
		return null;
		}
	}