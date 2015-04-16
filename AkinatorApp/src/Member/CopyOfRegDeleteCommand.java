package Member;
// ȸ�� Ż�� �κ�
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;

public class CopyOfRegDeleteCommand implements ICommand{
   private Connection con;
   private PreparedStatement stmt;
   private ResultSet rs;
   private DBConnectionMgr pool;
   
   
   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      HttpSession session = req.getSession();
      int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
      try{
         
         pool = pool.getInstance();
         con = pool.getConnection();
         if(con != null){
            System.out.println("DB���� ����");
         }
         else{
            System.out.println("RegDeleteCommand DB�������");
         }         
               String sql = "DELETE FROM userboard WHERE usernum=?";
               
               stmt= con.prepareStatement(sql);
               stmt.setInt(1, usernum);
               System.out.println(sql);
               stmt.executeUpdate();
               System.out.println("Ż�� �� �̻��� ���� ���Խ�Ű����");
               session.invalidate(); // ���� ���� �� ����
               return "/TeamAkinator/mypage2proc.jsp?check=bye";
               
      }
      catch(Exception err){
         System.out.println();
      }
      finally{
         pool.freeConnection(con, stmt);
      }
      
      return null;
   }

}