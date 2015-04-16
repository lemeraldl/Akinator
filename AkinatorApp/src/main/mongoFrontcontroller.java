package main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import akinator.CommandFactory;
import akinator.ICommand;

public class mongoFrontcontroller extends HttpServlet {

	
	private String cmd;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		HttpSession session=req.getSession();
		
		String cmd = req.getParameter("command");
		System.out.println("cmd"+cmd);
		//String delarticle=(String) req.getAttribute("delArticle");
		
		
		session.setAttribute("delArticle", req.getParameter("delArticle"));
		
		
        String nextPage ="";
		
		MongoCommandFactory factory = MongoCommandFactory.getinstance();

		MongoICommand iCmd = factory.createfactory(cmd);
		
		nextPage = (String)iCmd.processCommand(req, resp);
		RequestDispatcher view =
				req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}

	
}
