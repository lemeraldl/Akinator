package Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FrontController extends HttpServlet {

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
      
      if(cmd.equals("REGCONFIRM") || cmd.equals("REGCOMPLETE")){         
         dto.setMem_phone(req.getParameter("phone"));
         dto.setMem_pass(req.getParameter("pass"));
         dto.setMem_id(req.getParameter("id"));
         dto.setMem_email(req.getParameter("email"));
         dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
         System.out.println("����Ʈ ��Ʈ���� ���ͷ���Ʈ1"+req.getParameter("interest1_keyword") );
         dto.setInterest2_keyword(req.getParameter("interest2_keyword"));
         System.out.println("����Ʈ ��Ʈ���� ���ͷ���Ʈ2 "+req.getParameter("interest2_keyword") );
         dto.setInterest3_keyword(req.getParameter("interest3_keyword"));
         System.out.println("����Ʈ ��Ʈ���� ���ͷ���Ʈ2 "+req.getParameter("interest3_keyword") );
         v.add(dto);
         session.setAttribute("member", v);
      }
      if(cmd.equals("REGCONFIRMED")){         
    	  dto.setMem_phone(req.getParameter("phone"));
    	  dto.setMem_pass(req.getParameter("pass"));
    	  dto.setMem_id(req.getParameter("id"));
    	  dto.setMem_email(req.getParameter("email"));
    	  dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
          dto.setInterest2_keyword(req.getParameter("interest2_keyword"));
          dto.setInterest3_keyword(req.getParameter("interest3_keyword"));
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
         System.out.println("FrontController�ʹٲٴ�Ű����1"+dto.getInterest1_keyword());
         dto.setInterest2_keyword(req.getParameter("interest2_keyword"));
        System.out.println("FrontController�ʹٲٴ�Ű����2"+dto.getInterest2_keyword());
         dto.setInterest3_keyword(req.getParameter("interest3_keyword"));
        System.out.println("FrontController�ʹٲٴ�Ű����3"+dto.getInterest3_keyword());
         
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
         
         dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
         System.out.println("�ٲٴ�Ű����1"+dto.getInterest1_keyword());
         dto.setInterest1_keyword(req.getParameter("interest2_keyword"));
        System.out.println("�ٲٴ� Ű����2"+dto.getInterest2_keyword());
         dto.setInterest1_keyword(req.getParameter("interest3_keyword"));
        System.out.println("�ٲٴ� Ű����3"+dto.getInterest3_keyword());
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