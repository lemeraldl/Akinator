package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;

public class MyPageCommand implements ICommand{
	private Connection con = null;
	   private PreparedStatement stmt = null;
	   private ResultSet rs = null;
	   private DBConnectionMgr pool = null;
	   private DBConnection db = new DBConnection();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		//ȸ�� ���� �ѷ��ֱ�
		 MemberDto dto = new MemberDto();
			Vector v = new Vector();
/*
		int usernum = Integer.parseInt((String)session.getAttribute("usernum")); 
       dto.setMem_id(req.getParameter("id"));
       dto.setMem_pass(req.getParameter("nowpass"));
       dto.setMem_chpass(req.getParameter("pwconfirm"));
       dto.setMem_email(req.getParameter("email"));
		*/
		int myuser = Integer.parseInt((String)session.getAttribute("usernum"));
		System.out.println("��������?"+myuser);
		//ȸ������ �޾ƿ���
		try{
            con = db.connection();            
            if(con!=null){
               System.out.println("RegConfirm DB���� ����!");
            }
            
            String sql = "select * from userboard where usernum=?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, myuser);
            rs = stmt.executeQuery();
            
            while(rs.next()){
            	dto.setMem_id(rs.getString("id"));
            	dto.setMem_phone(rs.getString("phonenum"));
            	dto.setMem_email(rs.getString("email"));
            	
            	dto.setInterest1_keyword(rs.getString("interest1_keyword"));
            	dto.setInterest2_keyword(rs.getString("interest2_keyword"));
            	dto.setInterest3_keyword(rs.getString("interest3_keyword"));
            	System.out.println("7��29��" + rs.getString("id"));
            	System.out.println("mypageCommand" + rs.getString("interest1_keyword"));
            	System.out.println("mypageCommand" + rs.getString("interest2_keyword"));
            	System.out.println("7��29��" + rs.getString("interest3_keyword"));
            	System.out.println("mypageCommand�� id��"+dto.getMem_id());
            	
            	
            String	interest1=dto.getInterest1_keyword();
            System.out.println(interest1);
            	System.out.println("maypageCommand�� ���ͷ���Ʈ1"+dto.getInterest1_keyword());
            	System.out.println("maypageCommand�� ���ͷ���Ʈ2"+dto.getInterest2_keyword());
            	System.out.println("maypageCommand�� ���ͷ���Ʈ3"+dto.getInterest3_keyword());
            	
            }
		}
		catch(Exception e){
			System.out.println(e);
		}
        
        req.setAttribute("mvcMypage", dto);
        
		
		return "/TeamAkinator/mypage.jsp";
	}

}
