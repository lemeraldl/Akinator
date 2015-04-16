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

import encrypt.AES128;
import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;

public class RegConfirmedCommand implements ICommand {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;
	private DBConnection db = new DBConnection();

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session =req.getSession();
		
		Vector v = new Vector();

		v = (Vector)session.getAttribute("member");
		MemberDto dto = new MemberDto();

	    for(int i=0; i<v.size(); i++){
	      dto = (MemberDto)v.get(i);
	    }
	    String encString=null; 
		AES128 enc = new AES128();
		try {
			encString = enc.encrypt(dto.getMem_pass());
		} 
		catch (Exception e) {e.printStackTrace();}

		req.setAttribute("regconfirmedcommand_memberinfovector", v);
		req.setAttribute("regconfirmedcommand_passenc", encString);

		return "/TeamAkinator/regConfirm.jsp";
	}
}