package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;

public class CopyOfRegConfirmCommand implements ICommand {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;
	private DBConnection db = new DBConnection();

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		MemberDto dto = new MemberDto();
		Vector v = new Vector();

		v = (Vector) session.getAttribute("member");

		for (int i = 0; i < v.size(); i++) {
			dto = (MemberDto) v.get(i);
		}
		String phone = dto.getMem_phone();
		String email = dto.getMem_email();
		String id = dto.getMem_id();
		System.out.println(phone);

		try {
			con = db.connection();
			if (con != null) {
				System.out.println("RegConfirm DB연결 성공!");
			}

			String sql = "select * from userboard";
			
			stmt = con.prepareStatement(sql);
			/* stmt.setString(1, phone); */
			rs = stmt.executeQuery();

			while(rs.next()) {
				//전화번호 중복체크
				if (phone.equals(rs.getString("phonenum"))) {
					return "/TeamAkinator/regFormProc.jsp?confirm=phoneno";
				} 
				//아이디 중복체크
				else if (id.equals(rs.getString("id"))) {
					System.out.println(rs.getString("id"));
					return "/TeamAkinator/regFormProc.jsp?confirm=idno";
				} 
				//이메일 중복체크
				else if (email.equals(rs.getString("email"))) {
					return "/TeamAkinator/regFormProc.jsp?confirm=emailno";
				}

			} 
			return "/reg.action?command=REGCONFIRMED";
		}

		catch (Exception err) {
			System.out.println("RegConfirm" + err);
		}
		
		v.add(dto);
		return v;
	}
}