package Admin;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.AdminDao;
import Member.MemberDto;

public class AdminProduct implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		AdminDao dao = new AdminDao();
		
		HttpSession session =req.getSession();
		
		Vector v = dao.getProductInfo();
		
		req.setAttribute("adminproduct_productinfovector", v);
		
		return "/admin/adminProduct.jsp";
	}

}