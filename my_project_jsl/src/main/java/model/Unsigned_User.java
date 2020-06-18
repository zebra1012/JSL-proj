package model;

public class Unsigned_User { //비회원 정보모델, 비회원이 오픈마켓에서 주문 할 때만 사용한다.
	Integer unsigned_no;
	String unsigned_name,unsigned_addr,unsigned_phone;
	public Integer getUnsigned_no() {
		return unsigned_no;
	}
	public void setUnsigned_no(Integer unsigned_no) {
		this.unsigned_no = unsigned_no;
	}
	public String getUnsigned_name() {
		return unsigned_name;
	}
	public void setUnsigned_name(String unsigned_name) {
		this.unsigned_name = unsigned_name;
	}
	public String getUnsigned_addr() {
		return unsigned_addr;
	}
	public void setUnsigned_addr(String unsigned_addr) {
		this.unsigned_addr = unsigned_addr;
	}
	public String getUnsigned_phone() {
		return unsigned_phone;
	}
	public void setUnsigned_phone(String unsigned_phone) {
		this.unsigned_phone = unsigned_phone;
	}
	
}
