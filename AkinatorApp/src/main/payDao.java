package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import akinator.DataDto;

public class payDao {
   
   private Connection con;
   private PreparedStatement stmt;
   private ResultSet rs;
   private DataSource ds;
   
   public payDao(){
      try{
         Context ctx = new InitialContext();
         ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
      }catch(Exception e){
         System.out.println("DB연결 실패 : " + e);
      }
   }

   public void freeCon(){
      if(con != null)try{con.close();}catch(Exception e){}
      if(stmt != null)try{stmt.close();}catch(Exception e){}
      if(rs != null)try{rs.close();}catch(Exception e){}
   }

   // 결제 insert 
   
   
   public void insertpay(payDto dto , int usernum){
      
      payDto p_dto=dto;
      try{
         String sql = "insert into ord(ordnum, ordname, buynumber, ordbank, ordaccountnum, orddate, price, usernum)"
               + " values(ordnum.nextVal,?,?,?,?,sysdate,?,?)";
         
      
      
            
         
            con = ds.getConnection();
            stmt = con.prepareStatement(sql);
            
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1, dto.getOrdname());
            stmt.setInt(2, dto.getBuynumber());
            stmt.setString(3, dto.getOrdbank());
            stmt.setString(4, dto.getOrdaccountnum());
            //stmt.setString(5, dto.getOrddate());
            stmt.setInt(5, dto.getPrice());
            stmt.setInt(6, usernum);
            
         
            stmt.executeUpdate();
         }
         catch(Exception e){
            System.out.println("insertpay : " + e);
         }
         finally{
            freeCon();
         }
      }

}




































