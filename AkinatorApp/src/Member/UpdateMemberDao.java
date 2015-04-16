package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import main.testDto;
import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;
// ȸ������ ���� �κ�(�ش��ϴ� ����� ȸ������ �ѷ��ִ� �κ�)
public class UpdateMemberDao {
   
   private Connection con;
   private PreparedStatement stmt;
   private ResultSet rs;
   private DBConnectionMgr pool;
   private DBConnection db = new DBConnection();
   private MemberDto dto = new MemberDto();
   public UpdateMemberDao() {
   
      try{
      con = db.connection();
      }
      catch(Exception err){
         System.out.println("DB���� ����");
         
         }
   }
   
   public void freeCon() {
      if(con!=null) try{con.close();}catch(Exception err) {}
      if(stmt!=null) try{stmt.close();}catch(Exception err) {}
      if(rs!=null) try{rs.close();}catch(Exception err) {}
   }
   
   // ����� ���� ȣ�� 
   public MemberDto getMemberInfo(int usernum) {
	   
	      
	      try {
	         String sql="select * from UserBoard where usernum="+usernum;            
	         
	         con = db.connection();
	         stmt=con.prepareStatement(sql);
	      
	         rs=stmt.executeQuery();
	         while(rs.next()) {
	            dto.setMem_num(rs.getInt("usernum"));
	            dto.setMem_id(rs.getString("id"));               
	            dto.setMem_pass(rs.getString("pass"));            
	            dto.setMem_email(rs.getString("email"));
	            dto.setMem_phone(rs.getString("phonenum"));
//	            dto.setJuminnum(rs.getInt("juminnum"));
//	            dto.setProfileimage(rs.getString("profileimage"));
	         }
	      } catch (Exception err) {
	         System.out.println("getmemberInfo : " +err );
	      }
	      finally{
	         freeCon();
	      }
	      
	      return dto;
	   }
   public Vector getMemberInfoVector() {
	   
	      
	   Vector v= new Vector();
	      try {
	         String sql="select * from UserBoard";            
	         
	         con = db.connection();
	         stmt=con.prepareStatement(sql);
	      
	         rs=stmt.executeQuery();
	         while(rs.next()) {
	        	MemberDto dto = new MemberDto();
	            
	        	dto.setMem_num(rs.getInt("usernum"));
	            dto.setMem_id(rs.getString("id"));               
	            dto.setMem_pass(rs.getString("pass"));            
	            dto.setMem_email(rs.getString("email"));
	            dto.setMem_phone(rs.getString("phonenum"));
	            
	            v.add(dto);
	         }
	      } catch (Exception err) {
	         System.out.println("getmemberInfoVector : " +err );
	      }
	      finally{
	         freeCon();
	      }
	      
	      return v;
	   }
   
   public void DeleteMember(int num){
	   try{
		   String sql = "DELETE FROM userboard WHERE usernum=?";
		   con = db.connection();
		   stmt= con.prepareStatement(sql);
		   stmt.setInt(1, num);
		   System.out.println(sql);
		   stmt.executeUpdate();
	   }
	   catch(Exception e){
		   System.out.println("DeleteMember : " + e);
	   }
	   finally{
		   freeCon();
	   }
   }
//   public void DeleteMemberDao(int num){
//         try{
//            System.out.println("Ż�� �� �̻��� ���� ���Խ�Ű����" + dto.getMem_phone());
//               String sql = "DELETE FROM userboard WHERE usernum=?";
//               con = db.connection();
//               stmt= con.prepareStatement(sql);
//               stmt.setInt(1, num);
//               System.out.println(sql);
//               stmt.executeUpdate();
//            }
//         catch(Exception e){
//            System.out.println("deleteMember : " + e);
//            }
//         finally{
//            freeCon();
//         }
//      }
}