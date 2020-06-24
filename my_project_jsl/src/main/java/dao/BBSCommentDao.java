package dao;

import java.util.List;

import model.Comment;
import model.Condition;

public interface BBSCommentDao {
	public Integer getMaxSeqno();
	public Integer getMaxGroup(Integer parent);
	public Integer getMaxOrder(Condition c);
	public void insertBBSComment(Comment comment);
	public List<Comment> getBBSCommentList(Integer parent);
	public Comment getBBSComment(Integer seqno);
	public void deleteBBSComment(Integer seqno);
	public void updateBBSComment(Comment comment);
	
}
