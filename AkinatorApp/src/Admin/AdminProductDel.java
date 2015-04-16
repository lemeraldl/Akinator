package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.AdminDao;
import Member.UpdateMemberDao;

public class AdminProductDel implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		AdminDao dao = new AdminDao();
		HttpSession session =req.getSession();

		int delProduct= Integer.parseInt((String)session.getAttribute("delProduct"));
		session.setAttribute("delProduct", null);

		dao.DeleteProduct(delProduct);
		
		return "/admin.do?COMMAND=PRODUCT";
	}

}