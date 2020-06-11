package dao;

import model.Condition;

public interface SHCommentDao {
	
	public Integer getMaxSeqno();
	public Integer getMaxGroup(Integer parent);
	public Integer getMaxOrder(Condition c);
}
