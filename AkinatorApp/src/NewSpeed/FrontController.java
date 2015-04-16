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
			System.out.println("������");
			dto.setUsernum(usernum);
			dto.setProductnum(productnum);
			v.add(dto);
			req.setAttribute("newspeed", v);
					
			
//			req.setAttribute("usernum", usernum); // �α��� �� ������ȣ			
//			dto.setUsernum(usernum);
						
			// ��ǰ�� �ø� ������ȣ
			System.out.println("��ǰ��ȣ" + productnum);
		}
		
		else if(cmd.equals("NEWSPEEDMAIN")){
			System.out.println("�����ʽÿ�");
		}
		else if(cmd.equals("GETNEWSPEED")){
			System.out.println("�ϴ� ���⸦ �;��ϰ�");
		}	
		
//		CommandFactory factory = CommandFactory.getInstance(); // �̱��� ���� ȣ��
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);	
	      
	      nextPage = (String) iCmd.processCommand(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}
