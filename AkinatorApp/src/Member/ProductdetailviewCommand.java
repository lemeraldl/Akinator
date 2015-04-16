package Member;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.testDao;
import main.testDto;

public class ProductdetailviewCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		res.setCharacterEncoding("euc-kr");
		/*<jsp:useBean id="dto" class="main.testDto"/>
		<jsp:useBean id="dto_zzim" class="main.testDto"/>
		<jsp:useBean id="dao" class="main.testDao"/>
		<jsp:useBean id="testDto" class="main.testDto"></jsp:useBean>*/
		testDto dto=new testDto();
		testDao dao=new testDao();
		testDto dto_zzim=new testDto();
		testDto testDto=new testDto();
		FollowcountProductcount followcount=new FollowcountProductcount();// �ȷο� ����  ��밡�� �ø� ��ǰ�� 
		FollowcountProductcount productcount=new FollowcountProductcount();// �ȷο� ����  ��밡�� �ø� ��ǰ��
		
		int usernum = 0;
		HttpSession session =req.getSession();
		if(session.getAttribute("usernum") != null){
		   usernum= Integer.parseInt((String)session.getAttribute("usernum"));
		}
		
		System.out.println("usernum �� : " + usernum);
		int productnum=Integer.parseInt(req.getParameter("num"));// ������������ �������� �����µ� 
		System.out.println("productdetail ��productnum��"+productnum);
		String id =null;
		if(session.getAttribute("id")!=null){
		   id= (String)session.getAttribute("id");
		}
		System.out.println("productnum��"+productnum);
		 dao.insertCountnum(productnum);
		 dao.getZzimnum(productnum);
		 dto=dao.getDetailinfo(productnum);// product���� 
		 int usnum=dto.getNum();
		 System.out.println("productdetailview�� ������"+usnum);
		 followcount=dao.getFollowcount(usnum);// followcount 
		 System.out.println("productdetail�� followcount"+followcount.getFollowcount());
		 //productcount=dao.getproductcount(usernum);// productcount
		String sellername=dto.getSellerName();
		productcount=dao.getproductcount(sellername);// �̰� ��¥ produccout
		System.out.println("productdetail�� productcount"+productcount.getProductcount());
		 testDto=dao.getDetailinfo(productnum);
		 dto_zzim=dao.getZzimnum(productnum);
		 
		    Vector getReply = dao.getreplylist(productnum);
		    String textarea=req.getParameter("textarea");
		    int testnum=0;
		
		    req.setAttribute("productdetailviewdto", dto);
		    req.setAttribute("productdetailtestdto", testDto);
		    req.setAttribute("productdetaildto_zzim", dto_zzim);
		    req.setAttribute("productdetailrepvector", getReply);
		    req.setAttribute("productdetailviewproductnum", productnum);
		    req.setAttribute("productdetailviewusernum", usernum);
		    req.setAttribute("productdetail_followcount", followcount);
		    req.setAttribute("productdetail_productcount", productcount);
		    
		    
		    int	num=Integer.parseInt(req.getParameter("num"));
		return "/TeamAkinator/productdetail.jsp?"+num;
	}

}
