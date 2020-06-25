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
	public List<BBS> getFreeByWriter(String writer);
	public List<BBS> getFreeByContent(String content);
	public List<BBS> getFreeByTitle(String title);
	public List<BBS> getHobbitByWriter(String writer);
	public List<BBS> getHobbitByContent(String content);
	public List<BBS> getHobbitByTitle(String title);
	public List<BBS> getReadByWriter(String writer);
	public List<BBS> getReadByContent(String content);
	public List<BBS> getReadByTitle(String title);
}
