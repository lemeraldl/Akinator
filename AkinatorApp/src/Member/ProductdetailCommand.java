package Member;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.testDao;
import main.testDto;

public class ProductdetailCommand implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		testDao dao=new testDao();
		//testDto	dto=new testDto();
			
		   req.setCharacterEncoding("euc-kr");
		   res.setCharacterEncoding("euc-kr");
		   int productnum=Integer.parseInt(req.getParameter("num"));
		HttpSession session =req.getSession();
		System.out.println("session은 "+session);
		
		FollowcountProductcount followcount=new FollowcountProductcount();// 팔로우 수랑  사용가가 올린 상품수 
		FollowcountProductcount productcount=new FollowcountProductcount();// 팔로우 수랑  사용가가 올린 상품수
		
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		   String textarea=req.getParameter("textarea");
		   String id = (String)session.getAttribute("id");
		   if(textarea!=null||textarea.equals(null)||null!=textarea||textarea.isEmpty()){
		      dao.replyupdate(textarea, productnum,usernum,id);
		   }
		   System.out.println("프록시의 textarea는"+textarea);
		   System.out.println("댓글이 입력댔습니다.");


			testDto dto=new testDto();
			
			testDto dto_zzim=new testDto();
			testDto testDto=new testDto();
		
			
			if(session.getAttribute("usernum") != null){
			   usernum= Integer.parseInt((String)session.getAttribute("usernum"));
			}
			
			System.out.println("usernum 는 : " + usernum);
			if(session.getAttribute("id")!=null){
			   id= (String)session.getAttribute("id");
			}
			System.out.println(productnum);
			 dao.insertCountnum(productnum);
			 dao.getZzimnum(productnum);
			 
			 followcount=dao.getFollowcount(usernum);// followcount 
			// productcount=dao.getproductcount(usernum);// productcount
			 
			 dto=dao.getDetailinfo(productnum);
			 testDto=dao.getDetailinfo(productnum);
			 dto_zzim=dao.getZzimnum(productnum);
			 
			    Vector getReply = dao.getreplylist(productnum);
			 
			    req.setAttribute("productdetailviewdto", dto);
			    req.setAttribute("productdetailtestdto", testDto);
			    req.setAttribute("productdetaildto_zzim", dto_zzim);
			    req.setAttribute("productdetailrepvector", getReply);
			    req.setAttribute("productdetailviewproductnum", productnum);
			    req.setAttribute("productdetailviewusernum", usernum);
			    req.setAttribute("productdetail_followcount", followcount);
			    //req.setAttribute("productdetail_productcount", productcount);
			    
			    
			    int	num=Integer.parseInt(req.getParameter("num"));
		return  "/TeamAkinator/productdetail.jsp?num="+productnum;
	}

}
