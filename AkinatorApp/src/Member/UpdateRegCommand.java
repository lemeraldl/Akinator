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

import encrypt.AES128;
import AkinatorDB.DBConnectionMgr;
// ���� ȸ������ ���� �κ�
public class UpdateRegCommand implements ICommand{
   private Connection con = null;
   private PreparedStatement stmt = null;
   private ResultSet rs = null;
   private DBConnectionMgr pool = null;
   private String sql = null;
   AES128 enc = new AES128();
   
   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      // ȸ�� ���� ���� ����
      String update = req.getParameter("info"); // Ŭ���̾�Ʈ�� ���� ���� ����
      MemberDto dto = new MemberDto();
      Vector v = new Vector();
      HttpSession session = req.getSession();
      
      v = (Vector) req.getAttribute("update");
      for(int i=0; i<v.size(); i++){
         dto = (MemberDto) v.get(i);
      }
      String phone = dto.getMem_phone();
      String email = dto.getMem_email();
      String pass = dto.getMem_pass(); // ���� ���
      String id = dto.getMem_id();
      String chpass = dto.getMem_chpass(); // �ٲ� ���
      String INTEREST1_KEYWORD=dto.getInterest1_keyword();
      String INTEREST2_KEYWORD=dto.getInterest2_keyword();
      String INTEREST3_KEYWORD=dto.getInterest3_keyword();
      
      System.out.println("updateRegcommand��"+INTEREST1_KEYWORD);
      System.out.println("updateRegcommand��"+INTEREST2_KEYWORD);
      System.out.println("updateRegcommand��"+INTEREST3_KEYWORD);
      
      int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
            
      
      try{
         pool = pool.getInstance();
         con = pool.getConnection();
         if(con != null){
            System.out.println("UpdateRegCommand DB ���� ����!");
         }
//          sql = "select * from userboard where usernum=?";
//         stmt = con.prepareStatement(sql);
//         stmt.setInt(1, usernum);
//         stmt.executeQuery();
         sql = "select * from userboard where usernum=?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, usernum);
         rs = stmt.executeQuery();
         
         if(rs.next()){      
        	 String decPass = enc.decrypt(rs.getString("pass"));
             if(!(pass.equals(decPass))){
               System.out.println("���� ��� ����ġ!");
               return "/TeamAkinator/mypage2proc.jsp?check=passno";               
            }
             else if(pass.equals(decPass)){ // ���� ��й�ȣ�� ��ġ�� ���
                  System.out.println("���� ��� ��ġ!");      
         
          sql = "update userboard set id=?, phonenum=?, email=?, pass=? ,interest1_keyword=?, interest2_keyword=?, interest3_keyword=? where usernum=?";
         stmt = con.prepareStatement(sql);
         System.out.println("���?"+dto.getMem_id());
         stmt.setString(1, dto.getMem_id());
         stmt.setString(2, dto.getMem_phone());
         stmt.setString(3, dto.getMem_email());
         stmt.setString(4, enc.encrypt(dto.getMem_chpass()));
         stmt.setString(5, dto.getInterest1_keyword());
         stmt.setString(6, dto.getInterest2_keyword());
         stmt.setString(7, dto.getInterest3_keyword());
         stmt.setInt(8, usernum);
         System.out.println("ȸ������ ���� ����!");
         stmt.executeUpdate();         
      }
         }
         }
      catch(Exception err){
         System.out.println("UpdateRegCommand DB ���� ����" + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }      
      return "/TeamAkinator/mypage2proc.jsp?check=passok";
   }

}