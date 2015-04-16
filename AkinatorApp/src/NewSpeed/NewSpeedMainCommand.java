package NewSpeed;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AkinatorDB.DBConnectionMgr;
// 7�� 4�� �ݿ��� �۾��ϴ� ����ħ �����ϳ� ������ ���� ����������

public class NewSpeedMainCommand implements ICommand{
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private String sql;
	private ResultSet rs;
	int productnum = 0;
	int prousernum = 0;
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		int usernum = Integer.parseInt((String)session.getAttribute("usernum"));
		
		try{
		pool = pool.getInstance();
		con = pool.getConnection();
		
		if(con != null){
			System.out.println("NewSpeedMainCommand DB���� ����!");
			}
		
		// 1. ȸ����ȣ�� �ȷο� ���̺��� ��ȸ�ؼ� ��ǰ ��ȣ�� ������.
		sql = "select * from followboard where usernum=" + usernum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			productnum = rs.getInt("productnum");
		}
		
		// 2. ���� ��ǰ��ȣ�� �ٽ� ��ȸ
		sql = "select * from productboard where productnum=" + productnum;
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			prousernum = rs.getInt("usernum");
		}
		
		}
		catch(Exception err){
			System.out.println("NewSpeedMainCommand ����" + err);
		}
		finally{
			pool.freeConnection(con);
		}
		
		return null;
	}

}
