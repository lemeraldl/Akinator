package Member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.payDao;
import main.payDto;

public class PayCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 
		System.out.println("payÀÚ¹ÙÂÊ");
		payDto paydto=new payDto();
		payDao paydao=new payDao();
		
		req.setCharacterEncoding("euc-kr");

		  String Inname=req.getParameter("Inname");
		  String   goods=req.getParameter("goods");
		  int   amount=Integer.parseInt(req.getParameter("amount"));
		  int price=Integer.parseInt(req.getParameter("price"));

		  String message=req.getParameter("message");

		     paydto.setOrdname(Inname);
		     paydto.setOrdaccountnum(goods);
		    paydto.setBuynumber(amount);
		     paydto.setPrice(price);

		     
		    int usernum=Integer.parseInt(req.getParameter("usernum"));
		     
		     
		     
		     paydao.insertpay(paydto,usernum);  
		     
		     return "/TeamAkinator/Index.jsp";
	
	}

}
