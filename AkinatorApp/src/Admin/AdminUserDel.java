package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.UpdateMemberDao;

public class AdminUserDel implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		UpdateMemberDao dao = new UpdateMemberDao();
		HttpSession session =req.getSession();
		
		int num = Integer.parseInt((String)session.getAttribute("delUser"));
		session.setAttribute("delUser", null);

		dao.DeleteMember(num);
		
		return "/admin.do?COMMAND=USER";
	}

}