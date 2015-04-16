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
		FollowcountProductcount followcount=new FollowcountProductcount();// 팔로우 수랑  사용가가 올린 상품수 
		FollowcountProductcount productcount=new FollowcountProductcount();// 팔로우 수랑  사용가가 올린 상품수
		
		int usernum = 0;
		HttpSession session =req.getSession();
		if(session.getAttribute("usernum") != null){
		   usernum= Integer.parseInt((String)session.getAttribute("usernum"));
		}
		
		System.out.println("usernum 는 : " + usernum);
		int productnum=Integer.parseInt(req.getParameter("num"));// 전페이지에서 히든으로 던지는듯 
		System.out.println("productdetail 쪽productnum은"+productnum);
		String id =null;
		if(session.getAttribute("id")!=null){
		   id= (String)session.getAttribute("id");
		}
		System.out.println("productnum은"+productnum);
		 dao.insertCountnum(productnum);
		 dao.getZzimnum(productnum);
		 dto=dao.getDetailinfo(productnum);// product정보 
		 int usnum=dto.getNum();
		 System.out.println("productdetailview쪽 유저넘"+usnum);
		 followcount=dao.getFollowcount(usnum);// followcount 
		 System.out.println("productdetail쪽 followcount"+followcount.getFollowcount());
		 //productcount=dao.getproductcount(usernum);// productcount
		String sellername=dto.getSellerName();
		productcount=dao.getproductcount(sellername);// 이게 진짜 produccout
		System.out.println("productdetail쪽 productcount"+productcount.getProductcount());
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
