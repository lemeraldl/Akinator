package Member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.testDao;
import main.testDto;

public class PayviewCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		testDto dto=new testDto();
		testDao dao=new testDao();
		
		int productNum = Integer.parseInt(req.getParameter("productNum"));
 			dto=dao.getDetailinfo(productNum);
 		int usernum=Integer.parseInt(req.getParameter("usernum"));
  
 		
 		req.setAttribute("productNum", productNum);
 		req.setAttribute("usernum", usernum);
 		req.setAttribute("payviewdto", dto);
 		
 		System.out.println("여기까지는 오냐??");
 		
 		//return "pay1el.jsp";
		return "/TeamAkinator/pay.jsp?productNum="+productNum+"&usernum="+usernum;
	}


}
