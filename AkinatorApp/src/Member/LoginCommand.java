package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import encrypt.AES128;
import AkinatorDB.DBConnectionMgr;

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
		HttpSession session = req.getSession(); // ����
		
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
				System.out.println("DB���� �Ϸ�");
			}
				sql = "select * from UserBoard where phonenum=?";			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, phone);
//			System.out.println(phone);
			rs = stmt.executeQuery();
			
			
		
			if(rs.next()){	// �ش� ���̵� ���� ��
				System.out.println("ù��°if�� ��");
				String decPass=enc.decrypt(rs.getString("pass"));
				if(!dto.getMem_pass().equals(decPass)){ // ���̵�� �ִµ� ���̵�� ��й�ȣ�� ��ġ���� ���� ��
					confirm = "false";
					System.out.println("����ȣ�� �����ϳ� ��й�ȣ�� Ʋ��");
					if(session.getAttribute("adminCheck")==null){
						return "/TeamAkinator/LoginProc.jsp?confirm=false";
					}
					else{
						return "/admin/adminLoginProc.jsp?confirm=false";
					}
				}
		
				
				else{	// ���̵� �ְ� ���̵�� ��й�ȣ�� ��ġ �� ��
					confirm = "true";		
					int num = rs.getInt("usernum");
					String id = rs.getString("id");
					//session.setAttribute("usernum", num);
					session.setAttribute("usernum", Integer.toString(num));
					session.setAttribute("id", id);
					if(session.getAttribute("adminCheck")==null){
						return "/TeamAkinator/LoginProc.jsp?confirm=true";
					}
					else{
						return "/admin/adminLoginProc.jsp?confirm=true";
					}
				}							
			}
			else{
				if(session.getAttribute("adminCheck")==null){
					return "/TeamAkinator/LoginProc.jsp?confirm=no id";
				}
				else{
					return "/admin/adminLoginProc.jsp?confirm=no id";
				}
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