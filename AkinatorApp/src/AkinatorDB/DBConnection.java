package AkinatorDB;

import java.sql.Connection;
import java.util.Vector;

public class DBConnection {
	private Connection con=null;	
	private DBConnectionMgr pool=null;
	  
	private Vector connections = new Vector(10); // Vector는 연결객체 무한대로 만들수 있음 컬렉션이니깐 얘가 객체다
	  private int _openConnections = 10;
   public Connection connection(){
      pool=DBConnectionMgr.getInstance();
      try {
         con=pool.getConnection();
         
         if(con!=null){
            System.out.println("db연결 성공됐습니다");
         }else{
            System.out.println("db연결 실패 ");
         }
      } catch (Exception e) {
         System.out.println("dbconnection쪽"+e);
      
   }
      return con;
}

}