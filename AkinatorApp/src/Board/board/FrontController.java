package Board.board;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FrontController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {	
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {		
		req.setCharacterEncoding("EUC-KR");
		resp.setCharacterEncoding("EUC-KR");
		String nextPage ="";
		Vector v = new Vector();
		BoardDto dto = new BoardDto();
		HttpSession session = req.getSession();
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd = req.getParameter("command");
		
		
		if(cmd.equals("BOARDMAIN")){
			
//			int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
			
		}
		
		else if(cmd.equals("POST")){
			dto.setName(req.getParameter("name"));
//			System.out.println("FrontController > POST : "+dto.getName());
			dto.setEmail(req.getParameter("email"));
			dto.setPhone(req.getParameter("phone"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
//			dto.setIp(req.getParameter("ip"));
			dto.setIp(req.getRemoteAddr());
			v.add(dto);
			req.setAttribute("board_info", v);
		}
		else if(cmd.equals("UPDATE")){
			int num = Integer.parseInt((String)req.getParameter("num"));
//			System.out.println("FrontController > UPDATE" + num);
			dto.setNum(num);
			dto.setName(req.getParameter("name"));			
			dto.setSubject(req.getParameter("subject"));			
			dto.setEmail(req.getParameter("email"));
			dto.setContent(req.getParameter("content"));		
			v.add(dto);
			req.setAttribute("board_update", v);				
		}
		else if(cmd.equals("READ")){
			int num = Integer.parseInt((String)req.getParameter("num"));			
			String keyField = req.getParameter("keyField");
			String keyWord = req.getParameter("keyWord");
			req.setAttribute("num", num);
			req.setAttribute("keyField", keyField);
			req.setAttribute("keyWord", keyWord);
			// Vector �����̸��� �ٸ��� �ϰų� req.setAttribute�� ���� �̸��� �ٸ��� �ؼ� ����
			
//			System.out.println("Front > READ" + num);
		}
		else if(cmd.equals("DELETE")){
//			System.out.println("FRONT CONTROLLER > DELETE");
			int num = Integer.parseInt((String)req.getParameter("num"));
			req.setAttribute("num", num);			
		}
		else if(cmd.equals("GETBOARD")){
			int num = Integer.parseInt((String)req.getParameter("num"));
			req.setAttribute("num", num);	
//			System.out.println("GETBOARD" + num);
		}
		else if(cmd.equals("REPLYGETBOARD")){
			int num = Integer.parseInt((String)req.getParameter("num"));
			req.setAttribute("num", num);
		}
		else if(cmd.equals("REPLY")){			
			int num = Integer.parseInt((String)req.getParameter("num"));
			String ip = req.getParameter("ip");
			System.out.println("�ù�"+ip);
			req.setAttribute("num", num);	
			//�г���, �̸���, �� ��ȣ, ����, ����
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setPhone(req.getParameter("phone"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setIp(req.getParameter("ip"));
			v.add(dto);
			
			req.setAttribute("reply", v);
		}
		
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);
		
		nextPage = (String)iCmd.processCommand(req, resp);
		
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	

}
