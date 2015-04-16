package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import AkinatorDB.DBConnection;
import AkinatorDB.DBConnectionMgr;
import Member.FollowcountProductcount;

public class testDao {

	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private DBConnection db = new DBConnection();
	private int zzimInDao;

	public testDao() {

		try {
			con = db.connection();
		} catch (Exception err) {
			System.out.println("DB���� ����");

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

	// ����� ���� ȣ��
	public Vector getSellerInfo() {
		Vector sellerInfo = new Vector();

		try {
			String sql = "select * from productboard order by regDate DESC";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {

				testDto dto = new testDto();

				dto.setSellerName(rs.getString("id"));
				dto.setProduct_num(rs.getInt("productnum"));
				dto.setProductImage(rs.getString("producimg1"));
				dto.setPrice(rs.getString("price"));
				dto.setSubject(rs.getString("goodsName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSellerImage(rs.getString("producimg2"));

				sellerInfo.add(dto);

			}

		} catch (Exception err) {
			System.out.println("testdao�� getSellerInfo �� : " + err);
		} finally {
			freeCon();
		}

		return sellerInfo;
	}

	public Vector getSellerInfoForCate(String cate) {
		Vector sellerInfo = new Vector();
		try {
			String sql = "select * from productBoard where smallCategory='"
					+ cate + "' order by regDate DESC";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {

				testDto dto = new testDto();

				dto.setSellerName(rs.getString("id"));
				dto.setProduct_num(rs.getInt("productnum"));
				dto.setProductImage(rs.getString("producimg1"));
				dto.setPrice(rs.getString("price"));
				dto.setSubject(rs.getString("goodsName"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSellerImage(rs.getString("producimg2"));

				sellerInfo.add(dto);

			}

		} catch (Exception err) {
			System.out.println("getSellerInfo : " + err);
		} finally {
			freeCon();
		}

		return sellerInfo;
	}

	// ��ǰ���� ȣ��
	public Vector getProductInfo(String searchField) {
		Vector productInfo = new Vector();
		String sql = null;

		try {
			con = db.connection();

			if (searchField == null || searchField.isEmpty()
					|| searchField.equals("null")) {
				sql = "select * from productboard order by regDate desc";

			} else {
				sql = "select * from productboard where goodsName like '%"
						+ searchField + "%' order by regDate desc";
			}
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {

				testDto dto = new testDto();

				dto.setSellerName(rs.getString("id"));
				dto.setProduct_num(rs.getInt("productnum"));
				dto.setProductImage(rs.getString("producimg1"));
				dto.setPrice(rs.getString("price"));
				dto.setSubject(rs.getString("goodsName"));
				dto.setRegdate(rs.getString("regdate"));

				productInfo.add(dto);

			}

		} catch (Exception err) {
			System.out.println("getProductInfo : " + err);
		} finally {
			freeCon();
		}

		return productInfo;
	}

	public Vector getProductInfo(String searchField, String countnum) {
		Vector productInfo = new Vector();
		String sql = null;
		try {
			con = db.connection();

			if (searchField == null || searchField.isEmpty()
					|| searchField.equals("null")) {
				sql = "select * from productboard order by countnum desc";

			} else {
				sql = "select * from productboard where goodsName like '%"
						+ searchField + "%' order by countnum desc";
			}
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {

				testDto dto = new testDto();

				dto.setSellerName(rs.getString("id"));
				dto.setProduct_num(rs.getInt("productnum"));
				dto.setProductImage(rs.getString("producimg1"));
				dto.setPrice(rs.getString("price"));
				dto.setSubject(rs.getString("goodsName"));
				dto.setRegdate(rs.getString("regdate"));

				productInfo.add(dto);

			}

		} catch (Exception err) {
			System.out.println("getProductInfo : " + err);
		} finally {
			freeCon();
		}

		return productInfo;
	}

	public Vector getProductInfoForCate(String cate) {
		Vector productInfo = new Vector();

		try {
			String sql = "select * from productBoard where smallCategory='"
					+ cate + "' order by regDate DESC";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				testDto dto = new testDto();

				dto.setSellerName(rs.getString("id"));
				dto.setProduct_num(rs.getInt("productnum"));
				dto.setProductImage(rs.getString("producimg1"));
				dto.setPrice(rs.getString("price"));
				dto.setSubject(rs.getString("goodsName"));
				dto.setRegdate(rs.getString("regdate"));

				productInfo.add(dto);
			}

		} catch (Exception err) {
			System.out.println("getProductInfo : " + err);
		}

		finally {
			freeCon();
		}

		return productInfo;
	}

	public testDto getDetailinfo(int productNum) {

		testDto dto = new testDto();
		try {
			String sql = "select * from productBoard where productnum="
					+ productNum + " order by regDate DESC";

			con = db.connection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
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
				dto.setCountnum(rs.getInt("countnum"));//��ȸ���ε�?? 
				dto.setNum(rs.getInt("usernum"));// ������ ���� 
				System.out.println("getDetailinfo�� rs usernum"+rs.getInt("usernum"));
				System.out.println("getDetailinfo�� dto usernum"+dto.getNum());
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
			}

		} catch (Exception err) {
			System.out.println("getProductInfo : " + err);
		} finally {
			freeCon();
		}

		return dto;
	}

	public void insertCountnum(int productnum) {
		try {
			con = db.connection();
			String sql = "update productboard set countnum=countnum+1 where productnum="
					+ productnum;
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertcountnum ����" + e);
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

	// �� ����Ʈ
	public void updateZzimnum(int productnum, int usernum) {
		try {
			boolean check = false;
			boolean userCheck = false;
			con = db.connection();

			String sql = "select * from zziminteresting where productnum="
					+ productnum;

			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();

			while (rs.next()) {
				// ��ǰ�ִ��� ������ üũ
				if (productnum == rs.getInt("productnum")) {
					check = true;
					if (usernum == rs.getInt("usernum")) {
						userCheck = true;
					}
				}
			}

			// ������ �ϴ°�. �������ش�.
			if (userCheck == false) {
				System.out.println("����ϱ� ����");
				insertZzimnum(productnum, usernum);
			}
			// ������ �����ش�.
			else {
				System.out.println("�򻩱� ����");
				minusZzimnum(productnum, usernum);
			}
		} catch (Exception e) {
			System.out.println("�� ����Ʈ ���� : " + e);
		} finally {
			freeCon();
		}

	}

	// �� �߰�. �� ������ �������ִ� �κ�
	public void insertZzimnum(int productnum, int usernum) {
		try {
			con = db.connection();

			String sql = "insert into zziminteresting(zzim, productnum, usernum) values(zzim.nextVal,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, productnum);
			stmt.setInt(2, usernum);

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
	public void minusZzimnum(int productnum, int usernum) {
		try {
			con = db.connection();

			String sql = "delete from zziminteresting where usernum=" + usernum + " and productnum="+productnum;
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

	// �� ���� ���
	public testDto getZzimnum(int productnum) {

		int time = 0;
		testDto dto_zzim = new testDto();
		try {
			String sql = "select count(*) from zziminteresting where productnum="
					+ productnum;

			con = db.connection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				dto_zzim.setZzimnum(rs.getInt("count(*)"));
			}
		} catch (Exception err) {
			System.out.println("getZzimnum : " + err);
		} finally {
			freeCon();
		}

		return dto_zzim;
	}
	
	// ���̵� �ȷο��� ģ����  
	public FollowcountProductcount getFollowcount(int usernum){
		
		FollowcountProductcount dto_followcount=new FollowcountProductcount();
		try{
			System.out.println("getFollowcount�Լ��� usernum"+usernum);
			String sql="select count(followfriend) from followboard where usernum="+usernum;
			con=db.connection();
			stmt=con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
			dto_followcount.setFollowcount(rs.getInt("count(followfriend)"));
			System.out.println("dao��getfollow�Լ���"+rs.getInt("count(followfriend)"));
			}
			
		}catch(Exception err){
			
			System.out.println("dao FollowcountProductcount�Լ�"+err);
		}
		finally{
			freeCon();
		}
		
		return dto_followcount;
	}
	
	
	//����ڰ� �ø� productī��Ʈ�Ѽ� 
	public  FollowcountProductcount getproductcount(String id){
		
		FollowcountProductcount dto_followcount=new FollowcountProductcount();
		try{
			String sql="select count(goodsName)from productBoard where id="+"'"+id+"'";
			
			
			con=db.connection();
			stmt=con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				dto_followcount.setProductcount(rs.getInt("count(goodsName)"));
			System.out.println("dao�� getproduct�Լ� ��ǰ ���� "+rs.getInt("count(goodsName)"));
			}
			
		}catch(Exception err){
			
			System.out.println("dao getproductcount�Լ�"+err);
		}
		finally{
			freeCon();
		}
		
		return dto_followcount;
	}

	// �˸��ʿ� �� �Լ� 
	public Vector alim(String id){
		
		
		try{
		
			
			
		}catch(Exception err){
			System.out.println("testdao�˸��� �Լ�"+err);
		}
		finally{
			freeCon();
		}
		
		
		return null;
		
	}
	
	

	public void replyupdatepos(Connection con) { // reply ��ġ
		try {
			String sql = "update replyBoard set replypos=replypos+1";
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("replyupdatepos��" + err);
		}
	}

	public void replyupdate(String textarea, int product_num, int usernum,
			String id) { // �亯 ����

		con = db.connection();
		String sql = null;

		sql = "insert into replyBoard(replynum, usernum ,contents, repregdate,productnum,replypos, id)"
				+ " values(replynum.nextVal,?,?,sysdate,?,0,?)";
		System.out.println(sql);
		replyupdatepos(con);

		System.out.println("reply�� try ��");
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, usernum);
			stmt.setString(2, textarea);
			stmt.setInt(3, product_num);
			stmt.setString(4, id);
			stmt.executeUpdate();
			System.out.println("������Ʈ");
		} catch (Exception err) {
			System.out.println("replyupdate��" + err);
		} finally {
			freeCon();
		}
	}

	public Vector getreplylist(int product_num) { // ���ö��� �Ѹ���
		Vector v = new Vector();
		String sql = null;
		con = db.connection();

		try {
			sql = "select * from replyBoard where productnum=" + product_num
					+ " order by replypos";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Replydto redto = new Replydto();

				redto.setId(rs.getString("id"));
				redto.setReplynum(rs.getInt("replynum"));
				redto.setContents(rs.getString("contents"));
				redto.setProductnum(rs.getInt("productnum"));
				redto.setRepregdate(rs.getString("repregdate"));
				redto.setUsernum(rs.getInt("usernum"));
				v.add(redto);
			}
		} catch (Exception e) {

			System.out.println("getreplylist��" + e);
		} finally {
			freeCon();
		}

		return v;
	}

}
