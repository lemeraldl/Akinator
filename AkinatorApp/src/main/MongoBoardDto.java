package main;

public class MongoBoardDto {

	String nickname=null;
	double phonenum=0;
	double pwd=0;
	String email=null;
	
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public double getPhonenum() {
		
		return phonenum;
	}
	public void setPhonenum(double d) {
		this.phonenum = d;
	}
	public double getPwd() {
		return pwd;
	}
	public void setPwd(double d) {
		this.pwd = d;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
