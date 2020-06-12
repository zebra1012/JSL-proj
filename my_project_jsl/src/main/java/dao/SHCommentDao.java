package dao;

import java.util.List;

import model.Comment;
import model.Condition;

public interface SHCommentDao {
	
	public Integer getMaxSeqno();
	public Integer getMaxGroup(Integer parent);
	public Integer getMaxOrder(Condition c);
	public void insertComment(Comment comment);
	public List<Comment> getCommentList(Integer parent);
	public Comment getComment(Integer seqno);
	public void deleteComment(Integer seqno);
	public void updateComment(Comment comment);
}
