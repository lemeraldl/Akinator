package Board.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import AkinatorDB.DBConnectionMgr;
import Member.MemberDto;

public class BoardDao {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public BoardDao(){
		try{
			
			pool = pool.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}

	public void freeCon(){
		if(con != null) try{con.close();}catch(Exception err){}
		if(stmt != null) try{stmt.close();}catch(Exception err){}
		if(rs != null) try{rs.close();}catch(Exception err){}
	}

	// 글 리스트 가져오기(list.jsp)
	public Vector getBoardList(String keyField, String keyWord){
		Vector v = new Vector();
		String sql;
		try{
			con = pool.getConnection();
			if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "select * from tblBoard order by pos";
			}
			else{
				sql = "select * from tblboard where " + keyField + 
					" like '%" + keyWord + "%' order by pos";
			}

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("Content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));			
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));

				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList : " + err);
		}
		finally{
			freeCon();
		}

		return v;
	}

	// MVC 
	// 글 저장하기
	public void updatePos(Connection con){
		try{
			
			con = pool.getConnection();
			String sql = "update tblBoard set pos = pos+1";
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
		}
		catch(Exception err){ System.out.println("updatePos : " + err); }
	}

	public void insertBoard(BoardDto dto){
		String sql = "insert into tblBoard(num, name, email, phone,"
			+ "subject, content, pos, depth, regdate, pass, count, ip) "
			+ "values(seq_numboard.nextVal, ?,?,?,?,?,0,0,sysdate,?,0,?)";

		try{
			
			updatePos(con);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getEmail());
			stmt.setString(3, dto.getPhone());			
			stmt.setString(4, dto.getSubject());
			stmt.setString(5, dto.getContent());			
			stmt.setString(7, dto.getIp());

			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard : " + err);
		}
		finally{
			freeCon();
		}
	}

	// 글 내용 보기(read.jsp, update.jsp)
	public BoardDto getBoard(int num){
		BoardDto dto = new BoardDto();
		String sql = "";
		try{
			con = pool.getConnection();

			sql = "update tblboard set count=count+1 where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();

			sql = "select * from tblboard where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
			}
			
			sql = "select * from tblboard where num=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if(rs.next()){
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));				
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
			}
		}
		catch(Exception err){
			System.out.println("getBoard : " + err);
		}
		finally{
			freeCon();
		}

		return dto;
	}

	// 글 수정(UpdateProc.jsp)
	public void updateBoard(BoardDto dto){
		try{
			String sql = "update tblboard set name=?, email=?, " +
				"subject=?, content=? where num=?";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getEmail());
			stmt.setString(3, dto.getSubject());
			stmt.setString(4, dto.getContent());
			stmt.setInt(5, dto.getNum());

			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard : " + err);
		}
		finally{
			freeCon();
		}
	}

	// 글 삭제
	public void deleteBoard(int num){
		System.out.println("deleteboard로 왔다");
		System.out.println(num);
		try{
			String sql = "delete from tblboard where num=?";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteBoard : " + err);
		}
		finally{
			freeCon();
		}
	}

	// 답변 달기
	public void replyUpdatePos(BoardDto dto){
		try{
			String sql = "update tblboard set pos=pos+1 where pos>?";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getPos());
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyUpdatePos : " + err);
		}
		finally{
			freeCon();
		}
	}

	public void replyBoard(BoardDto dto){
		try{
			String sql = "insert into tblBoard(num, name, email, phone,"
					+ "subject, content, pos, depth, regdate, pass, count, ip) "
					+ "values(seq_num.nextVal, ?,?,?,?,?,?,?,sysdate,?,0,?)";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getEmail());
			stmt.setString(3, dto.getPhone());
			stmt.setString(4, dto.getSubject());
			stmt.setString(5, dto.getContent());
			stmt.setInt(6, dto.getPos()+1);
			stmt.setInt(7, dto.getDepth()+1);
			
			stmt.setString(9, dto.getIp());

			stmt.executeUpdate();                                            
		}
		catch(Exception err){
			System.out.println("replyBoard : " + err);
		}
		finally{
			freeCon();
		}
	}

	// 들여 쓰기
	public String useDepth(int depth){
		String result = "";
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}

		return result;
	}
	
	
}
