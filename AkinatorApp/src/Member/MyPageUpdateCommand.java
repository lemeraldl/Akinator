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

public class MyPageUpdateCommand implements ICommand{
   private Connection con = null;
   private PreparedStatement stmt = null;
   private ResultSet rs = null;
   private String check = null;
   private DBConnection db = new DBConnection();
   private DBConnectionMgr pool = new DBConnectionMgr();
   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      HttpSession session = req.getSession();
 
      System.out.println("안넘어오나?");
      
      MemberDto dto = new MemberDto();
      Vector v = new Vector();
      
      String sql = "";
      
      try{
         con = db.connection();
         v = (Vector)req.getAttribute("member");
         
      if(con != null){
            System.out.println("DB 연결 완료!");
           
            sql = "update userboard set id=?, phonenum=?, email=?, pass=? where usernum=?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, dto.getMem_id());
            stmt.setString(2, dto.getMem_phone());
            stmt.setString(3, dto.getMem_email());
            stmt.setString(4, dto.getMem_chpass());
            System.out.println("회원정보 변경 성공!");
            stmt.executeUpdate();         
      
      }   
         return "/TeamAkinator/Index.jsp";
      }
      catch(Exception err){
         System.out.println("MypageUpdate : " + err );
      }
      finally{
         pool.freeConnection(con, stmt, rs);
         
      }
      return null;
      
   }

}