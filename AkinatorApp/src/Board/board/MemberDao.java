package Board.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import AkinatorDB.DBConnectionMgr;
import Member.MemberDto;

public class MemberDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MemberDao(){
		try{
		pool = pool.getInstance();
		con = pool.getConnection();
		}
		catch(Exception er){
			System.out.println("getMemberDao DB 연결 오류" + er);
		}		
	}

	public MemberDto boardmem(int usernum){
		MemberDto dto = new MemberDto();
	try{		
		con = pool.getConnection();
		String sql = "select * from userboard where usernum=" + usernum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			dto.setMem_id(rs.getString("id"));
			dto.setMem_phone(rs.getString("phonenum"));
			dto.setMem_email(rs.getString("email"));	
			dto.setMem_pass(rs.getString("pass"));
			
		}		
	}	
	catch(Exception err){
		System.out.println("boardmem" + err);
	}
	finally{
		pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	
}
