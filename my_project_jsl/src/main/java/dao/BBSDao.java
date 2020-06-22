package dao;

import java.util.List;

import model.BBS;
import model.Condition;

public interface BBSDao {
	
	
	public Integer getMaxSeqno();
	public void insertBBS(BBS bbs);
	public List<model.BBS> getFreeBBSList(Condition c);
	public Integer getFreeBBSTotal();
	public BBS getBBSDetail(Integer seqno);
	public void addHot(Integer seqno);
}
