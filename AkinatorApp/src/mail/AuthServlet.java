package mail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;
/*
 * public testDao() {
   
      try{
      con = db.connection();
      }
      catch(Exception err){
         System.out.println("DB���� ����");
         
         }
      }
      
   //freecon
      public void freeCon() {
         if(con!=null) try{con.close();}catch(Exception err) {}
         if(stmt!=null) try{stmt.close();}catch(Exception err) {}
         if(rs!=null) try{rs.close();}catch(Exception err) {}
      }
      
 */

public class AuthServlet extends HttpServlet {
  
	   @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		   doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	private Connection con = null;
	   private PreparedStatement stmt = null;
	   private ResultSet rs = null;
	   private DBConnectionMgr pool = null;
	   private DBConnection db = new DBConnection();
	   
	   
	 
	   
	   public AuthServlet() {
	   try{
		      con = db.connection();
		      }
		      catch(Exception err){
		         System.out.println("DB���� ����");
		         
		         }
		      }
		      
		   //freecon
		      public void freeCon() {
		         if(con!=null) try{con.close();}catch(Exception err) {}
		         if(stmt!=null) try{stmt.close();}catch(Exception err) {}
		         if(rs!=null) try{rs.close();}catch(Exception err) {}
		      }


	//����Ű ����
	public static String getRandomKey(int len)
	{
	    int nSeed = 0;
	    int nSeedSize = 10;
	    String strSrc = "0123456789";
	    String strKey = "";
	    

	    for(int i=0; i<len; i++)
	    {
	        nSeed = (int)(Math.random() * nSeedSize) + 1;
	        strKey += String.valueOf(strSrc.charAt(nSeed-1));
	    }

	    return strKey;
	    
	}
	
	// authinfo ���̺� ��ȭ��ȣ, ����Ű �Է� 
	
	public void insertAuthno(String phonenum, String authno ) {
		System.out.println("���Ϸ� ������ ������ȣ : " +authno);
		System.out.println("�Է¹��� ��ȭ��ȣ : " +phonenum);
		   
		 String sql = "";
		  try{
	            con = db.connection();
	            sql = "insert into authinfo(phonenum, authno, authcomplete) values(?,?,'n')";
	            stmt = con.prepareStatement(sql);
	            stmt.setString(1, phonenum);
	            stmt.setString(2, authno);
	            stmt.executeUpdate();
	         }
	         catch(Exception e){
	            System.out.println("insertAuthinfo ����" + e);
	         }
	         finally{
	            if(con!=null) try{con.close();}catch(Exception err) {}
	            if(stmt!=null) try{stmt.close();}catch(Exception err) {}
	         }
	}
	
	
		  public  String compareAuthno(String phonenum, String inputauth ) {
				//System.out.println("���Ϸ� ������ ������ȣ : " +authno);
				System.out.println("�Է¹��� ������ȣ : " +inputauth);
				System.out.println("�Է¹��� ��ȭ��ȣ : " +phonenum);
				   
				 String sql = "";
				 String sql1="";
				  try{
			            con = db.connection();
			            sql = "select authno from authinfo where phonenum ="+phonenum;
			            stmt = con.prepareStatement(sql);
			       
			           rs=stmt.executeQuery(sql);
			           while(rs.next()){
			        	   
			        	   if(rs.getString("authno").equals(inputauth)) {
			           
			            	sql1="update authinfo set authcomplete='y' where phonenum="+phonenum;
			            	stmt.executeUpdate(sql1);
			            	System.out.println("���� ��ȣ ��ġ :" +stmt.executeQuery(sql1) );
			            	
			            	return "�����Ǿ����ϴ�.";
			        	   } //else
						
			            }
			         }
			         catch(Exception e){
			            System.out.println("compareAuthno ����" + e);
			         }
			         finally{
			            if(con!=null) try{con.close();}catch(Exception err) {}
			            if(stmt!=null) try{stmt.close();}catch(Exception err) {}
			         }
		  return "������ȣ�� Ʋ���ϴ�.";
	}

}
