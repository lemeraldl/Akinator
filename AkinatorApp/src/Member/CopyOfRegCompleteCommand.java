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

import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;

public class CopyOfRegCompleteCommand implements ICommand {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private String check = null;
	private DBConnection db = new DBConnection();
	private DBConnectionMgr pool = new DBConnectionMgr();

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDto dto = new MemberDto();
		Vector v = new Vector();
		try {
			con = db.connection();
			v = (Vector) session.getAttribute("member");

			for (int i = 0; i < v.size(); i++) {
				dto = (MemberDto) v.get(i);
			}
			System.out.println("RegCompleteCommand =" + dto.getMem_id());

			if (con != null) {
				System.out.println("DB 연결 완료!");
			}

			String sql = "insert into UserBoard(usernum, phonenum, pass, id, email, INTEREST1_KEYWORD, INTEREST2_KEYWORD ,INTEREST3_KEYWORD)"
					+ " values(usernum.nextVal,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getMem_phone());
			stmt.setString(2, dto.getMem_pass());
			stmt.setString(3, dto.getMem_id());
			stmt.setString(4, dto.getMem_email());
			stmt.setString(5, dto.getInterest1_keyword());
			stmt.setString(6, dto.getInterest2_keyword());
			stmt.setString(7, dto.getInterest3_keyword());
			
			stmt.executeUpdate();

			sql = "select  * from userboard where id=? ";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getMem_id());
			rs = stmt.executeQuery();
			int num = 0;

			if (rs.next()) {
				System.out.println(rs.getInt("usernum"));
				num = rs.getInt("usernum");
			}

			String id = dto.getMem_id();
			session.setAttribute("usernum", Integer.toString(num));
			session.setAttribute("id", id);

			session.removeAttribute("member");
			
			return "/TeamAkinator/regComplete.jsp?reg=complete";
		} catch (Exception err) {
			System.out.println("RegCompleteCommand : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);

		}
		return null;

	}

}