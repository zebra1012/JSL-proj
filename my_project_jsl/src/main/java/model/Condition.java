package model;

public class Condition {
	private Integer startRow;
	private Integer endRow;
	private Integer comment_group;
	private Integer parent_seqno;
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getEndRow() {
		return endRow;
	}
	public void setEndRow(Integer endRow) {
		this.endRow = endRow;
	}
	public Integer getComment_group() {
		return comment_group;
	}
	public void setComment_group(Integer comment_group) {
		this.comment_group = comment_group;
	}
	public Integer getParent_seqno() {
		return parent_seqno;
	}
	public void setParent_seqno(Integer parent_seqno) {
		this.parent_seqno = parent_seqno;
	}
	
}
