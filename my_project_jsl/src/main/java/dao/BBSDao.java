package dao;

import java.util.List;

import model.BBS;
import model.BBS_Hot;
import model.Condition;

public interface BBSDao {
	
	
	public Integer getMaxSeqno();
	public void insertBBS(BBS bbs);
	public List<model.BBS> getFreeBBSList(Condition c);
	public List<model.BBS> getHobbitBBSList(Condition c);
	public List<model.BBS> getReadBBSList(Condition c);
	public Integer getFreeBBSTotal();
	public Integer getHobbitBBSTotal();
	public Integer getReadBBSTotal();
	public BBS getBBSDetail(Integer seqno);
	public void addHot(Integer seqno);
	public Integer checkHot(BBS_Hot model);
	public void addHotTable(BBS_Hot model);
	public void deleteBBS(Integer seqno);
	public String getBBSImage(Integer seqno);
	public void modifyBBS(BBS bbs);
	public List<model.BBS> getMineBBS(String writer);
}
