package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.BBSDao;
import model.BBS;
import model.BBS_Hot;
import model.Condition;

@Repository
public class BBSDaoImpl implements BBSDao {
	@Autowired
	SqlSession session;
	
	public Integer getMaxSeqno() {
		Integer max= session.selectOne("BBSMapper.getMaxSeqno");
		if (max==null) max=1;
		else max+=1;
		return max;
	}

	public void insertBBS(BBS bbs) {
		session.insert("BBSMapper.insertBBS", bbs);
	}

	public List<BBS> getFreeBBSList(Condition c) {
		return session.selectList("BBSMapper.getFreeBBSList", c);
	}

	public Integer getFreeBBSTotal() {
		return session.selectOne("BBSMapper.getFreeBBSTotal");
	}

	public BBS getBBSDetail(Integer seqno) {
		return session.selectOne("BBSMapper.getBBSDetail", seqno);
	}

	public void addHot(Integer seqno) {
		session.update("BBSMapper.addHot", seqno);
		
	}

	public Integer checkHot(BBS_Hot model) {
		return session.selectOne("BBSMapper.checkHot",model);
	}

	public void addHotTable(BBS_Hot model) {
		session.insert("BBSMapper.addHotTable", model);
	}

	public void deleteBBS(Integer seqno) {
		session.delete("BBSMapper.deleteBBS",seqno);
	}
	public String getBBSImage(Integer seqno) {
		return session.selectOne("BBSMapper.getBBSImage",seqno);
	}

	public void modifyBBS(BBS bbs) {
		session.update("BBSMapper.modifyBBS",bbs);
		
	}

	public Integer getHobbitBBSTotal() {
		return session.selectOne("BBSMapper.getHobbitBBSTotal");
	}

	public Integer getReadBBSTotal() {
		return session.selectOne("BBSMapper.getReadBBSTotal");
	}

	public List<BBS> getHobbitBBSList(Condition c) {
		return session.selectList("BBSMapper.getHobbitBBSList", c);
	}

	public List<BBS> getReadBBSList(Condition c) {
		return session.selectList("BBSMapper.getReadBBSList",c);
	}

	public List<BBS> getMineBBS(String writer) {
		return session.selectList("BBSMapper.getMineBBS",writer);
	}

	public List<BBS> getFreeByWriter(String writer) {
		return session.selectList("BBSMapper.getFreeByWriter",writer);
	}

	public List<BBS> getFreeByContent(String content) {
		return session.selectList("BBSMapper.getFreeByContent",content);
	}

	public List<BBS> getFreeByTitle(String title) {
		return session.selectList("BBSMapper.getFreeByTitle",title);
	}

	public List<BBS> getHobbitByWriter(String writer) {
		return session.selectList("BBSMapper.getHobbitByWriter",writer);
	}

	public List<BBS> getHobbitByContent(String content) {
		return session.selectList("BBSMapper.getHobbitByContent",content);
	}

	public List<BBS> getHobbitByTitle(String title) {
		return session.selectList("BBSMapper.getHobbitByTitle",title);
	}

	public List<BBS> getReadByWriter(String writer) {
		return session.selectList("BBSMapper.getReadByWriter",writer);
	}

	public List<BBS> getReadByContent(String content) {
		return session.selectList("BBSMapper.getReadByContent",content);
	}

	public List<BBS> getReadByTitle(String title) {
		return session.selectList("BBSMapper.getReadByTitle",title);
	}
	
	
}
