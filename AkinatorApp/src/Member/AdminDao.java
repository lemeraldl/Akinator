package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import main.testDto;
import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;

public class AdminDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private DBConnection db = new DBConnection();
	private MemberDto dto = new MemberDto();

	public AdminDao() {
		try {
			con = db.connection();
		} catch (Exception err) {
			System.out.println("DB연결 에러");
		}
	}

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

	public Vector getMemberInfo() {

		Vector v = new Vector();
		try {
			String sql = "select * from UserBoard";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();

				dto.setMem_num(rs.getInt("usernum"));
				dto.setMem_id(rs.getString("id"));
				dto.setMem_pass(rs.getString("pass"));
				dto.setMem_email(rs.getString("email"));
				dto.setMem_phone(rs.getString("phonenum"));

				v.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getmemberInfo : " + err);
		} finally {
			freeCon();
		}

		return v;
	}

	public void DeleteMember(int num) {
		try {
			String sql = "DELETE FROM userboard WHERE usernum=?";
			con = db.connection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			System.out.println(sql);
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DeleteMember : " + e);
		} finally {
			freeCon();
		}
	}
	
	public void DeleteProduct(int productnum) {
		try {
			String sql = "DELETE FROM productBoard WHERE productnum=?";
			con = db.connection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, productnum);
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("DeleteProduct : " + e);
		} finally {
			freeCon();
		}
	}
	
	public Vector getProductInfo() {

		Vector v = new Vector();
		try {
			String sql = "select * from ProductBoard";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				testDto dto = new testDto();
				
				dto.setProduct_num(rs.getInt("productnum"));               
               dto.setProductImage(rs.getString("producimg1"));
               dto.setProductImage1(rs.getString("producimg2"));
               dto.setProductImage2(rs.getString("producimg3"));
               dto.setProductImage3(rs.getString("producimg4"));
               dto.setProductImage4(rs.getString("producimg5"));
               dto.setProductImage5(rs.getString("producimg6"));
               dto.setPrice(rs.getString("price"));
               dto.setSubject(rs.getString("goodsName"));
               dto.setRegdate(rs.getString("regdate"));
               dto.setCountnum(rs.getInt("countnum"));
               
               dto.setProductcontents(rs.getString("productcontents"));
               dto.setSellerName(rs.getString("id"));
               dto.setBuydate(rs.getString("buydate"));
               dto.setSepaycheck(rs.getString("sepaycheck"));
               dto.setDelipaycheck(rs.getString("delipaycheck"));
               dto.setTradecheck(rs.getString("tradecheck"));
               dto.setBigCategory(rs.getString("bigCategory"));
               dto.setSmallCategory(rs.getString("smallCategory"));
               dto.setUseddegree(rs.getString("useddegree"));
               dto.setTag(rs.getString("tag"));
               dto.setQuantity(rs.getInt("quantity"));
				
				v.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getmemberInfo : " + err);
		} finally {
			freeCon();
		}

		return v;
	}
}
