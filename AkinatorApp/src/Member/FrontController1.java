package Member;

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

public class FrontController1 extends HttpServlet {
	private MultipartRequest multi;
	private String path = "C:\\AkinatorApp\\AkiantorSemi\\Akiamazonewarver\\WebContent\\Mokhwan\\upload";	//���� �����ų ���
		private int max = 5*1024*1024;
		private String encType="euc-kr";
		
	
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      MemberDto dto = new MemberDto();
      HttpSession session = req.getSession();
      Vector v = new Vector(); // Ŭ���̾�Ʈ ������ ���� ���� ������ ������� ���� �Լ� �غ�
      String nextPage = "";
      

      
      req.setCharacterEncoding("EUC-KR");
      String cmd = req.getParameter("command"); 
      
      String saveFiles1="";
      multi = new MultipartRequest(req, path, max, encType, new DefaultFileRenamePolicy());
      Enumeration files = multi.getFileNames();
      while (files.hasMoreElements()){
      			String filesName = (String)files.nextElement();
      		saveFiles1 = (String)multi.getFilesystemName(filesName);
      			
      		}
      
      System.out.println("profile�̹���"+saveFiles1);

      
      if(cmd.equals("REGCONFIRM") || cmd.equals("REGCOMPLETE")){         
         dto.setMem_phone(req.getParameter("phone"));
         dto.setMem_pass(req.getParameter("pass"));
         dto.setMem_id(req.getParameter("id"));
         dto.setMem_email(req.getParameter("email"));
         dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
         dto.setInterest2_keyword(req.getParameter("interest2_keyword"));
         dto.setInterest3_keyword(req.getParameter("interest3_keyword"));
    
         v.add(dto);
         session.setAttribute("member", v);
      }
      if(cmd.equals("REGCONFIRMED")){         
    	  dto.setMem_phone(req.getParameter("phone"));
    	  dto.setMem_pass(req.getParameter("pass"));
    	  dto.setMem_id(req.getParameter("id"));
    	  dto.setMem_email(req.getParameter("email"));
    	  dto.setInterest1_keyword(req.getParameter("INTEREST1_KEYWORD"));
          dto.setInterest2_keyword(req.getParameter("INTEREST2_KEYWORD"));
          dto.setInterest3_keyword(req.getParameter("INTEREST3_KEYWORD"));
          System.out.println("regconfirmed��"+req.getParameter("INTEREST1_KEYWORD"));
          
    	  v.add(dto);
    	  session.setAttribute("member", v);
      }
      else if(cmd.equals("LOGIN")){      
         dto.setMem_phone(req.getParameter("phone"));
         dto.setMem_pass(req.getParameter("pass"));
         v.add(dto);
         req.setAttribute("login", v);
      }
      else if(cmd.equals("SEARCH")){ // ���̵� ��ȸ
         dto.setMem_id(req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));
         System.out.println(dto.getMem_phone());
         String ids = dto.getMem_id();
         System.out.println("FRONT��Ʈ�ѷ� " + ids);
         req.setAttribute("ids", ids);

      }
      else if(cmd.equals("UPDATE")){ // ȸ�� ���� ����   
    	  
    	  System.out.println("�̾�����Ʈ�� ������??");
         int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
         System.out.println("UPDATE" + usernum);         
         System.out.println("UPDATE" + req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));         
         dto.setMem_id(req.getParameter("id"));         
         dto.setMem_pass(req.getParameter("nowpass")); // ���� ��й�ȣ
         System.out.println("���� ���" + dto.getMem_pass());
         dto.setMem_chpass(req.getParameter("pwconfirm")); // �ٲ� ��й�ȣ
         System.out.println("�ٲ� ���" + dto.getMem_chpass());
         dto.setMem_email(req.getParameter("email"));  
         
         dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
         dto.setInterest1_keyword(req.getParameter("interest2_keyword"));
         dto.setInterest1_keyword(req.getParameter("interest3_keyword"));
         v.add(dto);         
         System.out.println("FrontController-UPDATE���� Vector�� ����");
         req.setAttribute("update", v);
      }
      
//      else if(yongtip.equals("DELETE")){ // ȸ�� Ż��
         else if(cmd.equals("DELETE")){ // ȸ�� Ż��
   
         int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
         System.out.println("DELETE" + usernum);         
         System.out.println("DELETE" + req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));         
         dto.setMem_id(req.getParameter("id"));         
         dto.setMem_pass(req.getParameter("nowpass")); // ���� ��й�ȣ
         System.out.println("���� ���" + dto.getMem_pass());
         dto.setMem_chpass(req.getParameter("pwconfirm")); // �ٲ� ��й�ȣ
         System.out.println("�ٲ� ���" + dto.getMem_chpass());
         dto.setMem_email(req.getParameter("email"));         
         v.add(dto);         
         System.out.println("FrontController-DELETE���� Vector�� ����");
         req.setAttribute("DELETE", v);
      }
         else if(cmd.equals("FINDPASSWORD")){
        	 System.out.println(req.getParameter("phonenum"));
         }

      
      CommandFactory factory = CommandFactory.getInstance(); // �̱��� ���� ȣ��      
      ICommand iCmd = factory.createComand(cmd,dto); // CommandFactory�� createCommand �Լ� ��ü�� iCmd�� ����
      nextPage = (String) iCmd.processCommand(req, resp);
      
      RequestDispatcher view = req.getRequestDispatcher(nextPage); // �ּ�â�� �ּҰ� �ٲ��� �ʾƿ�..
      view.forward(req, resp);
      
   }


}