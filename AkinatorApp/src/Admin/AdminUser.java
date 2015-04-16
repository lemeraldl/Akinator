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
		
		//���� ������Ʈ�� ���������� ��.
		//int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		Vector v = dao.getMemberInfo();
			 
		//req.setAttribute("adminuser_usernum", usernum);	 
		req.setAttribute("adminuser_memberinfovector", v);	 
		return "/admin/adminUser.jsp";
	}

}