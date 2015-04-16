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
	private String path = "C:\\AkinatorApp\\AkiantorSemi\\Akiamazonewarver\\WebContent\\Mokhwan\\upload";	//파일 저장시킬 경로
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
      Vector v = new Vector(); // 클라이언트 측으로 부터 받은 정보를 담기위한 벡터 함수 준비
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
      
      System.out.println("profile이미지"+saveFiles1);

      
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
          System.out.println("regconfirmed쪽"+req.getParameter("INTEREST1_KEYWORD"));
          
    	  v.add(dto);
    	  session.setAttribute("member", v);
      }
      else if(cmd.equals("LOGIN")){      
         dto.setMem_phone(req.getParameter("phone"));
         dto.setMem_pass(req.getParameter("pass"));
         v.add(dto);
         req.setAttribute("login", v);
      }
      else if(cmd.equals("SEARCH")){ // 아이디 조회
         dto.setMem_id(req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));
         System.out.println(dto.getMem_phone());
         String ids = dto.getMem_id();
         System.out.println("FRONT컨트롤러 " + ids);
         req.setAttribute("ids", ids);

      }
      else if(cmd.equals("UPDATE")){ // 회원 정보 수정   
    	  
    	  System.out.println("이업데이트도 들어오나??");
         int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
         System.out.println("UPDATE" + usernum);         
         System.out.println("UPDATE" + req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));         
         dto.setMem_id(req.getParameter("id"));         
         dto.setMem_pass(req.getParameter("nowpass")); // 현재 비밀번호
         System.out.println("현재 비번" + dto.getMem_pass());
         dto.setMem_chpass(req.getParameter("pwconfirm")); // 바꿀 비밀번호
         System.out.println("바꿀 비번" + dto.getMem_chpass());
         dto.setMem_email(req.getParameter("email"));  
         
         dto.setInterest1_keyword(req.getParameter("interest1_keyword"));
         dto.setInterest1_keyword(req.getParameter("interest2_keyword"));
         dto.setInterest1_keyword(req.getParameter("interest3_keyword"));
         v.add(dto);         
         System.out.println("FrontController-UPDATE에서 Vector에 담음");
         req.setAttribute("update", v);
      }
      
//      else if(yongtip.equals("DELETE")){ // 회원 탈퇴
         else if(cmd.equals("DELETE")){ // 회원 탈퇴
   
         int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
         System.out.println("DELETE" + usernum);         
         System.out.println("DELETE" + req.getParameter("id"));
         dto.setMem_phone(req.getParameter("phone"));         
         dto.setMem_id(req.getParameter("id"));         
         dto.setMem_pass(req.getParameter("nowpass")); // 현재 비밀번호
         System.out.println("현재 비번" + dto.getMem_pass());
         dto.setMem_chpass(req.getParameter("pwconfirm")); // 바꿀 비밀번호
         System.out.println("바꿀 비번" + dto.getMem_chpass());
         dto.setMem_email(req.getParameter("email"));         
         v.add(dto);         
         System.out.println("FrontController-DELETE에서 Vector에 담음");
         req.setAttribute("DELETE", v);
      }
         else if(cmd.equals("FINDPASSWORD")){
        	 System.out.println(req.getParameter("phonenum"));
         }

      
      CommandFactory factory = CommandFactory.getInstance(); // 싱글톤 패턴 호출      
      ICommand iCmd = factory.createComand(cmd,dto); // CommandFactory의 createCommand 함수 전체를 iCmd에 넣음
      nextPage = (String) iCmd.processCommand(req, resp);
      
      RequestDispatcher view = req.getRequestDispatcher(nextPage); // 주소창에 주소가 바뀌지 않아요..
      view.forward(req, resp);
      
   }


}