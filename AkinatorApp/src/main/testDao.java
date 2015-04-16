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
			System.out.println("DB연결 에러");

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

	// 사용자 정보 호출
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
			System.out.println("testdao의 getSellerInfo 쪽 : " + err);
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

	// 상품정보 호출
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
				dto.setCountnum(rs.getInt("countnum"));//조회수인듯?? 
				dto.setNum(rs.getInt("usernum"));// 유저넘 세팅 
				System.out.println("getDetailinfo쪽 rs usernum"+rs.getInt("usernum"));
				System.out.println("getDetailinfo쪽 dto usernum"+dto.getNum());
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
			System.out.println("insertcountnum 에러" + e);
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

	// 찜 프론트
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
				// 상품있는지 없는지 체크
				if (productnum == rs.getInt("productnum")) {
					check = true;
					if (usernum == rs.getInt("usernum")) {
						userCheck = true;
					}
				}
			}

			// 없으면 하는것. 생성해준다.
			if (userCheck == false) {
				System.out.println("찜더하기 성공");
				insertZzimnum(productnum, usernum);
			}
			// 있으면 지워준다.
			else {
				System.out.println("찜빼기 성공");
				minusZzimnum(productnum, usernum);
			}
		} catch (Exception e) {
			System.out.println("찜 프론트 에러 : " + e);
		} finally {
			freeCon();
		}

	}

	// 찜 추가. 찜 없을때 생성해주는 부분
	public void insertZzimnum(int productnum, int usernum) {
		try {
			con = db.connection();

			String sql = "insert into zziminteresting(zzim, productnum, usernum) values(zzim.nextVal,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, productnum);
			stmt.setInt(2, usernum);

			stmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("찜 없을때 생성해주는곳 에러" + e);
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

	// 찜 빼기
	public void minusZzimnum(int productnum, int usernum) {
		try {
			con = db.connection();

			String sql = "delete from zziminteresting where usernum=" + usernum + " and productnum="+productnum;
			stmt = con.prepareStatement(sql);

			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("찜 뺄때 에러" + e);
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

	// 찜 개수 출력
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
	
	// 아이디가 팔로우한 친구수  
	public FollowcountProductcount getFollowcount(int usernum){
		
		FollowcountProductcount dto_followcount=new FollowcountProductcount();
		try{
			System.out.println("getFollowcount함수쪽 usernum"+usernum);
			String sql="select count(followfriend) from followboard where usernum="+usernum;
			con=db.connection();
			stmt=con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
			dto_followcount.setFollowcount(rs.getInt("count(followfriend)"));
			System.out.println("dao쪽getfollow함수쪽"+rs.getInt("count(followfriend)"));
			}
			
		}catch(Exception err){
			
			System.out.println("dao FollowcountProductcount함수"+err);
		}
		finally{
			freeCon();
		}
		
		return dto_followcount;
	}
	
	
	//사용자가 올린 product카운트한수 
	public  FollowcountProductcount getproductcount(String id){
		
		FollowcountProductcount dto_followcount=new FollowcountProductcount();
		try{
			String sql="select count(goodsName)from productBoard where id="+"'"+id+"'";
			
			
			con=db.connection();
			stmt=con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				dto_followcount.setProductcount(rs.getInt("count(goodsName)"));
			System.out.println("dao쪽 getproduct함수 상품 개수 "+rs.getInt("count(goodsName)"));
			}
			
		}catch(Exception err){
			
			System.out.println("dao getproductcount함수"+err);
		}
		finally{
			freeCon();
		}
		
		return dto_followcount;
	}

	// 알림쪽에 쓸 함수 
	public Vector alim(String id){
		
		
		try{
		
			
			
		}catch(Exception err){
			System.out.println("testdao알림쪽 함수"+err);
		}
		finally{
			freeCon();
		}
		
		
		return null;
		
	}
	
	

	public void replyupdatepos(Connection con) { // reply 위치
		try {
			String sql = "update replyBoard set replypos=replypos+1";
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("replyupdatepos쪽" + err);
		}
	}

	public void replyupdate(String textarea, int product_num, int usernum,
			String id) { // 답변 쓰기

		con = db.connection();
		String sql = null;

		sql = "insert into replyBoard(replynum, usernum ,contents, repregdate,productnum,replypos, id)"
				+ " values(replynum.nextVal,?,?,sysdate,?,0,?)";
		System.out.println(sql);
		replyupdatepos(con);

		System.out.println("reply쪽 try 밖");
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, usernum);
			stmt.setString(2, textarea);
			stmt.setInt(3, product_num);
			stmt.setString(4, id);
			stmt.executeUpdate();
			System.out.println("업데이트");
		} catch (Exception err) {
			System.out.println("replyupdate쪽" + err);
		} finally {
			freeCon();
		}
	}

	public Vector getreplylist(int product_num) { // 리플라이 뿌리기
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

			System.out.println("getreplylist쪽" + e);
		} finally {
			freeCon();
		}

		return v;
	}

}
