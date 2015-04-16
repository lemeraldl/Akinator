package NewSpeed;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;

public class NewSpeedCommand implements ICommand{
   private Connection con;
   private DBConnectionMgr pool;
   private ResultSet rs;
   private PreparedStatement stmt;
   private HttpSession session;
   private String followme_id, followfriend_id;
   Vector v = new Vector();
   private String sql;
   
   public NewSpeedCommand(){
      try{
         pool = pool.getInstance();
         con = pool.getConnection();
         
         if(con != null){
            System.out.println("NewSpeed DB 연결 성공!");
         }
      }
      catch(Exception err){
         System.out.println("NewSpeed DB 연결 에러" + err);
      }
   }
   // freecon
   public void freeCon() {
      if (con != null)
         try {
            con.close();
         } catch (Exception err) {
         }
      if (stmt != null)
         try {
            stmt.close();
         } catch (Exception err) {
         }
      if (rs != null)
         try {
            rs.close();
         } catch (Exception err) {
         }
   }
   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      boolean check = false;
      boolean userCheck = false;
      
      NewSpeedDto dto = new NewSpeedDto();
      
      v = (Vector)req.getAttribute("newspeed");
      
      for(int i=0; i<v.size(); i++){
         dto = (NewSpeedDto) v.get(i);
      }
      
      System.out.println("newspeedcommand " + dto.getUsernum());      
      try{         
         // follow를 한 사람(구매자)
         sql = "select id from userboard where usernum=?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, dto.getUsernum());
         rs = stmt.executeQuery();
         System.out.println("팔로우");
         while(rs.next()){
            followme_id = rs.getString("id"); // 구매자 아이디      
         }
         // follow를 당한 사람(판매자)
          sql = "select id from productBoard where productnum=?";
          stmt = con.prepareStatement(sql);
          stmt.setInt(1, dto.getProductnum());
          rs = stmt.executeQuery();
          System.out.println("팔로우2");
          while(rs.next()){
             followfriend_id = rs.getString("id");
          }
          System.out.println("팔로우3");
          sql = "select * from followboard where followfriend=?";
          stmt = con.prepareStatement(sql);
          stmt.setString(1, followfriend_id);
          rs = stmt.executeQuery();
          System.out.println("팔로우4");
          while (rs.next()) {
            // 구매자 팔로우 되어있는지 체크
             System.out.println("내가 있나요??"+rs.getString("followme"));
             System.out.println("나랑같아?"+followme_id);
            if (followme_id == rs.getString("followme")||rs.getString("followme")==followme_id||followme_id.equals(rs.getString("followme"))) {
               System.out.println("같다고체크됨");
               
               userCheck = true;
            }
         }
          
       // 없으면 하는것. 생성해준다.
      if (userCheck == false) {
         System.out.println("찜더하기 성공");
         insertFollow(followfriend_id, followme_id);
      }
      // 있으면 지워준다.
      else {
         System.out.println("찜빼기 성공");
         minusFollow(followfriend_id, followme_id);
      }
      /*       
          // follow 친구 추가 쿼리문         
          sql = "insert into followboard(follownum, usernum, followfriend, followme, productnum)"
               + "values(follownum.nextVal, ?, ? ,?, ?)";
   
      stmt= con.prepareStatement(sql);
      stmt.setInt(1, dto.getUsernum());
      stmt.setString(2, followfriend_id);
      stmt.setString(3, followme_id);
      stmt.setInt(4, dto.getProductnum());
      
      stmt.executeUpdate();
      System.out.println("newspeed드드드 " + dto.getProductnum());
      */
      req.setAttribute("productnum", dto.getProductnum());
      System.out.println("팔로우 친구 추가 완료!");
      }
      catch(Exception err){
         System.out.println("NewSpeed 뽤로우 삽입 실패" + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
      return "/TeamAkinator/productdetailProc.jsp?follow=add";
   }
   
   // 찜 추가. 찜 없을때 생성해주는 부분
   public void insertFollow(String followfriend_id, String followme_id) {
      
      NewSpeedDto dto = new NewSpeedDto();
      
      for(int i=0; i<v.size(); i++){
         dto = (NewSpeedDto) v.get(i);
      }
      System.out.println("팔로우??");
      try {
         sql = "insert into followboard(follownum, usernum, followfriend, followme, productnum)"
               + " values(follownum.nextVal, ?, ? ,?, ?)";
         stmt= con.prepareStatement(sql);
         stmt.setInt(1, dto.getUsernum());
         stmt.setString(2, followfriend_id);
         stmt.setString(3, followme_id);
         stmt.setInt(4, dto.getProductnum());
         
         stmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("찜 없을때 생성해주는곳 에러" + e);
      } finally {
         if (con != null)
            try {
               con.close();
            } catch (Exception err) {
            }
         if (stmt != null)
            try {
               stmt.close();
            } catch (Exception err) {
            }
      }
      
   }

   // 찜 빼기
   public void minusFollow(String followfriend_id, String followme_id) {
      try {
         sql = "delete from followboard where followme='" + followme_id + "' and followfriend='"+followfriend_id+"'";
         stmt = con.prepareStatement(sql);

         stmt.executeUpdate();
      } catch (Exception e) {
         System.out.println("찜 뺄때 에러" + e);
      } finally {
         if (con != null)
            try {
               con.close();
            } catch (Exception err) {
            }
         if (stmt != null)
            try {
               stmt.close();
            } catch (Exception err) {
            }
      }
   }

}