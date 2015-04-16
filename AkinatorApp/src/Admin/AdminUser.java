package Admin;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.AdminDao;
import Member.MemberDto;

public class AdminUser implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		AdminDao dao = new AdminDao();
		
		HttpSession session =req.getSession();
		
		//요놈들 리퀘스트로 내보내야함 꼭.
		//int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		Vector v = dao.getMemberInfo();
			 
		//req.setAttribute("adminuser_usernum", usernum);	 
		req.setAttribute("adminuser_memberinfovector", v);	 
		return "/admin/adminUser.jsp";
	}

}