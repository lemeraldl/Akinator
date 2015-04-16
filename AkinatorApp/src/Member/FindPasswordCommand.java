package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import encrypt.AES128;
import mail.Gmail;
import AkinatorDB.DBConnection;

public class FindPasswordCommand implements ICommand {
	Gmail mailtest = new Gmail();
	private Connection con =null;
	private PreparedStatement stmt =null;
	private ResultSet rs = null;
	private DBConnection db = new DBConnection();
	private String email;
	private String pass;
	AES128 enc = new AES128();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		try{
			con = db.connection();
			if(con!=null){
				System.out.println("findpassword DB 연결 성공");
			}
			String sql = "select * from userboard where phonenum=?";
			String intophonenum = req.getParameter("phonenum");
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, intophonenum);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("email"));
				email = rs.getString("email");
				pass = enc.decrypt(rs.getString("pass"));
				
			}
		}
		catch(Exception e){
			System.out.println("비번 찾기 실패 : " + e);
		}
		mailtest.gmailPassword(email,pass);		//비밀번호 발송
		
		return "/TeamAkinator/findPassword2.jsp";
	}

	
}
