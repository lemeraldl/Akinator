package NewSpeed;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FrontController extends HttpServlet{
	private String nextPage = "";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {	
		System.out.println(req+"//"+resp);
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		NewSpeedDto dto = new NewSpeedDto();
		HttpSession session = req.getSession();
		Vector v = new Vector();

		
		String cmd = req.getParameter("command");
		
		if(cmd.equals("NEWSPEED")){
			int productnum = Integer.parseInt((String)req.getParameter("productnum"));			
			int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
			System.out.println("들어오나");
			dto.setUsernum(usernum);
			dto.setProductnum(productnum);
			v.add(dto);
			req.setAttribute("newspeed", v);
					
			
//			req.setAttribute("usernum", usernum); // 로그인 한 유저번호			
//			dto.setUsernum(usernum);
						
			// 상품을 올린 유저번호
			System.out.println("상품번호" + productnum);
		}
		
		else if(cmd.equals("NEWSPEEDMAIN")){
			System.out.println("들어오십시오");
		}
		else if(cmd.equals("GETNEWSPEED")){
			System.out.println("일단 여기를 와야하고");
		}	
		
//		CommandFactory factory = CommandFactory.getInstance(); // 싱글톤 패턴 호출
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);	
	      
	      nextPage = (String) iCmd.processCommand(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}
