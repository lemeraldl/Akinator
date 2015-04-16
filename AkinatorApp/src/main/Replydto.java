package main;
public class Replydto {
      int replynum=0;
   int usernum=0;
   String contents=null;
   String repregdate=null;
   int productnum=0;
   private String id;
   public String getId() {
	return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReplynum() {
      return replynum;
   }
   public void setReplynum(int replynum) {
      this.replynum = replynum;
   }
   public int getUsernum() {
      return usernum;
   }
   public void setUsernum(int usernum) {
      this.usernum = usernum;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getRepregdate() {
      return repregdate;
   }
   public void setRepregdate(String repregdate) {
      this.repregdate = repregdate;
   }
   public int getProductnum() {
      return productnum;
   }
   public void setProductnum(int productnum) {
      this.productnum = productnum;
   }
   
}