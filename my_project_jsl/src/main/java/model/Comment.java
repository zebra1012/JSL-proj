package model;

public class Comment {
	private Integer comment_seqno,parent_seqno,comment_group,comment_order,comment_type;
	private String comment_date,comment_content,comment_pwd,comment_writer;
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public Integer getComment_seqno() {
		return comment_seqno;
	}
	public void setComment_seqno(Integer comment_seqno) {
		this.comment_seqno = comment_seqno;
	}
	public Integer getParent_seqno() {
		return parent_seqno;
	}
	public void setParent_seqno(Integer parent_seqno) {
		this.parent_seqno = parent_seqno;
	}
	public Integer getComment_group() {
		return comment_group;
	}
	public void setComment_group(Integer comment_group) {
		this.comment_group = comment_group;
	}
	public Integer getComment_order() {
		return comment_order;
	}
	public void setComment_order(Integer comment_order) {
		this.comment_order = comment_order;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_pwd() {
		return comment_pwd;
	}
	public void setComment_pwd(String comment_pwd) {
		this.comment_pwd = comment_pwd;
	}
	public Integer getComment_type() {
		return comment_type;
	}
	public void setComment_type(Integer comment_type) {
		this.comment_type = comment_type;
	}
	
}