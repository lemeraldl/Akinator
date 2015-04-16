package Admin;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FrontController extends HttpServlet{
	
	private String cmd;
	private int num;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		Vector v = new Vector();
		MemberDto dto = new MemberDto();
		
		cmd = req.getParameter("COMMAND");
		String nextPage ="";
		
		HttpSession session =req.getSession();
		if(req.getParameter("delUser")!=null){
			session.setAttribute("delUser",req.getParameter("delUser"));
		}
		if(req.getParameter("delProduct")!=null){
			session.setAttribute("delProduct",req.getParameter("delProduct"));
		}
		if(req.getParameter("delArticle")!=null){
			session.setAttribute("delArticle",req.getParameter("delArticle"));
		}
		if(cmd.equals("LOGIN")){      
	         dto.setMem_phone(req.getParameter("phone"));
	         dto.setMem_pass(req.getParameter("pass"));
	         v.add(dto);
	         req.setAttribute("login", v);
		}
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);
		nextPage = (String)iCmd.processCommand(req, resp);
		
		RequestDispatcher view =
				req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
}
