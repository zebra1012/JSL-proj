package model;

public class Review {
	private Integer review_seqno,parent_seqno, review_group, review_star;
	private String review_writer, review_content,review_date;
	public Integer getReview_seqno() {
		return review_seqno;
	}
	public void setReview_seqno(Integer review_seqno) {
		this.review_seqno = review_seqno;
	}
	public Integer getParent_seqno() {
		return parent_seqno;
	}
	public void setParent_seqno(Integer parent_seqno) {
		this.parent_seqno = parent_seqno;
	}
	public Integer getReview_group() {
		return review_group;
	}
	public void setReview_group(Integer review_group) {
		this.review_group = review_group;
	}
	public Integer getReview_star() {
		return review_star;
	}
	public void setReview_star(Integer review_star) {
		this.review_star = review_star;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
}
