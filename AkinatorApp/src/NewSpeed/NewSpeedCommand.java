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
            System.out.println("NewSpeed DB ���� ����!");
         }
      }
      catch(Exception err){
         System.out.println("NewSpeed DB ���� ����" + err);
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
         // follow�� �� ���(������)
         sql = "select id from userboard where usernum=?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, dto.getUsernum());
         rs = stmt.executeQuery();
         System.out.println("�ȷο�");
         while(rs.next()){
            followme_id = rs.getString("id"); // ������ ���̵�      
         }
         // follow�� ���� ���(�Ǹ���)
          sql = "select id from productBoard where productnum=?";
          stmt = con.prepareStatement(sql);
          stmt.setInt(1, dto.getProductnum());
          rs = stmt.executeQuery();
          System.out.println("�ȷο�2");
          while(rs.next()){
             followfriend_id = rs.getString("id");
          }
          System.out.println("�ȷο�3");
          sql = "select * from followboard where followfriend=?";
          stmt = con.prepareStatement(sql);
          stmt.setString(1, followfriend_id);
          rs = stmt.executeQuery();
          System.out.println("�ȷο�4");
          while (rs.next()) {
            // ������ �ȷο� �Ǿ��ִ��� üũ
             System.out.println("���� �ֳ���??"+rs.getString("followme"));
             System.out.println("��������?"+followme_id);
            if (followme_id == rs.getString("followme")||rs.getString("followme")==followme_id||followme_id.equals(rs.getString("followme"))) {
               System.out.println("���ٰ�üũ��");
               
               userCheck = true;
            }
         }
          
       // ������ �ϴ°�. �������ش�.
      if (userCheck == false) {
         System.out.println("����ϱ� ����");
         insertFollow(followfriend_id, followme_id);
      }
      // ������ �����ش�.
      else {
         System.out.println("�򻩱� ����");
         minusFollow(followfriend_id, followme_id);
      }
      /*       
          // follow ģ�� �߰� ������         
          sql = "insert into followboard(follownum, usernum, followfriend, followme, productnum)"
               + "values(follownum.nextVal, ?, ? ,?, ?)";
   
      stmt= con.prepareStatement(sql);
      stmt.setInt(1, dto.getUsernum());
      stmt.setString(2, followfriend_id);
      stmt.setString(3, followme_id);
      stmt.setInt(4, dto.getProductnum());
      
      stmt.executeUpdate();
      System.out.println("newspeed���� " + dto.getProductnum());
      */
      req.setAttribute("productnum", dto.getProductnum());
      System.out.println("�ȷο� ģ�� �߰� �Ϸ�!");
      }
      catch(Exception err){
         System.out.println("NewSpeed ��ο� ���� ����" + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
      return "/TeamAkinator/productdetailProc.jsp?follow=add";
   }
   
   // �� �߰�. �� ������ �������ִ� �κ�
   public void insertFollow(String followfriend_id, String followme_id) {
      
      NewSpeedDto dto = new NewSpeedDto();
      
      for(int i=0; i<v.size(); i++){
         dto = (NewSpeedDto) v.get(i);
      }
      System.out.println("�ȷο�??");
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
         System.out.println("�� ������ �������ִ°� ����" + e);
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

   // �� ����
   public void minusFollow(String followfriend_id, String followme_id) {
      try {
         sql = "delete from followboard where followme='" + followme_id + "' and followfriend='"+followfriend_id+"'";
         stmt = con.prepareStatement(sql);

         stmt.executeUpdate();
      } catch (Exception e) {
         System.out.println("�� ���� ����" + e);
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