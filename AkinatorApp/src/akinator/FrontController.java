package akinator;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FrontController extends HttpServlet{
	private MultipartRequest multi;
	private String path;	//파일 저장시킬 경로
	private int max = 5*1024*1024;
	private String encType="euc-kr";
	
	private String cmd;
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
		
		//파일명 변수
		String saveFiles1="";
		String saveFiles2="";
		String saveFiles3="";
		String saveFiles4="";
		String saveFiles5="";
		String saveFiles6="";
		
		setPath(req, "/Mokhwan/upload");
		//파일 받아들여서 저장되는 부분
		multi = new MultipartRequest(req, path, max, encType, new DefaultFileRenamePolicy());
		
		//파일 이름 저장하는 부분 경로와 합쳐서 저장하려고 함.
		int imageChange=1;
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()){
			String filesName = (String)files.nextElement();
			if(imageChange==1){
				saveFiles1 += (String)multi.getFilesystemName(filesName);
			}
			if(imageChange==2){
				saveFiles2 += (String)multi.getFilesystemName(filesName);
			}
			if(imageChange==3){
				saveFiles3 += (String)multi.getFilesystemName(filesName);
			}
			if(imageChange==4){
				saveFiles4 += (String)multi.getFilesystemName(filesName);
			}
			if(imageChange==5){
				saveFiles5 += (String)multi.getFilesystemName(filesName);
			}
			if(imageChange==6){
				saveFiles6 += (String)multi.getFilesystemName(filesName);
				break;
			}
			imageChange++;
		}
		
		
		//regProduct.jsp에서 받아오는 값들
		String buydate = multi.getParameter("buydate");
		String goodsname = multi.getParameter("goodsname");
		int quantity = Integer.parseInt(multi.getParameter("quantity"));
		int price = Integer.parseInt(multi.getParameter("price"));
		String productcontents = multi.getParameter("productcontents").replace("\n", "<br/>");
		String tag = multi.getParameter("tag");
		String sepaycheck = multi.getParameter("sepaycheck");
		String delipaycheck = multi.getParameter("delipaycheck");
		String tradecheck = multi.getParameter("tradecheck");
		String producimg1 = saveFiles1;
		String producimg2 = saveFiles2;
		String producimg3 = saveFiles3;
		String producimg4 = saveFiles4;
		String producimg5 = saveFiles5;
		String producimg6 = saveFiles6;
		String useddegree = multi.getParameter("useddegree");
		String bigCategory = multi.getParameter("bigCategory");
		String smallCategory = multi.getParameter("opt");
		int usernum = Integer.parseInt(multi.getParameter("usernum"));
		String id = multi.getParameter("id");
		
		//팩토리에서 cmd값 받아서 실행할 java파일 선택하도록 커맨드값 저장
		cmd = "REGDB";
		
		
		HttpSession session = req.getSession();		//java파일에서는 httpSession을 import 시켜야 session 이용 가능.
		session.setAttribute("upCheck", "next");	//ㅇㅇ

		//dto에다가 값 저장하기 위해 벡터로 받아서 어트리뷰트에 저장시키기
		Vector v = new Vector();
		DataDto dto = new DataDto();
		
		dto.setBuydate(buydate);		//상품구입시기
		dto.setGoodsname(goodsname);	//상품명
		dto.setQuantity(quantity);		//상품수량
		dto.setPrice(price);			//상품가격
		dto.setProductcontents(productcontents);		//상품상세내용
		dto.setTag(tag);				//상품태그
		dto.setSepaycheck(sepaycheck);				//안전결제여부(checkbox)
		dto.setDelipaycheck(delipaycheck);				//택배비여부(checkbox)
		dto.setTradecheck(tradecheck);				//교환가능여부(checkbox)
		dto.setProducimg1(producimg1);			//파일의 경로와 파일이름
		dto.setProducimg2(producimg2);			//파일의 경로와 파일이름
		dto.setProducimg3(producimg3);			//파일의 경로와 파일이름
		dto.setProducimg4(producimg4);			//파일의 경로와 파일이름
		dto.setProducimg5(producimg5);			//파일의 경로와 파일이름
		dto.setProducimg6(producimg6);			//파일의 경로와 파일이름
		dto.setUseddegree(useddegree);
		dto.setBigCategory(bigCategory);
		dto.setSmallCategory(smallCategory);
		dto.setUsernum(usernum);
		dto.setId(id);
		
		v.add(dto);
		req.setAttribute("data", v);
		
		String nextPage ="";
		
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);
		nextPage = (String)iCmd.processCommand(req, resp);
		
		RequestDispatcher view =
				req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
	public void setPath(HttpServletRequest req, String path){
		this.path = req.getServletContext().getRealPath(path); 
	}
}
