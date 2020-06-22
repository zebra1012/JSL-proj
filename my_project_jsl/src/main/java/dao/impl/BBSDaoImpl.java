package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.BBSDao;
import model.BBS;
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
	
	

}
