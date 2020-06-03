package model;

public class AdminUser {
	private String admin_id, admin_pwd;
	private Integer admin_power;
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public Integer getAdmin_power() {
		return admin_power;
	}
	public void setAdmin_power(Integer admin_power) {
		this.admin_power = admin_power;
	}
	
}
