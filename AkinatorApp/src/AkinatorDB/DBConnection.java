package AkinatorDB;

import java.sql.Connection;
import java.util.Vector;

public class DBConnection {
	private Connection con=null;	
	private DBConnectionMgr pool=null;
	  
	private Vector connections = new Vector(10); // Vector�� ���ᰴü ���Ѵ�� ����� ���� �÷����̴ϱ� �갡 ��ü��
	  private int _openConnections = 10;
   public Connection connection(){
      pool=DBConnectionMgr.getInstance();
      try {
         con=pool.getConnection();
         
         if(con!=null){
            System.out.println("db���� �����ƽ��ϴ�");
         }else{
            System.out.println("db���� ���� ");
         }
      } catch (Exception e) {
         System.out.println("dbconnection��"+e);
      
   }
      return con;
}

}