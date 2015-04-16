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
	private String path;	//���� �����ų ���
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
		
		//���ϸ� ����
		String saveFiles1="";
		String saveFiles2="";
		String saveFiles3="";
		String saveFiles4="";
		String saveFiles5="";
		String saveFiles6="";
		
		setPath(req, "/Mokhwan/upload");
		//���� �޾Ƶ鿩�� ����Ǵ� �κ�
		multi = new MultipartRequest(req, path, max, encType, new DefaultFileRenamePolicy());
		
		//���� �̸� �����ϴ� �κ� ��ο� ���ļ� �����Ϸ��� ��.
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
		
		
		//regProduct.jsp���� �޾ƿ��� ����
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
		
		//���丮���� cmd�� �޾Ƽ� ������ java���� �����ϵ��� Ŀ�ǵ尪 ����
		cmd = "REGDB";
		
		
		HttpSession session = req.getSession();		//java���Ͽ����� httpSession�� import ���Ѿ� session �̿� ����.
		session.setAttribute("upCheck", "next");	//����

		//dto���ٰ� �� �����ϱ� ���� ���ͷ� �޾Ƽ� ��Ʈ����Ʈ�� �����Ű��
		Vector v = new Vector();
		DataDto dto = new DataDto();
		
		dto.setBuydate(buydate);		//��ǰ���Խñ�
		dto.setGoodsname(goodsname);	//��ǰ��
		dto.setQuantity(quantity);		//��ǰ����
		dto.setPrice(price);			//��ǰ����
		dto.setProductcontents(productcontents);		//��ǰ�󼼳���
		dto.setTag(tag);				//��ǰ�±�
		dto.setSepaycheck(sepaycheck);				//������������(checkbox)
		dto.setDelipaycheck(delipaycheck);				//�ù�񿩺�(checkbox)
		dto.setTradecheck(tradecheck);				//��ȯ���ɿ���(checkbox)
		dto.setProducimg1(producimg1);			//������ ��ο� �����̸�
		dto.setProducimg2(producimg2);			//������ ��ο� �����̸�
		dto.setProducimg3(producimg3);			//������ ��ο� �����̸�
		dto.setProducimg4(producimg4);			//������ ��ο� �����̸�
		dto.setProducimg5(producimg5);			//������ ��ο� �����̸�
		dto.setProducimg6(producimg6);			//������ ��ο� �����̸�
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
